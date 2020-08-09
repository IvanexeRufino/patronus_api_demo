<asset:stylesheet src="login.css"/>

    <head>
        <meta charset="utf-8">
        <title>Iniciar sesión | Patronus</title>
        <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
%{--        <link rel="shortcut icon" href="/assets/images/favicon.ico" />--}%
    </head>
    <body>
        <div class=login-box>
            <g:img dir="images" file="avatar.jpg" class="avatar"/>
            <h1>Patronus</h1>
            <form>
                <label for="login">Usuario</label>
                <input type="text" placeholder="Ingresar usuario">

                <label for="password">Contraseña</label>
                <input type="password" placeholder="Ingresar contraseña">

                <input type="submit" value="Iniciar sesión">
            </form>
        </div>
    </body>
