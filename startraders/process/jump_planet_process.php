<?php 

    session_start();

        require '../php/db_connect.php';
        $system=$_GET['planet_id'];

        $sql = "UPDATE user_table SET user_location_planet=$system WHERE user_id='".$_SESSION['user_id']."'";
        $results =$conn->query($sql);

        header('Location:../php/map.php');

?>