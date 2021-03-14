<!DOCTYPE html>
<html>
<div class="container">
    <head>
        <meta name="layout" content="main"/>
        <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>

        <style>
        @import 'https://fonts.googleapis.com/css?family=Open+Sans:600,700';

        * {font-family: 'Open Sans', sans-serif;}
        .rwd-table {
            margin: auto;
            min-width: 300px;
            max-width: 100%;
            border-collapse: collapse;
        }

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

        .rwd-table {
            color: #333;
            border-radius: .4em;
            overflow: hidden;
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

  <content tag="nav">

    <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
    <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    <li><sec:ifLoggedIn>
      <g:link controller='logout' > <i class="icon icon-lock" ></i>Log out</g:link>
    </sec:ifLoggedIn>
      <sec:ifNotLoggedIn>
        <g:link controller='login' > <i class="icon icon-lock" ></i>Log in</g:link>
      </sec:ifNotLoggedIn>
    </li>
  </content>
        <a href="#list-annonce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

        <div id="list-annonce" class="content scaffold-list" role="main">

        <h1><g:message code="default.list.label" args="[entityName]" /></h1>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:table collection="${annonceList}" />

            <div class="pagination">
                <g:paginate total="${annonceCount ?: 0}" />
            </div>
    </body>
</div>
</html>
