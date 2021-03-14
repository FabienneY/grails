<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
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

    #login .inner .fheader {
        padding: 18px 26px 14px 26px;
        background-color: #f7f7ff;
        margin: 0px 0 14px 0;
        color: #2e3741;
        font-size: 18px;
        font-weight: bold;
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

    #login #remember_me_holder {
        padding-left: 120px;
    }

    #login #submit {
        margin-left: 15px;
    }

    #login #remember_me_holder label {
        float: none;
        margin-left: 0;
        text-align: left;
        width: 200px
    }

    #login .inner .login_message {
        padding: 6px 25px 20px 25px;
        color: #c33;
    }

    #login .inner .text_ {
        width: 120px;
    }

    #login .inner .chk {
        height: 12px;
    }


    h1 {
        position: relative;
        font-family: 'Poppins', sans-serif;
        font-size: 0.8em;
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
        width: 555px;
        height: 591px;
        border-radius: 30px;
        background: linear-gradient(132.23deg, rgba(78, 223, 255, 0.512) 2.32%, rgba(255, 255, 255, 0.10) 109.87%);
        transform:translate(-50%,-50%);
        backdrop-filter: blur(26px) saturate(100%) contrast(80%) brightness(90%);
        -webkit-backdrop-filter: blur(26px) saturate(100%) contrast(80%) brightness(90%);
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.14);
        overflow: hidden;
    }
    .container {
        position: relative;
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        -webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
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

    section{
        font-size:3rem;
        position:relative;
        height:100vh;
    }
    #particles-js {
        position: absolute;
        width: 100%;
        height: 100%;
        background-image: url(https://i.postimg.cc/6p0W5Dkp/Gradient-BG.png);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: 50% 50%;
    }
    </style>
</head>

<body>
<div id="particles-js">
</div>
<section>
    <div class="card">
        <div class="container">
<div id="login">
    <div class="inner">
        <div class="fheader"><h1><g:message code='springSecurity.login.header'/></h1></div>

        <g:if test='${flash.message}'>
            <div class="login_message">${flash.message}</div>
        </g:if>

        <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
            <p>
                <label for="username"><g:message code='springSecurity.login.username.label'/>:</label>
                <input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>
            </p>

            <p>
                <label for="password"><g:message code='springSecurity.login.password.label'/>:</label>
                <input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>
            </p>

            <p id="remember_me_holder">
                <input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>
                <label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></h1></label>
            </p>

            <p>
                <input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>
            </p>
        </form>
    </div>
</div>
        </div>
    </div>
</section>
<script src="https://cdn.jsdelivr.net/npm/particles.js@2.0.0/particles.min.js">
</script>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
