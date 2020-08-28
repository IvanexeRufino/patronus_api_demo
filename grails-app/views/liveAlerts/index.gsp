<asset:stylesheet src="main_operador.css"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Patronus</title>
    <link rel="icon" type="image/x-ico" href="/assets/favicon.ico">
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no" />
    <script src="https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.js"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v1.12.0/mapbox-gl.css" rel="stylesheet" />
    <style>
    body { margin: 0; padding: 0; }
    #map { position: absolute; top: 0; bottom: 0; left: 20% ; width: 80%; }
    </style>
    <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>

<div class="wrapper">
    <div class="sidebar">
        <h2>Patronus</h2>
        <ul>
            <li><a href="#"><i class="fas fa-exclamation-circle"></i>Alerta 1</a></li>
            <li><a href="#"><i class="fas fa-exclamation-circle"></i>Alerta 2</a></li>
            <li><a href="#"><i class="fas fa-exclamation-circle"></i>Alerta 3</a></li>
        </ul>
    </div>
</div>

<div id="map"></div>
<script>
    mapboxgl.accessToken = 'pk.eyJ1IjoibmF0aXRvIiwiYSI6ImNrZTY4bTBvNjFhZ2Yyc213N29kdXg2c2QifQ.42DIhYrm9VcNg2RP7rZCrw';
    var map = new mapboxgl.Map({
        container: 'map', // container id
        style: 'mapbox://styles/mapbox/streets-v11', // style URL
        center: [-58.490182, -34.571955], // starting position [lng, lat]
        zoom: 15 // starting zoom
    });

    var size = 115;

    // implementation of CustomLayerInterface to draw a pulsing dot icon on the map
    // see https://docs.mapbox.com/mapbox-gl-js/api/#customlayerinterface for more info
    var pulsingDot = {
        width: size,
        height: size,
        data: new Uint8Array(size * size * 4),

// get rendering context for the map canvas when layer is added to the map
        onAdd: function() {
            var canvas = document.createElement('canvas');
            canvas.width = this.width;
            canvas.height = this.height;
            this.context = canvas.getContext('2d');
        },

// called once before every frame where the icon will be used
        render: function() {
            var duration = 1000;
            var t = (performance.now() % duration) / duration;

            var radius = (size / 2) * 0.3;
            var outerRadius = (size / 2) * 0.7 * t + radius;
            var context = this.context;

// draw outer circle
            context.clearRect(0, 0, this.width, this.height);
            context.beginPath();
            context.arc(
                this.width / 2,
                this.height / 2,
                outerRadius,
                0,
                Math.PI * 2
            );
            context.fillStyle = 'rgba(255, 200, 200,' + (1 - t) + ')';
            context.fill();

// draw inner circle
            context.beginPath();
            context.arc(
                this.width / 2,
                this.height / 2,
                radius,
                0,
                Math.PI * 2
            );
            context.fillStyle = 'rgba(255, 100, 100, 1)';
            context.strokeStyle = 'white';
            context.lineWidth = 2 + 4 * (1 - t);
            context.fill();
            context.stroke();

// update this image's data with data from the canvas
            this.data = context.getImageData(
                0,
                0,
                this.width,
                this.height
            ).data;

// continuously repaint the map, resulting in the smooth animation of the dot
            map.triggerRepaint();

// return `true` to let the map know that the image was updated
            return true;
        }
    };

    map.on('load', function() {

        var marker = new mapboxgl.Marker({ "color": "#FF6464" })
            .setLngLat([-58.492939, -34.568245])
            .addTo(map);

        map.addImage('pulsing-dot', pulsingDot, { pixelRatio: 2 });

        map.addSource('route', {
            'type': 'geojson',
            'data': {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                    'type': 'LineString',
                    'coordinates': [
                        [-58.492939, -34.568245],
                        [-58.490161,-34.571937]
                    ]
                }
            }
        });

        map.addLayer({
            'id': 'route',
            'type': 'line',
            'source': 'route',
            'layout': {
                'line-join': 'round',
                'line-cap': 'round'
            },
            'paint': {
                'line-color': '#FF6464',
                'line-width': 8
            }
        });

        map.addSource('points', {
            'type': 'geojson',
            'data': {
                'type': 'FeatureCollection',
                'features': [
                    {
                        'type': 'Feature',
                        'geometry': {
                            'type': 'Point',
                            'coordinates': [-58.490161,-34.571937]
                        }
                    }
                ]
            }
        });
        map.addLayer({
            'id': 'points',
            'type': 'symbol',
            'source': 'points',
            'layout': {
                'icon-image': 'pulsing-dot'
            }
        });
    });
</script>
</body>
</html>

