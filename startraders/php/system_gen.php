		<?php

        require 'db_connect.php';
				$num = 1;
        for ($x = 0; $x <= 100; $x++) { //create systems "100 is the number of systems it will generate."
					//create system
        $system_array = array("Andromeda", "Aries", "Ajax", "Apollo", "Castor", "Daemon", "Hermes", "Theseus","Caldron", "Aquilla", "Proteus", "Atlas", "Ailea", "Black", "Unathea", "Aopra","Taloth", "Eria", "Mapra", "Naviri", "Haonus", "Kurus", "Aurus", "Diria","Asypso", "Velosia", "Gek", "Gert", "Rune", "Obion", "Freya", "Runifile","Scarrow", "Laibach", "Green", "Pinus", "Velos", "Melodrus", "Frarn", "Hek","Filus", "Bern", "Cern", "Velum", "Sargon", "New Sol", "Grup", "Bleo","Farse", "Rileum", "Astrus", "Nevor", "Felum", "Grak", "Teitov", "Zenom","Felnoe", "Ovecury", "Xoalea", "Chion", "Oupra", "Zuwei", "Saelara", "Chalveon","Perlos", "Deogawa", "Uchoth", "Obtalium", "Vega", "Zeta", "Alpha", "Beta","Gamma", "Theta", "Omega", "Vapra", "Bespin", "Vespa", "Igeon", "Ratheon","Celcius", "Musk", "Hel", "Coliv", "Blerp", "Cacus", "Bismuth", "Barundi","Thonov", "Valkov", "Antov", "Tovis", "Rebus", "Atune", "Leviturn", "Nunia","Nunes", "Siicury", "Kolvone", "Atania", "Saowei", "Leotau", "Odius", "Opeas","Biziri", "Niburu", "Caltron", "Grego", "Vaz", "Ne'Sol", "Grut","Terridine","Velzia", "Nazila", "Cerberus", "Zeras", "Umbrea", "Fen", "Ferelas","Stormwind","Hisav", "Avote", "Newas", "Menva", "Nerva", "Uri", "Garga","Nehov","Nabia", "Hetoo", "Maguda", "Menios", "Khufu", "Temple", "Sanctum","Cheops","Knara", "Necho", "Neto", "Vei", "Zei", "Zuc", "Halcroyn","Merlin","Prince", "Cheff", "Madriga", "Menilous", "Zuccu", "Zamu", "Ballobi");
            
        $star_classification_array = array("O","B","A","F","G","K","M");
        $randIndex = array_rand($star_classification_array);
        $system_x =rand(300,4500);
        $system_y =rand(300,2500);
        $system_description= "THIS IS A SYSTEM";
        $system_id=$num++;
        $system_name=$system_array[$system_id];
		$system_security=rand(1,10);
        $star_x=120;
        $star_y=120;
        $star_class = $star_classification_array[$randIndex];
          $sql = "INSERT INTO univ_star(system_id,star_name,star_x,star_y,star_class) VALUES ('$system_id','$system_name','$star_x','$star_y','$star_class')";
            $conn->query($sql);
            

				$sql = "INSERT INTO univ_system (system_id,system_name,system_x,system_y,system_description,system_security) VALUES ('$system_id','$system_name','$system_x','$system_y','$system_description','$system_security')";
				$conn->query($sql);
            $num_planet=1;
            echo $system_id,$system_name,$system_x,$system_y,$system_description;
            $number=rand(1,9);
            $num_planet=1;
            for ($n = 0; $n <= $number; $n++) {
            $num_planet_name=$num_planet++;
            $planet_name = $system_name;
            $planet_name_final=$planet_name." ".$num_planet_name;
            $planet_x =rand(10,240);
            $planet_y =rand(10,240);
            $planet_description= "This is a Planet";

            $sql = "INSERT INTO univ_planet (system_id,planet_name,planet_x,planet_y,planet_description) VALUES ('$system_id','$planet_name_final','$planet_x','$planet_y','$planet_description')";
            $conn->query($sql);
                echo $planet_name_final;

}
}

        $conn->close();

        ?>
