<?php
	mysql_select_db("IthacaParks");

	$con = mysql_connect('localhost:/tmp/mysql.sock', "cs205user", "ithaca");
	if (!$con) {die('Could not connect: ' . mysql_error());}
	mysql_select_db("IthacaParks");

	$query = " Select * FROM `Park`";
	$result = mysql_query($query);

	while($row = mysql_fetch_array($result)){
		if($_GET['id'] == $row['ParkID']){
			echo $row['Description'];
		}
	}
	mysql_close($con);
?>