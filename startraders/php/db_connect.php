<?php
$servername = "localhost";
$username_db = "root";
$password_db = "";
$dbname = "the_universe";

//This below uses the credentials above to create a new connection to the database this page will be included on all pages requireing database connectivity.
$conn = new mysqli($servername,$username_db,$password_db,$dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
