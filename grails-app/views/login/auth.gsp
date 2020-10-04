<html>
<asset:stylesheet src="login.css"/>
<head>
    <meta charset="utf-8">
    <title>Iniciar sesión | Patronus</title>
    <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
</head>
<body>
<div id="login" class=login-box>
    <g:img dir="images" file="avatar.jpg" class="avatar"/>
    <div class="fheader"><g:message message=""/></div>
    <h1>Patronus</h1>
    <form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">
        <label for="login">Usuario</label>
        <g:textField name="${usernameParameter ?: 'username'}" id="username" type="text" placeholder = "Ingresar usuario">  </g:textField>
        <label for="password">Contraseña</label>
        <g:textField name="${passwordParameter ?: 'password'}" id="password" type="password" placeholder = "Ingresar contraseña" >  </g:textField>
        <g:if test='${flash.message}'>
            <label style="font-size: small; color: #dc3545"> * Usuario o contraseña inválidos. </label>
        </g:if>
        <input id="submit" type="submit" value="Iniciar sesión" name="iniciar_sesion">
    </form>
</div>
<script>
    (function() {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>
