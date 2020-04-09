<?php

	require 'db_connect.php';
	
	$item_id = $_GET['item_id'];
	$item_price = $_GET['item_price'];
	$sell = $_GET['sell'];
	$buy = $_GET['buy'];
	
	$sql = "SELECT uer_table.user_money from user_table where user_table.user_id = ".$_SESSION['user_id']."";
	
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$user_funds = $sql_array['user_money'];
	
	if (isset($buy) && isset($sell)){ //there are values in both the buy and sell columns
	
		//whoops
		
	} elseif (isset($buy) && ($buy > 0)){ //there is a value in the buy column and it's more than 0
	
		if (){ //cost of items is more than the money we have 
		
			//whoops
			
		} else { //we can afford the items
		
			if (){ //number you want to buy is more than planet has in stock
			
				//whoops
			
			} else { //planet has more stock or the same number as you want to buy
		
				if (){ //the number you want to buy won't fit in cargo
			
					//whoops
				
				} else { //there is enough space in cargo for the items
		
					if (){ //item is already in cargo
			
						//select statement to see how many of the item we have
			
						//add that number to the number we want to buy
			
						//update statement to change the number in the table
					
						if (){ //planet now has 0
					
							//delete statement to remove from table
					
						}
			
					} else { //item is not already in cargo
			
						//insert statement to add item to cargo
				
						if (){ //planet now has 0
					
							//delete statement to remove from table
					
						}
			
					}
				
				}
		
			}
		
		}
		
	} elseif (isset($sell) && ($sell > 0)){ //there's a value in the sell column and it's more than 0
		
		if (){ //number you want to sell is more than you have in cargo
			
			//whoops
			
		} else { //you have more or equal amount in cargo to the number you want to sell
			
			if (){ //planet already has item
			
				//select statement to see how many of the item the planet has
			
				//add that number to the number we want to sell
			
				//update statement to change the number in the table
					
				if (){ //we now have 0 in cargo
					
					//delete statement to remove from table
					
				}
			
			} else { //item is not already in cargo
			
				//insert statement to add item to cargo
				
				if (){ //we now have 0 in cargo
					
					//delete statement to remove from table
					
				}
			
			}
			
		}
		
	}

?>