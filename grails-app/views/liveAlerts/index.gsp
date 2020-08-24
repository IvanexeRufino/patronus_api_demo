<!DOCTYPE html>
<html>
<head>
    <script
            src="https://maps.googleapis.com/maps/api/js?key=cgfcgfhcgfcfhcghc&callback=initMap&libraries=&v=weekly"
        defer
    ></script>
</head>
<body>
<div id="map"></div>
</body>
</html>

<script>
    function initMap() {
        map = new google.maps.Map(document.getElementById("map"), {
            center: {
                lat: -34.397,
                lng: 150.644
            },
            zoom: 8
        });
    }
    initMap()
</script>

