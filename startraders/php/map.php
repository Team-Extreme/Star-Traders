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
<div id='stars'></div>
<div id='stars2'></div>
<div id='stars3'></div>
<div class="wrap">
  <div>
    <span></span>
    <span></span>
  </div>
    <div><a href="../process/logout_process.php">LOGOUT</a></div>
</div>
    <div id="container">


              <div class="custom-popup" id="map"></div>


    </div>
    <div class="rightstack"><div class="errmessage"><?php include'../process/message_check_process.php'?></div><div class="custom-popup" id="local_map"></div></div>
       <div class="transaction_left"><h1>Transactions</h1><?php require'../process/get_transactions.php'?></div> 
    <div class="cargoleft"><h1>Cargo</h1><?php require'../process/get_cargo.php'?></div> <div class="left-ui"><div class="internal_cont"><h1>USER</h1><?php require'../process/get_user.php'?></div><div class="internal_right_cont"><h1>SHIP</h1><?php require'../process/get_ship.php'?></div></div>
    <div class="center-ui">  
  <a href=""><img class="image_contain" src="../images/refuel.png"></a>
  <a href=""><img class="image_contain"src="../images/market.png"></a>
   <a href="map.php"> <img class="image_contain" src="../images/map_view.png"></a>
  <a href="view_planet.php"><img class="image_contain"src="../images/planet_view.png"></a>
	</div>


    </body>


    <script>
// Sets the bounds of the map in this case because the map is fixed the bounds are only slightly larger than the fixed side of the map this is to account for padding etc.
    var southWest = L.latLng(450, 450),
    northEast = L.latLng(-100,-100),
    bounds = L.latLngBounds(southWest, northEast);
//The code below creates a map variable and then Gives it all of its rules such as if a player may zoom etc. In this case because it is a local map all abilitys to move the map are disabled.
        
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
    //The code below generates variables for the icons which will be called at a later part of the script these icons will populate the map as markers.
    var StarIcon = L.Icon.extend({
    options: {
        iconSize:     [15, 15], // Denotes icon size
        popupAnchor:  [-10, -10] // Denotes icon placement in relation to original coords
    }

});

    var playerIcon = L.Icon.extend({
    options: {
        iconSize:     [15, 15], 
        popupAnchor:  [-10, -10]
    }

});
// This tells the script which icon to use for which map marker there may have been a way to include this in the initial variable declaration but everytime i tried it broke.
    var starIcon = new StarIcon({iconUrl: '../images/marker-icon.png'});
  var playerIcon = new playerIcon({iconUrl: '../images/marker-location-icon.png'});


// The code below allows me to use x,y coords instead of the latlng that is the default for leaflet this is a direct rip from a tutorial i read because math and it allowed me to define coords much easier in the php 
  var yx = L.latLng;

  var xy = function(x, y) {
    if (L.Util.isArray(x)) {   
      return yx(x[1], x[0]);
    }
    return yx(y, x);  
  };
//The code below sets bounds for the map and also dictates which image to use as a map background.
  var bounds = [xy(0,0), xy(250, 250)];
  var image = L.imageOverlay('../images/jscriptstarmap.png', bounds).addTo(map);

    <?php require'get_planets.php'?>

// The code below removes the little leaflet icon which is usually in the corner the developers of the library gave permission for users to do this and the icon is ugly.
    document.getElementsByClassName( 'leaflet-control-attribution' )[0].style.display = 'none';
    </script>
























        <script>

        var southWest = L.latLng(3700, 6000),
        northEast = L.latLng(-1000,-1000),
        bounds = L.latLngBounds(southWest, northEast);
//Set the rules of the map maxboundsviscosity means that there is no bounce effect when the map is dragged over the bounds it is like a solid wall.
    	var map = L.map('map', {
    		crs: L.CRS.Simple,
    		minZoom: -2,
            maxBounds: bounds,
            maxBoundsViscosity: 1.0


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

    	var bounds = [xy(0,0), xy(4700, 2700)];
    	var image = L.imageOverlay('../images/jscriptstarmap.png', bounds).addTo(map);
// The php script below populates the map with the marker variables.
        <?php require'get_systems.php'?>


        document.getElementsByClassName( 'leaflet-control-attribution' )[0].style.display = 'none';
        </script>

<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>
    <html>
