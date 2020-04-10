<?php

	session_start();

	require 'db_connect.php';
	
	$item_id = $_POST['item_id'];
	$item_price = $_POST['item_price'];
	$planet_stock = $_POST['planet_stock'];
	$planet_id = $_POST['planet_id'];
	$sell = $_POST['sell'];
	$buy = $_POST['buy'];
	
	$sql = "SELECT user_table.user_money from user_table where user_table.user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$user_funds = $sql_array['user_money'];
	
	$sql = "SELECT SUM(user_cargo.item_amount) from user_cargo where user_cargo.user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$ship_cargo = $sql_array['SUM(user_cargo.item_amount)'];
	
	//select statement to see how many of the item we have
	$sql = "SELECT user_cargo.item_amount from user_cargo where user_cargo.item_id = ".$item_id." and user_cargo.user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	$sql_array = $result->fetch_array(MYSQLI_ASSOC);
	$cargo_amount = $sql_array['item_amount'];
	
	//find out if item is already in cargo
	$sql = "SELECT user_cargo.cargo_id from user_cargo where user_cargo.item_id = ".$item_id." and user_cargo.user_id = ".$_SESSION['user_id']."";
	$result = $conn->query($sql);
	if ($result->num_rows > 0){
		$in_cargo = TRUE;
	} else{
		$in_cargo = FALSE;
	}
	
	//find out if item is already on planet
	$sql = "SELECT univ_market.market_id FROM univ_market WHERE univ_market.market_item_id = ".$item_id." and univ_market.planet_id = ".$planet_id."";
	$result = $conn->query($sql);
	if ($result->num_rows > 0){
		$in_stock = TRUE;
	} else{
		$in_stock = FALSE;
	}
	
	if (($buy > 0) && ($sell > 0)){ //there are values in both the buy and sell columns
	
		//whoops
		header('Location: ../php/map.php?message_id=5');
		
	} elseif (isset($buy) && ($buy > 0)){ //there is a value in the buy column and it's more than 0
	
		if (($item_price * $buy) > $user_funds){ //cost of items is more than the money we have 
		
			//whoops
			header('Location: ../php/map.php?message_id=6');
			
		} else { //we can afford the items
		
			if ($buy > $planet_stock){ //number you want to buy is more than planet has in stock
			
				//whoops
				header('Location: ../php/map.php?message_id=7');
			
			} else { //planet has more stock or the same number as you want to buy
		
				if ((20000 - $ship_cargo) < $buy){ //the number you want to buy won't fit in cargo
			
					//whoops
					header('Location: ../php/map.php?message_id=8');
				
				} else { //there is enough space in cargo for the items
		
					if ($in_cargo){ //item is already in cargo
						
						//add that number to the number we want to buy
						$new_cargo_amount = $cargo_amount + $buy;
			
						//update statement to change the number in the table
						$sql = "UPDATE user_cargo SET user_cargo.item_amount = ".$new_cargo_amount." WHERE user_cargo.item_id = ".$item_id." AND user_cargo.user_id = ".$_SESSION['user_id']."";
						if ($conn->query($sql) === FALSE) { //query fails
							//whoops
							header('Location: ../php/map.php?message_id=9');
						}
					
						if ($buy === $planet_stock){ //planet now has 0
					
							//delete statement to remove from table
							$sql = "DELETE FROM univ_market WHERE univ_market.market_item_id = ".$item_id." AND univ_market.planet_id = ".$planet_id."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=10');
							}
							
							$new_funds = $user_funds - ($item_price * $buy);
							
							$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=14');
							}
	
							$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
							$result = $conn->query($sql);
							$sql_array = $result->fetch_array(MYSQLI_ASSOC);
							$system_location = $sql_array['user_location'];
	
							$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$buy.", ".$planet_id.", '+', ".$_SESSION['user_id'].", ".$system_location.", 'Purchase')";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=19');
							}
							
							header('Location: ../php/map.php?message_id=13');
							
						} else { //planet still has remaining stock
							
							//remove how many we want to buy from the planet stock
							$new_planet_stock = $planet_stock - $buy;
							
							//update statement to change the number in the table
							$sql = "UPDATE univ_market SET univ_market.market_quantity = ".$new_planet_stock." WHERE univ_market.market_item_id = ".$item_id." AND univ_market.planet_id = ".$planet_id."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=11');
							}
							
							$new_funds = $user_funds - ($item_price * $buy);
							
							$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=14');
							}
							
							$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
							$result = $conn->query($sql);
							$sql_array = $result->fetch_array(MYSQLI_ASSOC);
							$system_location = $sql_array['user_location'];
	
							$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$buy.", ".$planet_id.", '+', ".$_SESSION['user_id'].", ".$system_location.", 'Purchase')";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=19');
							}
							
							header('Location: ../php/map.php?message_id=13');
							
						}
			
					} else { //item is not already in cargo
			
						//insert statement to add item to cargo
						$sql = "INSERT INTO user_cargo (user_id, item_id, item_amount) VALUES (".$_SESSION['user_id'].", ".$item_id.", ".$buy.")";
						if ($conn->query($sql) === FALSE) { //query fails
							//whoops
							header('Location: ../php/map.php?message_id=12');
						}
				
						if ($buy === $planet_stock){ //planet now has 0
					
							//delete statement to remove from table
							$sql = "DELETE FROM univ_market WHERE univ_market.market_item_id = ".$item_id." AND univ_market.planet_id = ".$planet_id."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=10');
							}
							
							$new_funds = $user_funds - ($item_price * $buy);
							
							$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=14');
							}
							
							$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
							$result = $conn->query($sql);
							$sql_array = $result->fetch_array(MYSQLI_ASSOC);
							$system_location = $sql_array['user_location'];
	
							$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$buy.", ".$planet_id.", '+', ".$_SESSION['user_id'].", ".$system_location.", 'Purchase')";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=19');
							}
							
							header('Location: ../php/map.php?message_id=13');
							
						} else { //planet still has remaining stock
							
							//remove how many we want to buy from the planet stock
							$new_planet_stock = $planet_stock - $buy;
							
							//update statement to change the number in the table
							$sql = "UPDATE univ_market SET univ_market.market_quantity = ".$new_planet_stock." WHERE univ_market.market_item_id = ".$item_id." AND univ_market.planet_id = ".$planet_id."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=11');
							}
							
							$new_funds = $user_funds - ($item_price * $buy);
							
							$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=14');
							}
							
							$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
							$result = $conn->query($sql);
							$sql_array = $result->fetch_array(MYSQLI_ASSOC);
							$system_location = $sql_array['user_location'];
	
							$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$buy.", ".$planet_id.", '+', ".$_SESSION['user_id'].", ".$system_location.", 'Purchase')";
							if ($conn->query($sql) === FALSE) { //query fails
								//whoops
								header('Location: ../php/map.php?message_id=19');
							}
							
							header('Location: ../php/map.php?message_id=13');
							
						}
			
					}
				
				}
		
			}
		
		}
		
	} elseif (isset($sell) && ($sell > 0)){ //there's a value in the sell column and it's more than 0
		
		if ($sell > $cargo_amount){ //number you want to sell is more than you have in cargo
			
			//whoops
			header('Location: ../php/map.php?message_id=15');
			
		} else { //you have more or equal amount in cargo to the number you want to sell
			
			if ($in_stock){ //planet already has item
			
				//add stock to the number we want to sell
				$new_planet_stock = $planet_stock + $sell;
			
				//update statement to change the number in the table
				$sql = "UPDATE univ_market SET univ_market.market_quantity = ".$new_planet_stock." WHERE univ_market.market_item_id = ".$item_id." AND univ_market.planet_id = ".$planet_id."";
				if ($conn->query($sql) === FALSE) { //query fails
					//whoops
					header('Location: ../php/map.php?message_id=11');
				}
				
				if ($sell === $cargo_amount){ //we now have 0 in cargo
					
					//delete statement to remove from table
					$sql = "DELETE FROM user_cargo WHERE user_cargo.item_id = ".$item_id." AND user_cargo.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=16');
					}
				
					$new_funds = $user_funds + ($item_price * $sell);
				
					$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=14');
					}
					
					$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
					$result = $conn->query($sql);
					$sql_array = $result->fetch_array(MYSQLI_ASSOC);
					$system_location = $sql_array['user_location'];
					
					$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$sell.", ".$planet_id.", '-', ".$_SESSION['user_id'].", ".$system_location.", 'Sale')";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=19');
					}
				
					header('Location: ../php/map.php?message_id=13');
				
				} else { //we still have this item in cargo
				
					//remove how many we want to sell from cargo
					$new_cargo_amount = $cargo_amount - $sell;
				
					//update statement to change the number in the table
					$sql = "UPDATE user_cargo SET user_cargo.item_amount = ".$new_cargo_amount." WHERE user_cargo.item_id = ".$item_id." AND user_cargo.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=9');
					}
				
					$new_funds = $user_funds + ($item_price * $sell);
				
					$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=14');
					}
					
					$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
					$result = $conn->query($sql);
					$sql_array = $result->fetch_array(MYSQLI_ASSOC);
					$system_location = $sql_array['user_location'];
					
					$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$sell.", ".$planet_id.", '-', ".$_SESSION['user_id'].", ".$system_location.", 'Sale')";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=19');
					}
				
					header('Location: ../php/map.php?message_id=13');
				
				}
			
			} else { //item is not already in cargo
			
				//insert statement to add item to planet market
				$sql = "INSERT INTO univ_market (market_item_id, market_quantity, planet_id) VALUES (".$item_id.", ".$sell.", ".$planet_id.")";
				if ($conn->query($sql) === FALSE) { //query fails
					//whoops
					header('Location: ../php/map.php?message_id=17');
				}
				
				if ($sell === $cargo_amount){ //we now have 0 in cargo
					
					//delete statement to remove from table
					$sql = "DELETE FROM user_cargo WHERE user_cargo.item_id = ".$item_id." AND user_cargo.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=16');
					}
				
					$new_funds = $user_funds + ($item_price * $sell);
				
					$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=14');
					}
					
					$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
					$result = $conn->query($sql);
					$sql_array = $result->fetch_array(MYSQLI_ASSOC);
					$system_location = $sql_array['user_location'];
					
					$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$sell.", ".$planet_id.", '-', ".$_SESSION['user_id'].", ".$system_location.", 'Sale')";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=19');
					}
				
					header('Location: ../php/map.php?message_id=13');
				
				} else { //we still have this item in cargo
				
					//remove how many we want to sell from cargo
					$new_cargo_amount = $cargo_amount - $sell;
				
					//update statement to change the number in the table
					$sql = "UPDATE user_cargo SET user_cargo.item_amount = ".$new_cargo_amount." WHERE user_cargo.item_id = ".$item_id." AND user_cargo.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=9');
					}
				
					$new_funds = $user_funds + ($item_price * $sell);
				
					$sql = "UPDATE user_table SET user_table.user_money = ".$new_funds." WHERE user_table.user_id = ".$_SESSION['user_id']."";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=14');
					}
					
					$sql = "SELECT user_location from user_table WHERE user_id = ".$_SESSION['user_id']."";
					$result = $conn->query($sql);
					$sql_array = $result->fetch_array(MYSQLI_ASSOC);
					$system_location = $sql_array['user_location'];
					
					$sql = "INSERT INTO user_transactions (amount, planet_location, plus_minus, user_id, system_location, transaction_type) VALUES (".$sell.", ".$planet_id.", '-', ".$_SESSION['user_id'].", ".$system_location.", 'Sale')";
					if ($conn->query($sql) === FALSE) { //query fails
						//whoops
						header('Location: ../php/map.php?message_id=19');
					}
				
					header('Location: ../php/map.php?message_id=13');
				
				}
			
			}
			
		}
		
	} 

?>