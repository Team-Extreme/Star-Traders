<?php

	//to allow db connections
	require '../php/db_connect.php';
	
	//get how many entries there are in the market place
	$sql = "SELECT COUNT(market_id) FROM univ_market";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$market_lines = $sql_array['COUNT(market_id)'];
	
	//random number between 1 and the number of entries in the market to decide how many of these
	//entries we are going to change
	$num_changes = rand(1, $market_lines);
	
	//loop for the number of changes we are making
	for ($i=0; $i < $num_changes; $i ++){
	
		//randomise which entry we are changing and what we are 
		//changing it to
		$market_id_to_change = rand(1, $market_lines);
		$new_stock_level = rand(0, 25000);
		
		//update the market table with new val
		$sql = "UPDATE univ_market SET univ_market.market_quantity = ".$new_stock_level." WHERE univ_market.market_id = ".$market_id_to_change."";
		if ($conn->query($sql) === FALSE) { //query fails
			//whoops
			header('Location: ../php/map.php?message_id=20');
		}
	
	}
	
	//success message
	header('Location: ../php/map.php?message_id=21');

?>