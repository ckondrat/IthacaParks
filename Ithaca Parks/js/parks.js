var actHolder = ["springAct", "summerAct", "autumnAct", "winterAct"];
var HactHolder = ["springHAct", "summerHAct", "autumnHAct", "winterHAct"];

var locHolder = ["springLoc", "summerLoc", "autumnLoc", "winterLoc"];
var parkLoc = ["springPark", "summerPark", "autumnPark", "winterPark"];
var detailBlock = ["springDetails", "summerDetails", "autumnDetails", "winterDetails"];

var infoBlock = ["springInfo", "summerInfo", "autumnInfo", "winterInfo"];
var mapLoc = ["springMap", "summerMap", "autumnMap", "winterMap"];

var map;
var markers = [];
var waterfallSpots = [];
var count = 0;
function initialize() {
	waterfallSpots = [
  		new google.maps.LatLng(42.4, -76.53),
  		new google.maps.LatLng(42.545, -76.606),
  		new google.maps.LatLng(42.4, -76.574),
  		new google.maps.LatLng(42.443, -76.4941),
  		new google.maps.LatLng(42.4528, -76.4917),
  		new google.maps.LatLng(42.4613, -76.5054),
  		new google.maps.LatLng(42.5188, -76.5549),
  		new google.maps.LatLng(42.4326, -76.4841)
	];
	var waterfallNames = ['Buttermilk Falls','Taughannock Falls','Treman State Park','Cascadilla Falls','Ithaca Falls', 'Stewart Park', 
	'Denison Falls', "Businessman's Lunch Fall"];

	var Ithaca = new google.maps.LatLng(42.4433, -76.5000);
    var mapCanvas = document.getElementById('map-canvas');
    var mapOptions = {
      center: Ithaca,
      zoom: 15,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }

    map = new google.maps.Map(mapCanvas, mapOptions)

	for (var i = 0; i < waterfallSpots.length; i++){
		var marker = new google.maps.Marker({
      	position: waterfallSpots[i],
      	map: map,
      	title: waterfallNames[i]
  		});
	}
}

   google.maps.event.addDomListener(window, 'load', initialize);



$(document).ready(function(){
	for (var i = 0; i <  4; i++) {
		$("#" + HactHolder[i]).slideUp("fast");
		$("#" + locHolder[i]).slideUp("fast");
		$("#" + parkLoc[i]).slideUp("fast");
		$("#" + detailBlock[i]).slideUp("fast");
		$("#" + actHolder[i]).slideUp("fast");
	}
});

function hideAll(){
	for (var i = 0; i <  4; i++) {
		$("#" + HactHolder[i]).slideUp("fast");
		$("#" + locHolder[i]).slideUp("fast");
		$("#" + parkLoc[i]).slideUp("fast");
		$("#" + detailBlock[i]).slideUp("fast");
		$("#" + actHolder[i]).slideUp("fast");
	}
}

function seasonActivities(seasonID){
	$("#map-canvas").appendTo("#" + mapLoc[seasonID]);
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
	   	if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
	      	document.getElementById(actHolder[seasonID]).innerHTML  = xmlhttp.responseText;
	    } 
	}
	$("#" + actHolder[seasonID]).slideDown("fast");
	xmlhttp.open("GET", "seasonActivities.php?id=" + seasonID, true);
	xmlhttp.send();
}

function loadLocations(activityID, seasonIn){
	$("#" + HactHolder[seasonIn]).slideDown("fast");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
	   	if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
	      		document.getElementById(locHolder[seasonIn]).innerHTML  = xmlhttp.responseText;
		    } 
	 	}
	 	$("#" + locHolder[seasonIn]).slideDown("slow");
	xmlhttp.open("GET", "activityLocation.php?id=" + activityID +"&seasonID=" + seasonIn, true);
	xmlhttp.send();
}

function parkInfo(seasonIn,parkID){
	$("#" + parkLoc[seasonIn]).slideDown("slow");
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function(){
	   	if (xmlhttp.readyState == 4 && xmlhttp.status == 200){
	      		document.getElementById(infoBlock[seasonIn]).innerHTML  = xmlhttp.responseText;
		    } 
	 	}
	$("#" + detailBlock[seasonIn]).slideDown("slow");
	xmlhttp.open("GET", "parkDescription.php?id=" + parkID, true);
	xmlhttp.send();
	map.panTo(waterfallSpots[parkID]);
	$("#map-canvas").show();
}
