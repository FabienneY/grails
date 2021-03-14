<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <style>
        @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

        * {font-family: 'Open Sans', sans-serif;}

        .rwd-table tr:first-child {
            border-top: none;
            background: #428bca;
            color: #fff;
        }

        .rwd-table tr {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            background-color: #f5f9fc;
        }

        .rwd-table tr:nth-child(odd):not(:first-child) {
            background-color: #ebf3f9;
        }

        .rwd-table th {
            display: none;
        }
        .rwd-table th{
            text-align: left;
        }

        .rwd-table tr {
            border-color: #bfbfbf;
        }

        .rwd-table th{
            padding: .5em 1em;
        }
        @media screen and (max-width: 601px) {
            .rwd-table tr:nth-child(2) {
                border-top: none;
            }
        }
        @media screen and (min-width: 600px) {
            .rwd-table tr:hover:not(:first-child) {
                background-color: #d8e7f3;
            }
            .rwd-table th{
                display: table-cell;
                padding: .25em .5em;
            }
            .rwd-table th:first-child{
                padding-left: 0;
            }
            .rwd-table th:last-child{
                padding-right: 0;
            }
            .rwd-table th{
                padding: 1em !important;
            }
        }
        .container {
            display: block;
            text-align: center;
        }
        body {
            background: navajowhite;
            background: -webkit-linear-gradient(to left, navajowhite , #283E51);
            background: linear-gradient(to left, #4B79A1 , navajowhite);
        }
        h1 {
            text-align: center;
            font-size: 2.4em;
            color: #f2f2f2;
        }

        </style>
    </head>
<body>
<div id="particles-js">
        <a href="#create-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="create-annonce" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.annonce}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.annonce}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form controller="annonce" action="save" method="POST">
                <fieldset class="form">
                    <f:all bean="annonce"/>
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
            <script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js">
            </script>
            <script>
                (function() {
                    document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
                })();
            </script>
        </div>
    </div>
    </body>
</html>
