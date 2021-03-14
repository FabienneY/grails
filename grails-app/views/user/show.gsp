
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <div class="loginTitle"><g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" /></div>
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <style type="text/css" media="screen">

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

        #login .inner .cssform p {
            clear: left;
            margin: 0;
            padding: 4px 0 3px 0;
            padding-left: 105px;
            margin-bottom: 20px;
            height: 1%;
        }

        #login .inner .cssform input[type="text"] {
            width: 120px;
        }

        #login .inner .cssform label {
            font-weight: bold;
            float: left;
            text-align: right;
            margin-left: -105px;
            width: 110px;
            padding-top: 3px;
            padding-right: 10px;
        }

        #login #remember_me_holder label {
            float: none;
            margin-left: 0;
            text-align: left;
            width: 200px
        }

        h1 {
            position: relative;
            font-family: 'Poppins', sans-serif;
            font-size: 20px;
            font-weight: 600;
            line-height: 1.1em;
            color: white;
            text-align: center;
            margin-bottom: 55px;
            margin-top: 40px;
        }

        @keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }
        * {
            margin: 0 auto;
            padding: 0;
            overflow: hidden;
        }


        h2{
            position: relative;
            font-family: 'Poppins', sans-serif;
            font-size: 12.5px;
            font-weight: 25;
            line-height: 1.1em;
            color: #222222;
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
        body {
            background: gray;
            background: -webkit-linear-gradient(to left, navajowhite , #283E51);
            background: linear-gradient(to left, #4B79A1 , navajowhite);
        }
        </style>
    </head>
    <body>
    <div id="particles-js">
    <section>
        <div class="card">
            <div class="container">
    <div class="login">
        <div class="inner">
        <form class="loginForm">
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

            <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><h2><g:message code="default.home.label"/></h2></a></li>
                <li><g:link class="list" action="index"><h2><g:message code="default.list.label" args="[entityName]" /></h2></g:link></li>
                <li><g:link class="create" action="create"><h2><g:message code="default.new.label" args="[entityName]" /></h2></g:link></li>
            </ul>
        </div>

        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="user" />
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
        </form>
    </div>
    </div>
        </div>
        </div>
        </section>
    </div>
        <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js">
        </script>
        <script>
            (function() {
                document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
            })();
        </script>
    </body>
</html>

