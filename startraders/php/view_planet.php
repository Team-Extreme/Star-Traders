<html>
    <?php require'../process/check_user.php'?>
    <head>
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Star Traders</title>
                <link href="../css/main.css" rel="stylesheet" type="text/css">
                <link rel="stylesheet" href="../leaf/leaflet.css"/>
                <script src="../leaf/leaflet.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <link rel="shortcut icon" type="image/x-icon" href="../images/star_favicon.png"/>

    </head>



<body>
<div class="wrap">
  <div>
    <span></span>
    <span></span>
  </div>
    <div><a href="../process/logout_process.php">LOGOUT</a></div>
</div>
    <div id="container">


<div class="contscrollbarcont">
<div class= "scrollbar" id="style-4">


<?php require'../process/view_planet_process.php'?>



</div>
    </div>    


    </div>
    <div class="custom-popup" id="local_map"></div>
        <div class="left-ui"><div class="internal_cont"><h1>USER</h1><?php require'../process/get_user.php'?></div><div class="internal_right_cont"><h1>SHIP</h1></div></div>
    <div class="center-ui">  
  <a href=""><img class="image_contain" src="../images/refuel.png"></a>
  <a href=""><img class="image_contain"src="../images/market.png"></a>
   <a href="map.php"> <img class="image_contain" src="../images/map_view.png"></a>
  <a href="view_planet.php"><img class="image_contain"src="../images/planet_view.png"></a>
    </div>


    </body>


    <script>

    var southWest = L.latLng(450, 450),
    northEast = L.latLng(-100,-100),
    bounds = L.latLngBounds(southWest, northEast);

  var map = L.map('local_map', {
    crs: L.CRS.Simple,
    minZoom: -2,
    zoomControl:false,
    zoomLevelFixed: true,
	keyboard: false,
    dragging: false,
    zoomControl: false,
    boxZoom: false,
    doubleClickZoom: false,
    scrollWheelZoom: false,
    tap: false,
    touchZoom: false


  });

    var StarIcon = L.Icon.extend({
    options: {
        iconSize:     [15, 15],
        popupAnchor:  [-10, -10]
    }

});

    var playerIcon = L.Icon.extend({
    options: {
        iconSize:     [15, 15],
        popupAnchor:  [-10, -10]
    }

});

    var starIcon = new StarIcon({iconUrl: '../images/marker-icon.png'});
  var playerIcon = new playerIcon({iconUrl: '../images/marker-location-icon.png'});



  var yx = L.latLng;

  var xy = function(x, y) {
    if (L.Util.isArray(x)) {    // When doing xy([x, y]);
      return yx(x[1], x[0]);
    }
    return yx(y, x);  // When doing xy(x, y);
  };

  var bounds = [xy(0,0), xy(250, 250)];
  var image = L.imageOverlay('../images/jscriptstarmap.png', bounds).addTo(map);

    <?php require'get_planets.php'?>


    document.getElementsByClassName( 'leaflet-control-attribution' )[0].style.display = 'none';
    </script>


    <html>
