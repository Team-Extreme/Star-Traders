<?php 


    require 'db_connect.php';
    $time=time();
    $login_time=$time - 1800;

	$sql = "SELECT user_location_planet FROM user_table where user_id ='".$_SESSION['user_id']."'";

	$result = $conn->query($sql);
	
    $sql_array = $result->fetch_array(MYSQLI_ASSOC);

	$location_sql = $sql_array['user_location_planet'];

	if($location_sql == 0){
        $sql = "SELECT user_table.user_valid, user_table.active, univ_star.star_name, univ_star.star_class, univ_star.star_mass, univ_star.star_temperature, univ_star.star_radius, univ_star.star_lumo FROM user_table, univ_star WHERE user_id='".$_SESSION['user_id']."' AND univ_star.system_id =user_table.user_location";
        
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);

        if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $login_time) {
            echo 'Star Name: ';
            echo $sql_array['star_name'];
            echo "<br />";
            echo 'Star Class:';
            echo $sql_array['star_class'];
            echo "<br />";
            echo 'Star Mass(Suns): ';
            echo 'STAR '.$sql_array['star_mass'];
			echo "<br />";
			echo 'Temperature(Kelvin): ';
			echo $sql_array['star_temperature'];
			echo "<br />";
			echo 'Star Radius(Suns): ';
            echo 'STAR '.$sql_array['star_radius'];
			echo "<br />";
			echo 'Star Luminosity: ';
            echo 'STAR '.$sql_array['star_lumo'];
			echo "<br />";
        }
        
    }else{
        
            $sql = "SELECT user_table.user_valid, user_table.active, univ_system.system_name, univ_planet.planet_name,univ_planet.planet_type,univ_planet.star_distance, univ_planet.planet_description, univ_planet.planet_habit FROM user_table, univ_system, univ_planet WHERE user_id='".$_SESSION['user_id']."' AND univ_system.system_id =user_table.user_location AND univ_planet.planet_id = user_table.user_location_planet";

		    $result = $conn->query($sql);
	
            $sql_array = $result->fetch_array(MYSQLI_ASSOC);

            if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $login_time) {
	        echo 'System Name: ';
            echo $sql_array['system_name'];
            echo "<br />";
			echo 'Planet Name: ';
			echo $sql_array['planet_name'];
			echo '<br />';
            echo 'Planet Type: ';
			$sql1 = "SELECT type_name,type_description from univ_planet_type where type_id='".$sql_array['planet_type']."'";
		    $result1 = $conn->query($sql1);
			$sql_array1 = $result1->fetch_array(MYSQLI_ASSOC);
            echo $sql_array1['type_name'];
			echo "<br />";
			echo 'Planet Description: ';
			echo $sql_array1['type_description'];
			echo "<br />";
			echo 'Distance From Star: ';
            echo $sql_array['star_distance'];
            echo "<br />";
            echo 'Inhabitation Status: ';
			if ($sql_array['planet_habit'] == 1){
			echo '<font color=#4CAF50>Inhabited</font>';
			}
			elseif ($sql_array['planet_habit'] == 0){
			echo '<font color=#f44336>Uninhabited</font>';
			}
		}
			echo "<br />";

		    }	
       

?>
