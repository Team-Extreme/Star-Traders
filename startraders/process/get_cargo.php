<?php 
#17D4FE

        require 'db_connect.php';

echo"<div class=contscrollbarcont>";
echo"<div class= scrollbar id=style-4>";
    echo"<section>";
        echo"<div class=row>";
		echo"<div class=col><font color=#17D4FE>Item</font></div>";
		echo"<div class=col><font color=#17D4FE>Amount</font></div>";
		echo"<div class=col><font color=#17D4FE>Type</font></div>";
        echo"</div>";

        $sql = "SELECT * from user_ship WHERE user_id=".$_SESSION['user_id']."";
	
		$result = $conn->query($sql);

	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
        $ship_cargo_limit=$sql_array['ship_cargo_limit'];

        $cargo_count=0;
        $sql = "SELECT * from user_cargo WHERE user_id=".$_SESSION['user_id']."";

		$result = $conn->query($sql);
		while ($rows = $result->fetch_assoc()) {

		
                $item_amount=$rows['item_amount'];
                $finalcount=$cargo_count + $rows['item_amount'];
                $cargo_count =$finalcount;
        			
		$item_id=$rows['item_id'];
            
		$sql1 = "SELECT * from univ_item WHERE item_id='$item_id'";
		
        $result1 = $conn->query($sql1);
		
        $sql_array1 = $result1->fetch_array(MYSQLI_ASSOC);
            

            echo"<div class=row>";
            echo"<span class=field-tip>";
					if ($sql_array1['item_rarity'] == 1)
			{	echo "<div class = col><font color=#1eff00>".$sql_array1['item_name']."</font></div>";
		}
                        if ($sql_array1['item_rarity'] == 2)
			{	echo "<div class = col><font color=#0070dd>".$sql_array1['item_name']."</font></div>";
		}
                        if ($sql_array1['item_rarity'] == 3)
			{	echo "<div class = col><font color=#a335ee>".$sql_array1['item_name']."</font></div>";
		}
		                if ($sql_array1['item_rarity'] == 4)
			{	echo "<div class = col><font color=#ff8000>".$sql_array1['item_name']."</font></div>";
		}
                        if ($sql_array1['item_rarity'] == 5)
			{	echo "<div class = col><font color=#870000>".$sql_array1['item_name']."</font></div>";
			}
            echo"<span class=tip-content>".$sql_array1['item_description']."";
			echo"</span>";
            echo"</span>";


echo "<div class = col>".$item_amount."</div>";
echo "<div class = col>".$sql_array1['item_type']."</div>";
echo "</div>";
}
$final_count_decimal= $finalcount / 100;
$calc_count = ( $finalcount / $ship_cargo_limit ) * 100;
echo"</section>";
echo "<div class=cargo_bar>"; 
echo "<div class=w3-border>";
echo "<div class=w3-grey style=height:20px;width:".$calc_count."%></div>";
echo "</div>";
echo "</div>";
echo "</div>";
echo "</div>";
echo "</div>";
?>