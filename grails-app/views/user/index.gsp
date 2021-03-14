<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
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
        /*background: #428bca;*/
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

    .rwd-table td {
        display: block;
    }

    .rwd-table td:first-child {
        margin-top: .5em;
    }

    .rwd-table td:last-child {
        margin-bottom: .5em;
    }

    .rwd-table td:before {
        content: attr(data-th) ": ";
        font-weight: bold;
        width: 120px;
        display: inline-block;
        color: #000;
    }

    .rwd-table th,
    .rwd-table td {
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

    .rwd-table th,
    .rwd-table td {
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
        .rwd-table td:before {
            display: none;
        }
        .rwd-table th,
        .rwd-table td {
            display: table-cell;
            padding: .25em .5em;
        }
        .rwd-table th:first-child,
        .rwd-table td:first-child {
            padding-left: 0;
        }
        .rwd-table th:last-child,
        .rwd-table td:last-child {
            padding-right: 0;
        }
        .rwd-table th,
        .rwd-table td {
            padding: 1em !important;
        }
    }


    /* THE END OF THE IMPORTANT STUFF */

    /* Basic Styling */
    body {
        background: gray;
        background: -webkit-linear-gradient(to left, navajowhite , #283E51);
        background: linear-gradient(to left, #4B79A1 , navajowhite);
    }
    h1 {
        text-align: center;
        font-size: 2.4em;
        color: #f2f2f2;
    }
    .container {
        display: block;
        text-align: center;
    }
    @-webkit-keyframes leftRight {
        0%    { -webkit-transform: translateX(0)}
        25%   { -webkit-transform: translateX(-10px)}
        75%   { -webkit-transform: translateX(10px)}
        100%  { -webkit-transform: translateX(0)}
    }
    @keyframes leftRight {
        0%    { transform: translateX(0)}
        25%   { transform: translateX(-10px)}
        75%   { transform: translateX(10px)}
        100%  { transform: translateX(0)}
    }

    </style>
</head>
<body>
<content tag="nav">

  <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
  <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
  <li><sec:ifLoggedIn>
    <g:link controller='logout' > <i class="icon icon-lock" ></i>Log out</g:link>
  </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
      <g:link controller='login' > <i class="icon icon-lock" ></i>Log in</g:link>
    </sec:ifNotLoggedIn>
  </li>
</content>
<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-user" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
%{--            <f:table collection="${userList}" />--}%
    <div class="container">
    <table class="rwd-table">
        <thead>
        <tr>
            <g:sortableColumn property="username" title="Username"/>

            <th>
                Roles
            </th>

            <th>
                Annonces
            </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${userList}" var="user">
            <tr>
                <td>
                    <g:link controller="user" action="show" id="${user.id}">
                        ${user.username}
                    </g:link>
                </td>
                <td>
                    ${user.getAuthorities().authority.join(",")}
                </td>
                <td>
                    <ul>
                        <g:each in="${user.annonces}" var="annonce">
                            <li>
                                <g:link controller="annonce" action="show" id="${annonce.id}">
                                    ${annonce.title}
                                </g:link>
                            </li>
                        </g:each>
                    </ul>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
    </div>

    <div class="pagination">
        <g:paginate total="${userCount ?: 0}"/>
    </div>
</div>
</body>
</html>
