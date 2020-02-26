<?php 

    session_start();

        require '../php/db_connect.php';
        $system=$_GET['system_id'];
        $fuel_cost=$_GET['system_id'];

        $sql = "SELECT MIN(planet_id)  FROM univ_planet where system_id ='".$_GET['system_id']."'";
       
        $result = $conn->query($sql);
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
        
        $lowid=$sql_array["MIN(planet_id)"];	

        $sql = "SELECT system_x,system_y  FROM univ_system where system_id ='".$_GET['system_id']."'";
       
        $result = $conn->query($sql);
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$player_x =$sql_array["system_x"];
		$player_y =$sql_array["system_y"];

        $sql = "SELECT ship_fuel FROM user_ship where user_id ='".$_SESSION['user_id']."'";
       
        $result = $conn->query($sql);
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$ship_fuel =$sql_array["ship_fuel"];
        if ($ship_fuel >= $fuel_cost){
            $ship_fuel_update= $ship_fuel - $fuel_cost
        $sql = "UPDATE user_table SET user_location ='".$_GET['system_id']."' WHERE user_id='".$_SESSION['user_id']."'";

        $results =$conn->query($sql);
        
        $sql = "UPDATE user_table SET user_location_planet='".$lowid."' WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);
		
		        $sql = "UPDATE user_table SET user_x='".$player_x."' WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);
		        $sql = "UPDATE user_table SET user_y='".$player_y."' WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);
        $sql = "UPDATE user_ship SET ship_fuel ='".$ship_fuel_update."' WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);
        header('Location:../php/map.php?message_id=4');
            
            
        
}
else{
            header('Location:../php/map.php?message_id=8');
    
}
?>