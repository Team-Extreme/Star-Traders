<?php

	session_start();

	require 'db_connect.php';

	$refuel_cost = $_POST['refuel_cost'];
	
	$sql = "SELECT user_table.user_money FROM user_table WHERE user_table.user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$user_funds = $sql_array['user_money'];
	
	$sql = "UPDATE user_ship SET user_ship.ship_fuel = 15000 WHERE user_ship.user_id = ".$_SESSION['user_id']."";
	if ($conn->query($sql) === FALSE) { //query fails
		//whoops
		header('Location: ../php/map.php?message_id=18');
	}
	
	$new_funds = $user_funds - $refuel_cost;
	
	$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
	if ($conn->query($sql) === FALSE) { //query fails
		//whoops
		header('Location: ../php/map.php?message_id=14');
	}
	
	$amount = $refuel_cost / 2;
	
	$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$system_location = $sql_array['user_location'];
	
	$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$amount.", '0', '+', ".$_SESSION['user_id'].", ".$system_location.", 'Fuel Purchase')";
	if ($conn->query($sql) === FALSE) { //query fails
		//whoops
		header('Location: ../php/map.php?message_id=19');
	}
	
	header('Location: ../php/map.php?message_id=13');

?>