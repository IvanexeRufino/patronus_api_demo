<asset:stylesheet src="login.css"/>

    <head>
        <meta charset="utf-8">
        <title>Iniciar sesión | Patronus</title>
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
    </head>
    <body>
        <div class=login-box>
            <g:img dir="images" file="avatar.jpg" class="avatar"/>
            <h1>Patronus</h1>
            <g:form controller="login" action="auth" id="login">
                <label for="login">Usuario</label>
                <g:textField name="user" type="text" placeholder = "Ingresar usuario">  </g:textField>
                <label for="password">Contraseña</label>
                <g:textField name="pass" type="password" placeholder = "Ingresar contraseña" >  </g:textField>
                <g:if test = "${userInvalid}">
                    <label style="font-size: small; color: #dc3545"> * Usuario o contraseña inválidos. </label>
                </g:if>
                <g:submitButton type="submit" value="Iniciar sesión" name="iniciar_sesion"></g:submitButton>
            </g:form>
        </div>
    </body>
