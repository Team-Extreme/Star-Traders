<?php
		require 'db_connect.php';


if (isset($_GET['message_id'])) {


		
		$message =$_GET['message_id'];
	
		$sql = "SELECT * FROM system_message where message_id ='".$_GET['message_id']."'";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);

if ($sql_array['message_type']=="alert success") {
		echo"<div class='".$sql_array['message_type']."'>";
		echo"<span class=closebtn>&times;</span>";
		echo"".$sql_array['message_content']."";
		echo "</div>";}


if ($sql_array['message_type']=="alert") {
		echo"<div class='".$sql_array['message_type']."'>";
		echo"<span class=closebtn>&times;</span>";
		echo"'".$sql_array['message_content']."'";
		echo "</div>";
}
if ($sql_array['message_type']=="alert info") {
		echo"<div class='".$sql_array['message_type']."'>";
		echo"<span class=closebtn>&times;</span>";
		echo"'".$sql_array['message_content']."'";
		echo "</div>";
}
}
?>