<?php

    //this is to get the price a planet will pay for your cargo
    function get_purchase_sale_price ($number_of_items_in_stock, $item_price) {

	    //number of items
		if ($number_of_items_in_stock < 1000) {
			$upcharge = 2;
		} elseif ($number_of_items_in_stock < 2000) {
			$upcharge = 1.9;
		} elseif ($number_of_items_in_stock < 3000) {
			$upcharge = 1.8;
		} elseif ($number_of_items_in_stock < 4000) {
			$upcharge = 1.7;
		} elseif ($number_of_items_in_stock < 5000) {
			$upcharge = 1.6;
		} elseif ($number_of_items_in_stock < 6000) {
			$upcharge = 1.5;
		} elseif ($number_of_items_in_stock < 7000) {
			$upcharge = 1.4;
		} elseif ($number_of_items_in_stock < 8000) {
			$upcharge = 1.3;
		} elseif ($number_of_items_in_stock < 9000) {
			$upcharge = 1.2;
		} elseif ($number_of_items_in_stock < 10000) {
			$upcharge = 1.1;
		}elseif ($number_of_items_in_stock > 10001) {
			$upcharge = 1;
		}
	
	
	    $final_price = $item_price * $upcharge;

	    return $final_price;
	
    }

?>