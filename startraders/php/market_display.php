<?php 

		//to allow databse connections
        require 'db_connect.php';
		//for utility functions
		include 'market_operations.php';

		//set up headers
		echo'<div class="contscrollbarcont">';
		echo'<div class="scrollbar" id="style-4">';
		echo'<section>';
        echo'<div class="row">';
		echo'<div class="colmarket"><font color=#17D4FE>Item</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Stock</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Cargo</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Price</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Sell</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Buy</font></div>';
		echo'<div class="colmarket"><font color=#17D4FE>Submit</font></div>';
        echo"</div>";

		//get where the user currently is
        $sql = "SELECT user_location_planet from user_table WHERE user_id=".$_SESSION['user_id']."";
	
		$result = $conn->query($sql);

	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
        $planet_id=$sql_array['user_location_planet'];

		if ($planet_id == 0) {
			//if the planet id from the user table is 0 then the user is at a sun and there is no buying or selling on suns
		} else {
		
			$sql = "SELECT univ_item.item_id, univ_item.item_name,univ_item.item_rarity, univ_item.item_base_price, univ_market.market_quantity, user_cargo.item_amount FROM univ_item, univ_market, user_cargo WHERE univ_market.market_item_id = univ_item.item_id AND univ_market.market_item_id = user_cargo.item_id AND univ_market.planet_id = ".$planet_id."";
			$result = $conn->query($sql);
			
			while ($rows = $result->fetch_assoc()){
				$item_rarity = $rows['item_rarity'];
				$item_id = $rows['item_id'];
				$item_name = $rows['item_name'];
				$item_price = $rows['item_base_price'];
				$planet_stock = $rows['market_quantity'];
				$user_stock = $rows['item_amount'];
				$price = get_purchase_sale_price($planet_stock, $item_price);
				
				echo '<div class="row">';

					if ($item_rarity == 1)
			{	echo '<div class = "colmarket"><font color="#1eff00">'.$item_name.'</font></div>';
		}
                        if ($item_rarity == 2)
			{	echo '<div class = "colmarket"><font color="#0070dd">'.$item_name.'</font></div>';
		}
                        if ($item_rarity == 3)
			{	echo '<div class = "colmarket"><font color="#a335ee">'.$item_name.'</font></div>';
		}
		                if ($item_rarity == 4)
			{	echo '<div class = "colmarket"><font color="#ff8000">'.$item_name.'</font></div>';
		}
                        if ($item_rarity == 5)
			{	echo '<div class = "colmarket"><font color="#870000">'.$item_name.'</font></div>';
			}

				echo '<div class = "colmarket">';
				echo $planet_stock;
				echo '</div>';
				echo '<div class = "colmarket">';
				echo $user_stock;
				echo '</div>';
				echo '<div class = "colmarket">';
				echo $price;
				echo '</div>';
				echo '<div class ="colmarket">';
				echo '<form action = "process_purchase.php" method = "get">';
				echo '<input type = "text" class="marketbuysellbox" id = "sell"> </div>';
				echo '<div class = "colmarket"><input class="marketbuysellbox" type = "text" id = "buy"> </div>';
				echo '<div class = "colmarket"><input class="submitmarket" type = "submit" value = "submit"></form></div>';
				echo '</div>';
				
				
			}
			
		}

	echo"</section>";
	echo "</div>";
	echo "</div>";
?>
