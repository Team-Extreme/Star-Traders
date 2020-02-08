<?php

		require '../php/db_connect.php';
	
		$username=$_POST['username'];
		$password=$_POST['password'];
	
		$sql = "SELECT * FROM user_table where username='$username' and password='$password'";
	
		$result = $conn->query($sql);
	
		$sql_array = $result->fetch_array(MYSQLI_ASSOC);

		if ($result->num_rows >0 && $username == $sql_array["username"] && $password == $sql_array["password"] && $sql_array["user_valid"] == TRUE) {
	
			session_start();
	
			$id_user=$sql_array["user_id"];
			
			$time=time();
			
			$session_id=session_id();
            $_SESSION['user_id']=$id_user;
            $_SESSION['active']= TRUE;
            $_SESSION['last_action']=$time;
	
			$sql = "UPDATE user_table SET last_session='$session_id',log_time=$time,active='TRUE',last_action=$time WHERE user_id =$id_user";

			$results =$conn->query($sql);
            
             header('Location: ../php/map.php?message_id=1');   

		}
		else{
				
			header('Location: ../php/index.html');

		}
			$conn->close();
?>

	
