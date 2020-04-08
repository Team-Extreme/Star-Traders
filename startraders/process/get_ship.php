<?php 


        require 'db_connect.php';



        $sql = "SELECT * from user_ship WHERE user_id=".$_SESSION['user_id']."";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
            $cargo_limit=$sql_array['ship_cargo_limit'];

            echo 'SHIP: ';
            echo $sql_array['ship_name'];
            echo "<br />";
            echo 'Ship Fuel: ';
            echo $sql_array['ship_fuel'];
            echo "/";
            echo $sql_array['ship_fuel_limit'];
$calc_count1 = ( $sql_array['ship_fuel'] / $sql_array['ship_fuel_limit'] ) * 100;
echo "<div class=w3-border>";
echo "<div class=w3-grey style=height:20px;width:".$calc_count1."%></div>";
echo "</div>";
			echo "<br />";


        $sql = "SELECT SUM(item_amount) from user_cargo WHERE user_id=".$_SESSION['user_id']."";

		$result = $conn->query($sql);

        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
            echo 'Cargo Space: ';
            echo $sql_array['SUM(item_amount)'];
            echo '/';
            echo $cargo_limit;

$calc_count = ( $sql_array['SUM(item_amount)'] / $ship_cargo_limit ) * 100;
echo"</section>";
echo "<div class=w3-border>";
echo "<div class=w3-grey style=height:20px;width:".$calc_count."%></div>";
echo	"</a>";
echo "</div>";
?>