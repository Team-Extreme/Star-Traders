<?php 


        require 'db_connect.php';

        echo"<div class=contscrollbarcont>";
        echo"<div class= scrollbar id=style-4>";
        echo"<section>";
        echo"<div class=row>";
		echo"<div class=col><font color=#17D4FE>id</font></div>";
		echo"<div class=col><font color=#17D4FE>Amount</font></div>";
		echo"<div class=col><font color=#17D4FE>Planet</font></div>";
        echo"<div class=col><font color=#17D4FE>Type</font></div>";
        echo"</div>";

        $sql = "SELECT * from user_transactions WHERE user_id=".$_SESSION['user_id']."";

		$result = $conn->query($sql);

        while ($rows = $result->fetch_assoc()) {
        $planet_location=$rows['planet_location'];
		$system_location=$rows['system_location'];
              
        echo"<div class=row>"; 
        $sql1 = "SELECT planet_name from univ_planet WHERE planet_id='$planet_location' and system_id='$system_location'";
		$result1 = $conn->query($sql1);
		$sql_array1 = $result1->fetch_array(MYSQLI_ASSOC);
        $planet_name=$sql_array1['planet_name'];
        echo "<div class = col>".$rows['transaction_id']."</div>";
                  if ($rows['plus_minus'] == '-')
			{	echo "<div class = col><font color=#870000>-".$rows['amount']."</font></div>";
		}
                        if ($rows['plus_minus'] == '+')
			{	echo "<div class = col><font color=#1eff00>+".$rows['amount']."</font></div>";
		}
        echo "<div class = col>".$planet_name."</div>";
        echo "<div class = col>".$rows['transaction_type']."</div>";
		echo "</div>";
}
echo"</section>";
echo "</div>";
echo "</div>";
?>