package fr.mbds.grails

import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

@Secured(value=["hasRole('ROLE_ADMIN')"])
class ApiController {

  AnnonceService annonceService

  // Annonce Singleton
  // Requêtes GET / PUT / DELETE / PATCH
  // Joignable sur /api/annonce/id
  def annonce() {
    switch(request.getMethod())
    {
      case "GET":
        if(!params.id)
          return response.status = 400
        def annonceInstance = Annonce.get(params.id)
        if(!annonceInstance)
          return  response.status = 404
        doSerialize(annonceInstance)
        break

      case "PUT":
        AnnonceService annonceService
        def annonceInstance = Annonce.get(params.id)
        annonceService.save(annonceInstance)
        render "L'annonce "+params.id + " a été modifiée"
        break

      case "PATCH":

        break

      case "DELETE":
        AnnonceService annonceService
        annonceService.delete(params.id)
        render "L'annonce "+params.id + " a été supprimée"
        break

      default:
        return response.status= 405
        break
    }
    return  response.status = 406

  }

  def annonces()
  {
    switch(request.getMethod())
    {
      case "GET":
        def allannonces = Annonce.getAll();
        doSerialize(allannonces)
        break
      case "POST":
        break
      case "DELETE":
        def allannonces = Annonce.deleteAll();
        doSerialize(allannonces)
        break
      default:
        return response.status= 405
        break
    }
    return  response.status = 406

  }
  def doSerialize(def instance){
    switch (request.getHeader("Accept"))
    {
      case 'json' :
      case 'text/json' :
      case 'application/json' :
        render instance as JSON
        break
      case 'xml' :
        render instance as XML
        break
      case 'json' :
        render instance as XML
        break
      case 'text/xml' :
      case 'application/xml' :
        render instance as XML
        break
    }
  }

}

