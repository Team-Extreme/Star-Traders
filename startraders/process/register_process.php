<?php

		require '../php/db_connect.php';
	
		$username=$_POST['username'];
		$password=$_POST['password1'];
        $email=$_POST['email'];
		$ship_name=$_POST['shipname'];
	
			session_start();

			
            $starting_system=rand(1,250);
            $starting_planet=1;
			

	
	$sql = "INSERT INTO user_table (username, password, email,active,user_valid,user_location,user_location_planet,user_x,user_y,ship_id) VALUES ('$username','$password','$email','TRUE','TRUE','$starting_system','$starting_planet',0,0,0)";
	
	   if ($conn->query($sql) == TRUE) {

	   }
		else{
				
        echo "Error: " . $sql . "<br>" . $conn->error;

		}
		$sql = "SELECT * FROM user_table where username='".$_POST['username']."'";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$user_id=$sql_array['user_id'];
		$user_location=$sql_array['user_location'];
		
		$sql = "INSERT INTO user_ship (user_id, ship_name, ship_type,ship_fuel,ship_cargo_id,ship_cargo_limit,ship_fuel_limit,ship_fame,ship_speed,ship_atk,ship_arm) VALUES ('$user_id','$ship_name','shiptype','10000','0','3000','0','15000','9','9','9')";
	
	   if ($conn->query($sql) == TRUE) {
	   }
		else{
				
        echo "Error: " . $sql . "<br>" . $conn->error;

		}
			
		$sql = "SELECT * FROM user_ship where user_id='".$user_id."'";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$user_id=$sql_array['user_id'];
		
		$sql="UPDATE user_table SET ship_id = '".$user_id."' where user_id ='".$user_id."'";
	    $results =$conn->query($sql);

		$sql = "SELECT * FROM univ_system where system_id='".$starting_system."'";

		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
		
		$user_x=$sql_array['system_x'];
		$user_y=$sql_array['system_y'];
		
		$sql="UPDATE user_table SET user_x='".$user_x."',user_y='".$user_y."' where user_id ='".$user_id."'";
	    $results =$conn->query($sql);

       
	    header('Location: ../php/index.html'); 
?>

	
