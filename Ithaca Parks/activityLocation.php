<?php
	mysql_select_db("IthacaParks");

	$con = mysql_connect('localhost:/tmp/mysql.sock', "cs205user", "ithaca");
	if (!$con) {die('Could not connect: ' . mysql_error());}
	mysql_select_db("IthacaParks");

	$query = "Select * FROM Park JOIN ParkToActivity 
	ON Park.`ParkID` = ParkToActivity.ParkID 
	WHERE ParkToActivity.ActivityID = " . $_GET['id'];

	$result = mysql_query($query);
	while($row = mysql_fetch_array($result)){
		echo "<div id='actLocation' style='float:left; margin-left:10px;'>";
			echo "<a onclick='parkInfo(". $_GET['seasonID'] .",". $row['ParkID'] . ")' class='myButton'>" . $row['ParkName'] . "</a>";
		echo "</div>";
	}
	echo "<br />";
	mysql_close($con);
?>