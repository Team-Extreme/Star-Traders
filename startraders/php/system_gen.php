<?php
set_time_limit(0);
        require 'db_connect.php';
		$num = 1;
    for ($x = 0; $x <= 100; $x++) { //create systems "100 is the number of systems it will generate."
					//create system
  //START STAR GENERATION	
		
				$star_array = array(
					array("O",60,25000,30000,15,1400000),
					array("B",18,11000,25000,7,20000),
					array("A",3.2,7500,11000,2.5,80),
					array("F",1.7,6000,7500,1.3,6),
					array("G",1.1,5000,6000,1.1,1.2),
					array("K",0.8,3500,5000,0.9,0.4),
					array("M",0.4,1000,3500,0.4,0.04)
				);
					//STAR CLASS,AVERAGE MASS(1=1Sun),TEMPERATURE MIN/TEMPERATURE MAX(KELVIN),AVERAGE RADIUS(1=1Sun),AVERAGE LUMINOSITY(1=1Sun)
					$star_class = rand(0,6);
					
		
		$star_mass_a=$star_array["$star_class"][1];
		
		$star_mass_b=$star_array["$star_class"][1];
		
		$star_mass_final=$star_array["$star_class"][1];
		
		$star_temp_a=$star_array["$star_class"][2];
		
		$star_temp_b=$star_array["$star_class"][2];
				
		$star_temp_final=$star_array["$star_class"][2];
		
		$star_radius_a = $star_array["$star_class"][4];
		
		$star_radius_b = $star_array["$star_class"][4];
		
		$star_radius_final = $star_array["$star_class"][4];		
		
		$star_limo_a = $star_array["$star_class"][5];
		
		$star_limo_b = $star_array["$star_class"][5];
				
		$star_limo_final = $star_array["$star_class"][5];
		
		
		$star_class_final = $star_array["$star_class"][0];
		
		$star_mass_final = $star_mass_final;
		
		$star_temp_final = $star_temp_final;
		
		$star_radius_final = $star_radius_final;
		
		$star_lumo_final = $star_limo_final;
		
		$star_x=120;
        
		$star_y=120;
		

       
	    //END STAR GENERATION
		
		//START SYSTEM GENERATION
		
		$system_array = array("Andromeda", "Aries", "Ajax", "Apollo", "Castor", "Daemon", "Hermes", "Theseus","Caldron", "Aquilla", "Proteus", "Atlas", "Ailea", "Black", "Unathea", "Aopra","Taloth", "Eria", "Mapra", "Naviri", "Haonus", "Kurus", "Aurus", "Diria","Asypso", "Velosia", "Gek", "Gert", "Rune", "Obion", "Freya", "Runifile","Scarrow", "Laibach", "Green", "Pinus", "Velos", "Melodrus", "Frarn", "Hek","Filus", "Bern", "Cern", "Velum", "Sargon", "NewSol", "Grup", "Bleo","Farse", "Rileum", "Astrus", "Nevor", "Felum", "Grak", "Teitov", "Zenom","Felnoe", "Ovecury", "Xoalea", "Chion", "Oupra", "Zuwei", "Saelara", "Chalveon","Perlos", "Deogawa", "Uchoth", "Obtalium", "Vega", "Zeta", "Alpha", "Beta","Gamma", "Theta", "Omega", "Vapra", "Bespin", "Vespa", "Igeon", "Ratheon","Celcius", "Musk", "Hel", "Coliv", "Blerp", "Cacus", "Bismuth", "Barundi","Thonov", "Valkov", "Antov", "Tovis", "Rebus", "Atune", "Leviturn", "Nunia","Nunes", "Siicury", "Kolvone", "Atania", "Saowei", "Leotau", "Odius", "Opeas","Biziri", "Niburu", "Caltron", "Grego", "Vaz", "Brunano", "Grut","Terridine","Velzia", "Nazila", "Cerberus", "Zeras", "Umbrea", "Fen", "Ferelas","Stormwind","Hisav", "Avote", "Newas", "Menva", "Nerva", "Uri", "Garga","Nehov","Nabia", "Hetoo", "Maguda", "Menios", "Khufu", "Temple", "Sanctum","Cheops","Knara", "Necho", "Neto", "Vei", "Zei", "Zuc", "Halcroyn","Merlin","Prince", "Cheff", "Madriga", "Menilous", "Zuccu", "Zamu", "Ballobi");

		$system_x =rand(300,4500);
        
		$system_y =rand(300,2500);
        
		$system_description= "THIS IS A SYSTEM";
        
		$system_id=$num++;
        
		$system_name=$system_array[$system_id];
		
		$system_security=rand(1,10);

		//END SYSTEM GENERATION
		echo $star_class_final;
		echo $star_mass_final;
		echo $star_temp_final;
		echo $star_radius_final;
		echo $star_lumo_final;
		echo "</br>";


			$sql = "INSERT INTO univ_star(system_id,star_name,star_x,star_y,star_class,star_mass,star_temperature,star_radius,star_lumo) VALUES ('$system_id','$system_name','$star_x','$star_y','$star_class_final','$star_mass_final','$star_temp_final','$star_radius_final','$star_lumo_final')";
			$conn->query($sql);

			echo "</br>";
            $sql = "INSERT INTO univ_system (system_id,system_name,system_x,system_y,system_description,system_security) VALUES ('$system_id','$system_name','$system_x','$system_y','$system_description','$system_security')";
            $conn->query($sql);

			echo "</br>";
			$num_planet=1;
			
            $number=rand(1,9);
            $num_planet=1;
            
			for ($n = 0; $n <= $number; $n++) {
            
            $num_planet_name=$num_planet++;
            $planet_name = $system_name;
            $planet_name_final=$planet_name." ".$num_planet_name;
            $planet_x =rand(10,240);
            $planet_y =rand(10,240); 

                
            $j = ( pow(120-$planet_x,2));
			$y = ( pow(120-$planet_y,2));
			$distance = ( sqrt($j + $y) );
			$roundto2places = round($distance,2);
            $star_distance = round($distance,2)/10;
            $star_distance = $star_distance/2;
            $planet_description= ''.$planet_name_final.' is '.$star_distance.' <br /> AU away from its star';
            $random_habit=rand(0,1);
			$random_type=rand(1,10);
			$sql = "INSERT INTO univ_planet (system_id,planet_name,planet_type,planet_habit,planet_x,planet_y,star_distance,planet_description) VALUES ('$system_id','$planet_name_final','$random_type','$random_habit','$planet_x','$planet_y','$star_distance','$planet_description')";
            $conn->query($sql);

}
}

        $conn->close();
?>
