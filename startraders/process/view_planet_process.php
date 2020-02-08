<?php 


        require 'db_connect.php';

        $sql = "SELECT user_location_planet FROM user_table where user_id='".$_SESSION['user_id']."'";
	
		$result = $conn->query($sql);
        
        $planet_id =$sql_array["user_location_planet"];
        

        $sql = "SELECT * from univ_planet where planet_id =$planet_id";
	
		$result = $conn->query($sql);
	
        $sql_array = $result->fetch_array(MYSQLI_ASSOC);


            echo 'PLANET NAME:';
            echo $sql_array['planet_name'];
            echo "<br />";
            echo 'PLANET LOCATION X: ';
            echo $sql_array['planet_x'];
            echo "<br />";
            echo 'PLANET LOCATION Y: ';
            echo $sql_array['planet_y'];
            echo "<br />";
            echo 'Further Planet INFORMATION: ';
            echo "<br />";
            echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus cursus elit sem, eu fringilla odio dapibus sed. Vivamus semper ipsum et metus auctor, a gravida felis sagittis. Fusce non tellus nisl. Cras a neque magna. Donec sodales imperdiet malesuada. Nunc vehicula metus eu mi iaculis ultrices. Proin at libero non quam pharetra tincidunt. Vestibulum ut congue dolor. Duis porttitor arcu at pretium mollis. Aenean quis urna id turpis fringilla interdum vel eget nulla. Pellentesque viverra tellus a quam tincidunt, blandit efficitur arcu blandit. Etiam in urna eget ex condimentum sagittis.

Nullam ultrices augue nec pellentesque tristique. Etiam porta bibendum enim, eget ornare ipsum faucibus a. Vivamus lobortis facilisis risus. Aenean elementum pharetra viverra. Morbi neque tellus, aliquet at convallis ac, sollicitudin vel elit. Nullam vitae nulla erat. Ut varius turpis ut lorem semper egestas vitae et diam. Maecenas vulputate odio sit amet lorem facilisis, non ultricies neque semper. Etiam dignissim tortor metus, non mollis quam convallis rhoncus. Curabitur fringilla nunc in tempus posuere. In hac habitasse platea dictumst. Donec ac sagittis dui. Fusce tempor dignissim enim. Suspendisse potenti. Aliquam mollis urna justo, at ornare diam cursus a. Morbi malesuada enim nulla.

Mauris sapien mi, feugiat eget pellentesque id, vulputate a ex. Donec sed sollicitudin metus. Aliquam erat volutpat. Nam sollicitudin sapien ac ipsum varius aliquam. Fusce gravida quam eu mi laoreet tempor. Nunc quis porta est. Sed tincidunt hendrerit blandit. Phasellus ut metus ut purus sollicitudin sodales.

Aliquam porttitor, purus nec venenatis interdum, mauris ante facilisis ex, porttitor vulputate enim mi non tortor. Donec felis ipsum, pellentesque et arcu ut, euismod suscipit diam. Cras rutrum maximus mauris in auctor. Donec eu efficitur leo. Suspendisse elementum molestie magna, vel mollis massa auctor gravida. Suspendisse eu dapibus tortor. Cras libero tortor, rhoncus sed ante non, posuere dignissim mi.

Integer quis lorem ac orci vehicula fringilla. Praesent vulputate vitae tortor sit amet sagittis. Etiam placerat vulputate tortor, non venenatis elit convallis quis. Nullam mauris ex, finibus vitae magna in, finibus tincidunt quam. Sed posuere elementum nunc a interdum. Suspendisse pharetra ante turpis, sit amet viverra diam aliquet vel. Cras ut tempus turpis. Vestibulum rutrum sagittis pretium. Donec pulvinar dolor ac diam fringilla, vitae fringilla dui fermentum.";


?>