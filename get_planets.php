<?php

		require 'db_connect.php';

		$sql = "SELECT * FROM user_table where user_id ='".$_SESSION['user_id']."'"; // Fetch all user data by id

		$result = $conn->query($sql);
		$sql_array = $result->fetch_array(MYSQLI_ASSOC); //Create an array of this data which i can select elements from.

		$planet_location = $sql_array["user_location_planet"];
		$number = $sql_array["user_location"];


		$sql = "SELECT * FROM univ_planet where system_id =$number"; //Select all of the planet entries for the system the user is currently in.

		$result = $conn->query($sql);

		while ($rows = $result->fetch_assoc()) {
            $fuel_cost=69;
            $str = preg_replace('/\s+/', '', $rows['planet_name']);
            $str = strtolower($str);
			if ($planet_location == $rows['planet_id']){

			$player_x=$rows['planet_x'];
			$player_y=$rows['planet_y'];
            // var filus7 = xy(25,205);L.marker(filus7,{icon: playerIcon}).addTo(map).bindPopup('<p>Location :: Filus 7<br>This is a Planet</p>');
            // The code below generates what is displayed above the code is broken down into seperate lines because it is easier to troubleshoot this took a long time javascript and php don't play well together {icon: playerIcon} generates a red marker because this is where the player is currently located.
			echo 'var ';
            echo $str;
            echo ' = xy(';
            echo $rows['planet_x'];
            echo ',';
            echo $rows['planet_y'];
            echo ');';
			echo 'L.marker(';
            echo $str;
            echo ',{icon: playerIcon}).addTo(map).bindPopup(\'';
            echo '<p>';
            echo 'Location :: ';
            echo $rows['planet_name'];
            echo '<br>';
            echo $rows['planet_description'];
            echo '</p>';
            echo '\'); ';
						}else{
            // var filus1 = xy(25,205);L.marker(filus1,{icon: starIcon}).addTo(map).bindPopup('<p>Location :: Filus 7<br>This is a Planet</p>');
            // by using {icon: starIcon} instead of {icon: playerIcon} when the player location doesn't match the planet id i can display all of the planets the player is not located at as blue.
			echo 'var ';
            echo $str;
            echo ' = xy(';
            echo $rows['planet_x'];
            echo ',';
            echo $rows['planet_y'];
            echo ');';
			echo 'L.marker(';
            echo $str;
            echo ',{icon: starIcon}).addTo(map).bindPopup(\'';
            echo '<p>';
            echo $rows['planet_name'];
            echo '  ::  <a class="jumplink" href="../process/jump_planet_process.php?planet_id=';
            echo $rows['planet_id'];
            echo '">JUMP</a>';
            echo '<br>';
            echo $rows['planet_description'];
            echo '</p>';
            echo '\'); ';
						}
		}

            $sql = "SELECT * FROM univ_star where system_id = $number";
		      $result = $conn->query($sql);
                $sql_array = $result->fetch_array(MYSQLI_ASSOC);
       
            $starman = $sql_array['star_name'];
            $starman = strtolower($starman);
            $star_id=0;

			if ($planet_location == $star_id){

            // var filus7 = xy(25,205);L.marker(filus7,{icon: playerIcon}).addTo(map).bindPopup('<p>Location :: Filus 7<br>This is a Planet</p>');
            // The code below generates what is displayed above the code is broken down into seperate lines because it is easier to troubleshoot this took a long time javascript and php don't play well together {icon: playerIcon} generates a red marker because this is where the player is currently located.
			
            $player_x=$sql_array['star_x'];
			$player_y=$sql_array['star_y'];    
            echo 'var ';
            echo $starman;
            echo ' = xy(';
            echo $sql_array['star_x'];
            echo ',';
            echo $sql_array['star_y'];
            echo ');';
			echo 'L.marker(';
            echo $starman;
            echo ',{icon: playerIcon}).addTo(map).bindPopup(\'';
            echo '<p>';
            echo 'Location :: ';
            echo $starman;
            echo '<br>';
            echo 'STAR CLASS :: ';
            echo $sql_array['star_class'];
            echo '</p>';
            echo '\'); ';
						}

            else{
            // var filus1 = xy(25,205);L.marker(filus1,{icon: starIcon}).addTo(map).bindPopup('<p>Location :: Filus 7<br>This is a Planet</p>');
            // by using {icon: starIcon} instead of {icon: playerIcon} when the player location doesn't match the planet id i can display all of the planets the player is not located at as blue.
			echo 'var ';
            echo $starman;
            echo ' = xy(';
            echo $sql_array['star_x'];
            echo ',';
            echo $sql_array['star_y'];
            echo ');';
			echo 'L.marker(';
            echo $starman;
            echo ',{icon: localstarIcon}).addTo(map).bindPopup(\'';
            echo '<p>';
            echo $starman;
            echo '  ::  <a class="jumplink" href="../process/jump_planet_process.php?planet_id=';
            echo $star_id;
            echo '">JUMP</a>';
            echo '<br>';
            echo 'STAR CLASS :: ';   
            echo $sql_array['star_class'];
            echo '</p>';
            echo '\'); ';
						}
		


			// The code below centers the system map on the players location which is taken from the location in the database
            echo 'map.setView';
			echo '(xy(';
			echo $player_x;
			echo ',';
			echo $player_y;
			echo '), -1)';
            $conn->close();
?>
