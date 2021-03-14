<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

        <style type="text/css" media="screen">
        #login {
            margin: 15px 0px;
            padding: 0px;
            text-align: center;
        }

        #login .inner {
            width: 340px;
            padding-bottom: 6px;
            margin: 60px auto;
            text-align: left;
            border: 1px solid #aab;
            background-color: #f0f0fa;
            -moz-box-shadow: 2px 2px 2px #eee;
            -webkit-box-shadow: 2px 2px 2px #eee;
            -khtml-box-shadow: 2px 2px 2px #eee;
            box-shadow: 2px 2px 2px #eee;
        }

        h1 {
            position: relative;
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 600;
            line-height: 1.1em;
            color: black;
            text-align: center;
            margin-bottom: 55px;
            margin-top: 40px;
        }
        .card {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 800px;
            height: 3500px;
            border-radius: 30px;
            margin-bottom: 55px;
            margin-top: 40px;
            /*background: linear-gradient(132.23deg, rgba(78, 223, 255, 0.512) 2.32%, rgba(255, 255, 255, 0.10) 109.87%);*/
            transform:translate(-50%,-5%);
            backdrop-filter: blur(26px) saturate(100%) contrast(80%) brightness(90%);
            -webkit-backdrop-filter: blur(26px) saturate(100%) contrast(80%) brightness(90%);
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.14);
            overflow: hidden;
        }
        .container {
            position: relative;
            width: 50%;
            height: 27%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: flex-end;
            -webkit-animation: fadein 5s; /* Safari, Chrome and Opera > 12.1 */
        }
        @keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }
        * {
            margin: 0 auto;
            padding: 0;
            /*overflow: hidden;*/
        }



        h2{
            position: relative;
            font-family: 'Poppins', sans-serif;
            font-size: 12.5px;
            font-weight: 25;
            line-height: 1.1em;
            color: Azure;
            text-align: center;
            margin-bottom: 55px;
            margin-top: 40px;

            padding: 20px;
            cursor: pointer;
            user-select: none;
            position: relative;
            overflow: hidden;
            margin: 0;
            transition: 0.3s color, 0.1s background-color;

        }
        h3{
            position: relative;
            font-family: 'Poppins', sans-serif;
            font-size: 30px;
            font-weight: 250;
            line-height: 1.1em;
            color: Azure;
            text-align: center;
            margin-bottom: 55px;
            margin-top: 400px;

            padding: 20px;
            cursor: pointer;
            user-select: none;
            position: relative;
            overflow: hidden;
            margin: 0;
            transition: 0.3s color, 0.1s background-color;

        }
        body {
            background: navajowhite;
            background: -webkit-linear-gradient(to left, navajowhite , #283E51);
            background: linear-gradient(to left, #4B79A1 , navajowhite);
        }

        </style>
    </head>
    <body>
    <section>
    <div id="particles-js">
    </div>

        <div class="card">

            <div class="container">
                <div id="login">
                    <div class="inner">
        <a href="#edit-user" class="skip" tabindex="-1"><h1><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></h1></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><h2><g:message code="default.home.label"/></h2></a></li>
                <li><g:link class="list" action="index"><h2><g:message code="default.list.label" args="[entityName]" /></h2></g:link></li>
                <li><g:link class="create" action="create"><h2><g:message code="default.new.label" args="[entityName]" /></h2></g:link></li>
            </ul>
        </div>
        <div id="edit-user" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <h2>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            </h2>
            <g:hasErrors bean="${this.user}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <h3>
            <g:form resource="${this.user}" method="PUT">
                <g:hiddenField name="version" value="${this.user?.version}" />
                <fieldset class="form">
                    <f:all bean="user"/>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
            </h3>
        </div>
                    </div>
                </div>

            </div>

    <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js">
    </script>
    <script>
        (function() {
            document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
        })();
    </script>
    </div>
    </section>
    </body>
</html>

