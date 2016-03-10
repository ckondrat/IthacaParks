<?php
 
  mysql_select_db("IthacaParks");

  $con = mysql_connect('localhost:/tmp/mysql.sock', "cs205user", "ithaca");
	if (!$con) {die('Could not connect: ' . mysql_error());}
	mysql_select_db("IthacaParks");

	$query = "Select * from Activity 
	JOIN SeasonToActivity ON Activity.ActivityID = SeasonToActivity.ActivityID 
	JOIN Season on SeasonToActivity.SeasonID = Season.SeasonID 
	WHERE SeasonToActivity.SeasonID = " . $_GET['id'];

	$result = mysql_query($query);
	while($row = mysql_fetch_array($result)){
	   echo "<div id='activity' style='float:left; margin-left:40px;'>";
		   echo "<input type='image' src='images/" . $row['ActivityName'] . ".png' width='140' height='40' 
		   onclick='loadLocations(" . $row['ActivityID'] . "," . $row['SeasonID'] . ")'></button>";
	   echo "</div>";
  }
  echo "</br>";
  mysql_close($con);
?>