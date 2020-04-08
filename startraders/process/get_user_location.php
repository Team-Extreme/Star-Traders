<?php 
    require 'db_connect.php';
    $time=time();
    $login_time=$time - 1800;

	$sql = "SELECT user_location_planet FROM user_table where user_id ='".$_SESSION['user_id']."'";

	$result = $conn->query($sql);
	
    $sql_array = $result->fetch_array(MYSQLI_ASSOC);

	$location_sql = $sql_array['user_location_planet'];

	if($location_sql == 0){
        $sql = "SELECT user_table.user_valid,user_table.active,user_table.username,user_table.user_location,user_table.user_location_planet,univ_system.system_name,univ_system.system_security FROM user_table,univ_system where user_id='".$_SESSION['user_id']."' AND univ_system.system_id =user_table.user_location";
        
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);

        if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $login_time) {

            echo 'STAR '.$sql_array['system_name'];
		}
    }else{
        
            $sql = "SELECT user_table.user_valid,user_table.active,user_table.username,user_table.user_location,user_table.user_location_planet,univ_system.system_name,univ_system.system_security,univ_planet.planet_name FROM user_table,univ_system,univ_planet where user_id='".$_SESSION['user_id']."' AND univ_system.system_id =user_table.user_location AND univ_planet.planet_id = user_table.user_location_planet";

		    $result = $conn->query($sql);
	
            $sql_array = $result->fetch_array(MYSQLI_ASSOC);

            if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $login_time) {

                echo $sql_array['planet_name'];

                }
            }
        

?>
