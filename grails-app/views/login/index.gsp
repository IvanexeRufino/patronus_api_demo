%{--< !doctype html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title>Geolocation API: Technotip.com</title>--}%
%{--    <meta charset="utf-8"/>--}%
%{--    <g:javascript src="jquery-3.3.1.min.js" />--}%
%{--    <script src="http://maps.google.com/maps/api/js?sensor=true"></script>--}%
%{--    <g:javascript src="realtimeloc.js" />--}%
%{--</head>--}%
%{--<body>--}%
%{--<p id="map"></p>--}%
%{--<button>Stop</button>--}%
%{--</body>--}%
%{--</html>--}%

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
            <g:form controller="login" action="auth">
                <label for="login">Usuario</label>
                <input type="text" placeholder="Ingresar usuario">

                <label for="password">Contraseña</label>
                <input type="password" placeholder="Ingresar contraseña">

            <input type="submit" value="Iniciar sesión">
            </g:form>
        </div>
    </body>
