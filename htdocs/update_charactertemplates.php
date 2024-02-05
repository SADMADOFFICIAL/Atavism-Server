<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
	include_once 'config.inc.php';
	include_once 'conndb_atavism.inc.php';
	include_once 'atavismfunctions.inc.php';
	
	$msc = microtime(true);
	$loopnumber = 0;
	$UpdateLog = "";
	$globalbackdatingerror = false;
	$globalDestroyedItems = 0;
	$globalNumberofBackdatingerrors = 0;
	
			if ( isset( $_GET['table_name'] ) ) {
				$Table_Name = $_GET['table_name'];
			} 
			if ( isset( $_GET['update_time'] ) ) {
				$Update_Time = $_GET['update_time'];
			} 	
			if ( isset( $_GET['type_of_backdating'] ) ) {
				$Type_of_Backdating = $_GET['type_of_backdating'];
			} 
	// Finding all characters in DB
	$query_admin_account_characters  = "SELECT * FROM account_character";
	$result_admin_account_characters = mysql_query($query_admin_account_characters, $conndb_admin);
	
	// Going threw all the characters in the DB
	while($row_admin_account_characters_table = mysql_fetch_array($result_admin_account_characters, MYSQL_ASSOC))
	{
		$characterRace = "";
		
		$admin_account_characterID = $row_admin_account_characters_table['characterId'];
		$admin_account_characterName = $row_admin_account_characters_table['characterName'];
		
		$UpdateLog = $UpdateLog . "Updating Skills for $admin_account_characterName with ID#$admin_account_characterID\n";
		
		//Now lets find the race from the objstore type PLAYER
		$query_atavism_objstore_tables  = "SELECT * FROM objstore WHERE type='$Type_of_Backdating' AND obj_id='$admin_account_characterID'";
		$result_objstore_tables = mysql_query($query_atavism_objstore_tables, $conndb_atavism);
		
		// We should find 2 lines and we will go into the BLOB XML to find the race
		while($row_atavism_objstore_tables = mysql_fetch_array($result_objstore_tables, MYSQL_ASSOC))
		{
			$itemIsToBeDeleted = false;
			$objstore_BLOB = $row_atavism_objstore_tables['data'];
			$newxml = "";
				
			$xml = simplexml_load_string($objstore_BLOB);
			// lets find the race
			$characterRace = findValueInXMLParentSubValue("void", "method", "put", "race", $xml, "itsastring");	
		
			if($characterRace != "") // If We found the race for the character
			{	
				$query_atavism_objstore_tables  = "SELECT data FROM objstore WHERE type='CombatInfo' AND obj_id='$admin_account_characterID'"; 
				$result_objstore_tables = mysql_query($query_atavism_objstore_tables, $conndb_atavism);
				
				$row_objstoreCombatInfo = mysql_num_rows($result_objstore_tables);
				
				if ($row_objstoreCombatInfo == 1) { // Should only fin 1
				
					$row_objstoreCombatInfoData = mysql_fetch_array($result_objstore_tables);
					$objstore_BLOB = $row_objstoreCombatInfoData['data'];
				
					$xml = simplexml_load_string($objstore_BLOB);
					// First find the class of the character
					$characterClass = findValueInXMLParentSubValue("void", "method", "put", "aspect", $xml, "itsastring");
					
					//echo "Character found are type: $characterRace -> $characterClass<br>";
					
					// Now lets find the ID for this Race and Class should have 
					$query_world_content_create_template  = "SELECT id FROM character_create_template WHERE race='$characterRace' AND aspect='$characterClass'"; 
					$result_world_content_create_template = mysql_query($query_world_content_create_template, $conndb_world_content);
					
					$row_characterTemplateID = mysql_fetch_array($result_world_content_create_template);
					$characterTemplateID = $row_characterTemplateID['id'];
					
					
					// Now lets find out the skills info that the character has
					$characterSkillsID = findValueInXMLChildMulti("void", "property", "skills", $xml, "void", "property", "skillID", "itsaint");
					$characterSkillsMaxLevel = findValueInXMLChildMulti("void", "property", "skills", $xml, "void", "property", "skillMaxLevel", "itsaint");
					// Lets not find the parent ID in case it has changed
					//$characterSkillsParent = findValueInXMLChildMulti("void", "property", "skills", $xml, "void", "property", "parentSkill", "itsaint");
					//Lets not find the Name in case it has changed
					//$characterSkillsName = findValueInXMLChildMulti("void", "property", "skills", $xml, "void", "property", "skillName");
					
					
					$characterSkillsID = rtrim($characterSkillsID, "|");
					$characterSkillsIDExplode = explode("|", $characterSkillsID);
				
					// Lets rebuild the skills name and Parent
					$characterSkillsParent = "";
					$characterSkillsName = "";	
					
					foreach($characterSkillsIDExplode as $skillID)
					{
						$query_world_content_skills  = "SELECT id, name, parentSkill, maxLevel FROM skills WHERE id=$skillID"; 
						$result_world_content_skills = mysql_query($query_world_content_skills, $conndb_world_content);
						
						$skillsInfo = mysql_fetch_array($result_world_content_skills);
						
						$characterSkillsParent = $characterSkillsParent . $skillsInfo['parentSkill'] . "|";
						$characterSkillsName = $characterSkillsName . $skillsInfo['name'] . "|"; 
						
					}
					
					
					$characterSkillsMaxLevel = rtrim($characterSkillsMaxLevel, "|");
					$characterSkillsParent = rtrim($characterSkillsParent, "|");
					$characterSkillsName = rtrim($characterSkillsName, "|");
					
					$characterSkillsMaxLevelExplode = explode("|", $characterSkillsMaxLevel);	
					$characterSkillsParentExplode = explode("|", $characterSkillsParent);
					$characterSkillsNameExplode = explode("|", $characterSkillsName); 
					
					//Now we need to get the different skills for that Race and Class
					$query_world_content_skill_template  = "SELECT skill FROM character_create_skills WHERE character_create_id='$characterTemplateID' AND isactive=1"; 
					$result_world_content_skill_template = mysql_query($query_world_content_skill_template, $conndb_world_content);
					
					
					
					// Lets pull the the skills ID and make an explode Array from the SQL table
					$raceClassSkillIDArray = "";
					while ($skillrow = mysql_fetch_array($result_world_content_skill_template, MYSQL_ASSOC))
					{
						$raceClassSkillIDArray = $raceClassSkillIDArray . $skillrow['skill'] . "|";
					}
					
					$raceClassSkillIDArray = rtrim($raceClassSkillIDArray, "|");
					$raceClassSkillIDExplode = explode("|", $raceClassSkillIDArray);
					
					// Now lets compage the 2 arrays
					$skillIdDifference = array_diff($raceClassSkillIDExplode, $characterSkillsIDExplode);
										
					// Lets get how many Skills the character has
					$skillCount = findValueCountInXML("void", "property", "skillID", $xml);	
					
					//Lets add to counter of characters updated
					$loopnumber ++;
										
					//Lets rebuild the skills first by re-creating the existing skills
					for($myCharacterSkills = 0; $myCharacterSkills < $skillCount; $myCharacterSkills++)
					{
						$UpdateLog = $UpdateLog .  "-- Rebuilding Existing Skill: " . $characterSkillsNameExplode[$myCharacterSkills] . "\n";
						$newxml = $newxml . autoIndentXML(4, "") . "<void method=\"put\">\n";
						$newxml = $newxml . autoIndentXML(5, "") . "<int>" . $characterSkillsIDExplode[$myCharacterSkills] . "</int>\n";
						$newxml = $newxml . autoIndentXML(5, "") . "<object class=\"atavism.agis.objects.SkillData\">\n";
						$newxml = $newxml . createXMLParts("void", "property", "parentSkill", "int", $characterSkillsParentExplode[$myCharacterSkills], "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillID", "int", $characterSkillsIDExplode[$myCharacterSkills], "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillMaxLevel", "int", $characterSkillsMaxLevelExplode[$myCharacterSkills], "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillName", "int", $characterSkillsNameExplode[$myCharacterSkills], "", "", "", "", "", 5);
						$newxml = $newxml . autoIndentXML(5, "") . "</object>\n";
						$newxml = $newxml . autoIndentXML(4, "") . "</void>\n";
					}
					
					//And now add the new skills from the difference array
					foreach($skillIdDifference as $skillID)
					{
						$query_world_content_skills  = "SELECT id, name, parentSkill, maxLevel FROM skills WHERE id=$skillID"; 
						$result_world_content_skills = mysql_query($query_world_content_skills, $conndb_world_content);
						
						$UpdateLog = $UpdateLog .  "-- Adding skill for Race: $characterRace and Class: $characterClass:" . $skillsInfo['name'] . "\n";
						$skillsInfo = mysql_fetch_array($result_world_content_skills);
						
						$newxml = $newxml . autoIndentXML(4, "") . "<void method=\"put\">\n";
						$newxml = $newxml . autoIndentXML(5, "") . "<int>" . $skillsInfo['id'] . "</int>\n";
						$newxml = $newxml . autoIndentXML(5, "") . "<object class=\"atavism.agis.objects.SkillData\">\n";
						$newxml = $newxml . createXMLParts("void", "property", "parentSkill", "int", $skillsInfo['parentSkill'], "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillID", "int", $skillsInfo['id'], "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillMaxLevel", "int", SKILLMAXSTARTLVL, "", "", "", "", "", 5);
						$newxml = $newxml . createXMLParts("void", "property", "skillName", "int", $skillsInfo['name'], "", "", "", "", "", 5);
						$newxml = $newxml . autoIndentXML(5, "") . "</object>\n";
						$newxml = $newxml . autoIndentXML(4, "") . "</void>\n";
					
					}
					
					//echo $newxml;
					// Ok now lets add the missing tags to this new xml
					$finalXML = "";
					$finalXML =	$finalXML .	 autoIndentXML(2, "") . "<void id=\"SkillInfo0\" property=\"currentSkillInfo\"\n>";
   					$finalXML =	$finalXML .	 autoIndentXML(3, "") . "<void property=\"skills\">\n";
					$finalXML =	$finalXML .	$newxml;
					$finalXML =	$finalXML .	 autoIndentXML(3, "") . "</void>";
					$finalXML =	$finalXML .	 autoIndentXML(2, "") . "</void>";
					
					$finalXML = simplexml_load_string($finalXML);
					
				
					$xml = replacePartofXML("void", "id", "SkillInfo0", $xml, $finalXML);
					
					//$xml = replacePartofXML("void", "id", "currentSkillInfo", $xml, $finalXML);
					
					$query_atavism_objstore_tables_combat_info  = "UPDATE objstore SET data='" . $xml->asXML() . "' WHERE type='CombatInfo' AND obj_id='$admin_account_characterID'";
							
					if (mysql_query($query_atavism_objstore_tables_combat_info, $conndb_atavism)) {
						// Add succes log
						$UpdateLog = $UpdateLog .  "Character $admin_account_characterName have been updated\n";
					} else {
						// Add error log
						$UpdateLog = $UpdateLog .  "Character $admin_account_characterName have NOT been updated\n";
					}
				
				}
			}
		}
	}
	$msc = microtime(true)-$msc;
	
	date_default_timezone_get();
	
	$UpdateLog = $UpdateLog . "Log Characters Update: " . date("m/d/Y h:i:s a", time()) . "\n";
	$FileName = "./logs/Characters_" . date("m-d-Y-h_i_s_a", time()) . ".log";
	
	createFileLog($FileName, $UpdateLog);
	
		echo "Characters in the objstore have been updated in $msc seconds for $loopnumber characters, check the log <a href=\"$FileName\" target=\"_blank\">here</a><br>";
		$UpdateLog = $UpdateLog . "Characters in the objstore have been updated in $msc seconds for $loopnumber characters\n";
		echo "Update succesfull<br><br>";
		$UpdateLog = $UpdateLog . "Update succesfull"; 


	createFileLog($FileName, $UpdateLog);

	// Update backdating Table with current timestamp
	$query_atavism_backdating_tables_update  = "UPDATE backdating_tables SET LastUpdate=now() WHERE DBName='admin' AND TableName='account_characters'";
	$result_backdating_tables_updates = mysql_query($query_atavism_backdating_tables_update, $conndb_atavism);
 
	if($result_backdating_tables_updates){
	}else{
		echo "Error updating record: " . $conndb_atavism->error;
	}
		
}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>