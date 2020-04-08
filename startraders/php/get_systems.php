<?php

		require 'db_connect.php';
	
		$sql = "SELECT * FROM user_table where user_id ='".$_SESSION['user_id']."'";
	
		$result = $conn->query($sql);
		$sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$player_x = $sql_array["user_x"];
		$player_y = $sql_array["user_y"];
		$number = $sql_array["user_location"];

		$sql = "SELECT * FROM univ_system";
	
		$result = $conn->query($sql);
	
		while ($rows = $result->fetch_assoc()) {
            $fuel_cost=69;
            $str = preg_replace('/\s+/', '', $rows['system_name']);
            $str = strtolower($str);
            
			if ($number == $rows['system_id']){


			/* var filus = xy(4408,679);L.marker(filus,{icon: playerIcon}).addTo(map).bindPopup('<p>Location :: Filus<br>THIS IS A SYSTEM</p>');
             The code below generates what is displayed above the code is broken down into seperate lines because it is easier to troubleshoot this took a long time javascript and php don't play well together {icon: playerIcon} generates a red marker because this is where the player is currently located. The jump link is also ommited because the player cannot jump to the system he is located in.  */  
			echo 'var ';
            echo $str;
            echo ' = xy(';
            echo $rows['system_x'];
            echo ',';
            echo $rows['system_y'];
            echo ');';
			echo 'L.marker(';
            echo $str;
            echo ',{icon: playerIcon}).addTo(map).bindPopup(\'';
            echo '<p>';
            echo 'Location :: ';
            echo $rows['system_name'];
            echo '<br>';
            echo $rows['system_description'];
            echo '</p>';
			echo '\'); ';
						}
                         /* var aries = xy(2609,1923);L.marker(aries,{icon: starIcon}).addTo(map).bindPopup('<p>Aries  ::  <a class="jumplink" href="../process/jump_system_process.php?system_id=1">JUMP</a><br>Jump Cost: 69<br>THIS IS A SYSTEM</p>');
                         The code below generates what you see about creating a variable for the map to display. These icons will be blue because they indicate systems the player may jump to.*/  
            else{
			$x = ( pow($rows['system_x']-$player_x,2));
			$y = ( pow($rows['system_y']-$player_y,2));
			$distance = ( sqrt($x + $y) );
			$roundto2places = round($distance,2);

			$fuel_cost = round($distance,2)/10;
			echo 'var ';
            echo $str;
            echo ' = xy(';
            echo $rows['system_x'];
            echo ',';
            echo $rows['system_y'];
            echo ');';
			echo 'L.marker(';
            echo $str;
            echo ',{icon: starIcon})';
			echo'.addTo(map).bindPopup(\'';
            echo '<p>';
            echo $rows['system_name'];
            echo '  ::  <a class="jumplink" href="../process/jump_system_process.php?system_id=';
            echo $rows['system_id'];
            echo '">JUMP</a>';
            echo '<br>';
            echo 'Jump Cost: ';
            echo $fuel_cost;
            echo '<br>';
            echo 'System Security: ';
            if ($rows['system_security'] < 3)
			{	echo "<font color=#f44336>".$rows['system_security']."</font>";
		}
			if ($rows['system_security'] >2 && $rows['system_security']<7)
			{	echo "<font color=#ff9800>".$rows['system_security']."</font>";
		}
			if ($rows['system_security'] >6)
			{	echo "<font color=#4CAF50>".$rows['system_security']."</font>";
		}
            echo '<br>';
            echo $rows['system_description'];
            echo '</p>';
            echo '\')';
			echo '.addTo(map).bindTooltip("';
			echo $str;
			echo '"';
            echo ",{permanent: true,direction: 'bottom'}";
            echo ');';
						}
		}
			echo 'map.setView';
			echo '(xy(';
			echo $player_x;
			echo ',';
			echo $player_y;
			echo '), 0)';
            $conn->close(); 
?>
