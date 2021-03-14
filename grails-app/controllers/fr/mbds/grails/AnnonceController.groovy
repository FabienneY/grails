package fr.mbds.grails

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import  java.io.File

@Secured(value=["hasAnyRole('ROLE_ADMIN','ROLE_MOD')"])

class AnnonceController {

    AnnonceService annonceService

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond annonceService.list(params), model:[annonceCount: annonceService.count()]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        respond new Annonce(params)
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        println request.getFile("file").inputStream.text
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id)

    }

    def update() {
        def annonce = Annonce.get(params.id)
        if (annonce == null) {
            notFound()
            return
        }

        annonce.title = params.title
        annonce.description = params.description
        annonce.price = Float.parseFloat(params.price)


        def file = request.getFile('file')
          while (file.exists())
          {
            // randonName= getRandomStr(15)+file.originalFilename
            String chemin_du_fichier = grailsApplication.config.illustration.path + file.originalFilename
            file.transferTo(new File(chemin_du_fichier))
            annonce.addToIllustrations(filename: file.originalFilename)
          }




        /**
         * 1. On récupère le fichier depuis la requête (request)
         * 2. On sauvegarde le fichier sur le systeme de fichier local (sur le disque)
         *      - On génère un nom de fichier aléatoire et long
         *      - On vérifie que le fichier n'est pas déjà présent sur le système de fichier
         *      - Si tout est bon on peut sauvegarder le fichier reçu (request) sur le disque
         * 3. On crée une instance d'Illustration associée à l'image que l'on a sauvegardé
         * 4. On associe l'Illustration à l'annonce courante
         */

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
