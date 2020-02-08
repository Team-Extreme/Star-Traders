<?php 


        require 'db_connect.php';
        $time=time();
        $login_time=$time - 1800;


        $sql = "SELECT user_table.user_valid,user_table.active,user_table.username,user_table.user_location,user_table.user_location_planet,univ_system.system_name,univ_system.system_security,univ_planet.planet_name FROM user_table,univ_system,univ_planet where user_id='".$_SESSION['user_id']."' AND univ_system.system_id =user_table.user_location AND univ_planet.planet_id = user_table.user_location_planet";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);

        if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $login_time) 
        {
            echo 'USERNAME: ';
            echo $sql_array['username'];
            echo "<br />";
            echo 'SYSTEM LOCATION: ';
            echo $sql_array['system_name'];
            echo "<br />";
            echo 'PLANET LOCATION: ';
            echo $sql_array['planet_name'];
			echo "<br />";
			echo 'SYSTEM SECURITY: ';
            if ($sql_array['system_security'] < 3)
			{	echo "<font color='#f44336'>".$sql_array['system_security']."</font>";
		}
			if ($sql_array['system_security'] >2 && $sql_array['system_security']<7)
			{	echo "<font color='#ff9800;'>".$sql_array['system_security']."</font>";
		}
			if ($sql_array['system_security'] >6)
			{	echo "<font color='#4CAF50'>".$sql_array['system_security']."</font>";
		}
		}
?>