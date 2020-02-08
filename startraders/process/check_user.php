<?php 

    session_start();

        require 'db_connect.php';
        
        $time=time();


        $sql = "SELECT * FROM user_table where user_id='".$_SESSION['user_id']."'";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);
        
        /*Check if a user is active currently, Check if the account is valid hasn't been banned etc and then check when their last action was if it was > 1800 seconds ago make them relog */
        if (isset($_SESSION['active']) && $sql_array['active'] == TRUE && $sql_array["user_valid"] == TRUE && $_SESSION['last_action'] >= $time - 1800) 
        {
        $sql = "UPDATE user_table SET last_action=$time WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);
        }
        else {
        header('Location: ../php/index.html');
}
?>