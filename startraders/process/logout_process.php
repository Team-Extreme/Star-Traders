<?php 

    session_start();

		require '../php/db_connect.php';

        $user_id= $_SESSION['user_id'];
        $activity=$_SESSION['last_action'];
        $time=time();

        $sql = "UPDATE user_table SET active= 'FALSE' WHERE user_id =$user_id";
        $results =$conn->query($sql);


        session_destroy();

        header('Location: ../php/index.html');

?>