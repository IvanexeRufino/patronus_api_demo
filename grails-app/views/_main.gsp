< !doctype html>
<html>
<head>
    <script src='https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.css' rel='stylesheet' />
</head>
<body>

<div id='map' style='width: 400px; height: 300px;'></div>
<script>
    mapboxgl.accessToken = 'pk.eyJ1IjoibmF0aXRvIiwiYSI6ImNrZTY4bTBvNjFhZ2Yyc213N29kdXg2c2QifQ.42DIhYrm9VcNg2RP7rZCrw';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11'
    });
</script>

</body>
</html>