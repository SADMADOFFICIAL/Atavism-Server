<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){

	include_once 'config.inc.php';
	include_once 'conndb_atavism.inc.php';
	
	if(isset($_GET["itemID"])){
		$itemID = $_GET["itemID"];
	}else{
		$itemID = "";
	}
	
	if(isset($_GET["action"])){
		$action = $_GET["action"];
	}else{
		$action = "";
	}
	
	if(isset($_GET["page"])){
		$page = $_GET["page"];
	}else{
		$page = "1";
	}
	
	
	$screenMessage = "";
	$ShowList = true;
	$sqlDoSearch = false;
	
	switch($action)
	{
		case "Edit":
			$ShowList = false; //hide the list
			
			//refill the value from the DB
			$query_atavism_templateID  = "SELECT * FROM item_templates WHERE id=$itemID";
			$result_templateID = mysql_query($query_atavism_templateID, $conndb_world_content);

			if(!$result_templateID){ // check if the TemplateID exist - If not it has been deleted	
				$screenMessage = "Coould not find item#$itemID";
			}else{
				$row_atavism_templateID = mysql_fetch_array($result_templateID, MYSQL_ASSOC);
					$templateID_id = $row_atavism_templateID['id'];
					$templateID_name = $row_atavism_templateID['name'];	//echo $templateID_name;
					$templateID_icon = $row_atavism_templateID['icon'];
					$templateID_category = $row_atavism_templateID['category'];
					$templateID_subCategory = $row_atavism_templateID['subcategory'];
					$templateID_itemType = $row_atavism_templateID['itemType'];
					$templateID_subType = $row_atavism_templateID['subType'];
					$templateID_slot = $row_atavism_templateID['slot'];
					$templateID_display = $row_atavism_templateID['display'];
					$templateID_itemQuality = $row_atavism_templateID['itemQuality'];
					$templateID_binding = $row_atavism_templateID['binding'];
					$templateID_isUnique = $row_atavism_templateID['isUnique'];
					$templateID_stackLimit = $row_atavism_templateID['stackLimit'];
					$templateID_duration = $row_atavism_templateID['duration'];
					$templateID_purchaseCurrency = $row_atavism_templateID['purchaseCurrency'];
					$templateID_purchaseCost = $row_atavism_templateID['purchaseCost'];
					$templateID_sellable = $row_atavism_templateID['sellable'];
					$templateID_levelReq = $row_atavism_templateID['levelReq'];
					$templateID_aspectReq = $row_atavism_templateID['aspectReq'];
					$templateID_raceReq = $row_atavism_templateID['raceReq'];
					$templateID_damage = $row_atavism_templateID['damage'];
					$templateID_damageType = $row_atavism_templateID['damageType'];
					$templateID_delay = $row_atavism_templateID['delay'];
					$templateID_toolTip = $row_atavism_templateID['toolTip'];
					$templateID_triggerEvent = $row_atavism_templateID['triggerEvent'];
					$templateID_triggerAction1Type = $row_atavism_templateID['triggerAction1Type'];
					$templateID_triggerAction1Data = $row_atavism_templateID['triggerAction1Data'];
					
					for($effectNumber = 1; $effectNumber <= EFFECTSCOL; $effectNumber++){
							${"templateID_effect" . $effectNumber . "type"} = $row_atavism_templateID['effect' . $effectNumber . 'type'];
							${"templateID_effect" . $effectNumber . "name"} = $row_atavism_templateID['effect' . $effectNumber . 'name'];
							${"templateID_effect" . $effectNumber . "value"} = $row_atavism_templateID['effect' . $effectNumber . 'value'];
					}
				}
			
			//Check if changes submitted via POST
			if ($_SERVER['REQUEST_METHOD'] == 'POST')
			{
				if(isset($_POST['name']))
				{
					$templateID_name = $_POST['name'];	
				}
				if(isset($_POST['itemType']))
				{
					$templateID_itemType = $_POST['itemType'];	
				}
				if(isset($_POST['itemSubType']))
				{
					$templateID_itemSubType = $_POST['itemSubType'];	
				}
				if(isset($_POST['itemQuality']))
				{
					$templateID_itemQuality = $_POST['itemQuality'];	
				}
				if(isset($_POST['binding']))
				{
					$templateID_binding = $_POST['binding'];	
				}
				if(isset($_POST['isUnique']))
				{
					$templateID_isUnique = $_POST['isUnique'];	
				}
				if(isset($_POST['stackLimit']))
				{
					$templateID_stackLimit = $_POST['stackLimit'];	
				}
				if(isset($_POST['duration']))
				{
					$templateID_duration = $_POST['duration'];	
				}
				if(isset($_POST['purchaseCurrency']))
				{
					$templateID_purchaseCurrency = $_POST['purchaseCurrency'];	
				}
				if(isset($_POST['purchaseCost']))
				{
					$templateID_purchaseCost = $_POST['purchaseCost'];	
				}
				if(isset($_POST['sellable']))
				{
					$templateID_sellable = $_POST['sellable'];	
				}
				if(isset($_POST['levelReq']))
				{
					$templateID_levelReq = $_POST['levelReq'];	
				}
				if(isset($_POST['aspectReq']))
				{
					$templateID_aspectReq = $_POST['aspectReq'];	
				}
				if(isset($_POST['raceReq']))
				{
					$templateID_raceReq = $_POST['raceReq'];	
				}
				if(isset($_POST['damage']))
				{
					$templateID_damage = $_POST['damage'];	
				}
				if(isset($_POST['damageType']))
				{
					$templateID_damageType = $_POST['damageType'];	
				}
				if(isset($_POST['delay']))
				{
					$templateID_delay = $_POST['delay'];	
				}
				if(isset($_POST['toolTip']))
				{
					$templateID_toolTip = $_POST['toolTip'];
				}
				
				//Lets update the Item
				$query_atavism_templateID  = "UPDATE item_templates SET name='$templateID_name', itemType='$templateID_itemType', subType='$templateID_subType', itemQuality='$templateID_itemQuality',
				binding='$templateID_binding', isUnique='$templateID_isUnique', stackLimit='$templateID_stackLimit', duration='$templateID_duration',
				purchaseCurrency='$templateID_purchaseCurrency', purchaseCost='$templateID_purchaseCost', sellable='$templateID_sellable', levelReq='$templateID_levelReq',
				aspectReq='$templateID_aspectReq', raceReq='$templateID_raceReq', damage='$templateID_damage', damageType='$templateID_damageType', delay='$templateID_delay',
				toolTip='$templateID_name' WHERE id=$itemID";
				$result_templateID = mysql_query($query_atavism_templateID, $conndb_world_content);
				
				if($result_templateID)
				{	
					$screenMessage = "Item has been updated";
				}else{
					$screenMessage = "Item HAS NOT been updated";
				}
				
			}				
			
			
			// Show the item with his current informations
			echo "<bold>Editing item#$itemID</bold>";
			echo "<form method=\"post\" action=\"index.php?middle=DBItems&itemID=$itemID&action=Edit\">";
			echo "<table width=\"900\" border=\"1\">";
			echo "<tbody>";
				echo "<tr>";
					echo "<td width=\"100\">Name:</td>";
					echo "<td><input type=\"text\" name=\"name\" value=\"$templateID_name\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Type:</td>";
					echo "<td><input type=\"text\" name=\"itemType\" value=\"$templateID_itemType\" readonly size=\"50\">The type Cannot be change</td>";
				echo "</tr>";
				//Hiding Subtype for item other than Weapon and Armor
				if($templateID_itemType == "Weapon" || $templateID_itemType == "Armor")
				{
					echo "<tr>";
						echo "<td width=\"100\">Sub Type:</td>";
						echo "<td><input type=\"text\" name=\"subType\" value=\"$templateID_subType\" readonly size=\"50\">Will be updatble in the future</td>";
					echo "</tr>";
				}else{
					echo "<tr>";
						echo "<td width=\"100\">Sub Type:</td>";
						echo "<td><input type=\"text\" name=\"subType\" value=\"\" readonly size=\"50\">Will be updatble in the future</td>";
					echo "</tr>";
				}
				
				echo "<tr>";
					echo "<td width=\"100\">Quality:</td>";
					echo "<td><input type=\"text\" name=\"itemQuality\" value=\"$templateID_itemQuality\" size=\"50\">Only change if you know what you doing INT</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Binding:</td>";
					echo "<td><input type=\"text\" name=\"binding\" value=\"$templateID_binding\" size=\"50\">0=None - 1=OnEqup - 2=OnPickup</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">is Unique:</td>";
					echo "<td><input type=\"text\" name=\"isUnique\" value=\"$templateID_isUnique\" size=\"50\">0=False - 1=True</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Stack Limit:</td>";
					echo "<td><input type=\"text\" name=\"stackLimit\" value=\"$templateID_stackLimit\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Duration:</td>";
					echo "<td><input type=\"text\" name=\"duration\" value=\"$templateID_duration\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Purchase Currency:</td>";
					echo "<td><input type=\"text\" name=\"purchaseCurrency\" value=\"$templateID_purchaseCurrency\" readonly size=\"50\">Will be updatble in the future</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">purchase Cost:</td>";
					echo "<td><input type=\"text\" name=\"purchaseCost\" value=\"$templateID_purchaseCost\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Sellable:</td>";
					echo "<td><input type=\"text\" name=\"sellable\" value=\"$templateID_sellable\" size=\"50\">0=False - 1=True</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Level Required:</td>";
					echo "<td><input type=\"text\" name=\"levelReq\" value=\"$templateID_levelReq\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Class Required:</td>";
					echo "<td><input type=\"text\" name=\"aspectReq\" value=\"$templateID_aspectReq\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Race Required:</td>";
					echo "<td><input type=\"text\" name=\"raceReq\" value=\"$templateID_raceReq\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Damage:</td>";
					echo "<td><input type=\"text\" name=\"damage\" value=\"$templateID_damage\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Damage Type:</td>";
					echo "<td><input type=\"text\" name=\"damageType\" value=\"$templateID_damageType\" readonly size=\"50\">Will be updatble in the future</td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Delay:</td>";
					echo "<td><input type=\"text\" name=\"delay\" value=\"$templateID_delay\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
					echo "<td width=\"100\">Tooltip:</td>";
					echo "<td><input type=\"text\" name=\"toolTip\" value=\"$templateID_toolTip\" size=\"50\"></td>";
				echo "</tr>";
				echo "<tr>";
				echo "<td><input type=\"submit\" name=\"submit\" value=\"Modify\"></td>";
				echo "<td><a href=\"index.php?middle=DBItems\"><input type=\"button\" value=\"Cancel\"/></a></td>";
				echo "</tr>";
			echo "</tbody>";
			echo "</table>";
			echo "</form>";
		break;
		case "Copy":
			//This makes a full copy of an item
			//get the columns
			$cols=array();
			$result = mysql_query("SHOW COLUMNS FROM item_templates", $conndb_world_content); 
			 while ($r=mysql_fetch_assoc($result)) {
			  if (!in_array($r["Field"],array("id"))) {//add other columns here to want to exclude from the insert
			   $cols[]= $r["Field"];
			  } //if
			}//while
			
			//build and do the insert       
			$result = mysql_query("SELECT * FROM item_templates WHERE id=$itemID", $conndb_world_content);
			  while($r=mysql_fetch_array($result)) {
				$insertSQL = "INSERT INTO item_templates (".implode(", ",$cols).") VALUES (";
				$count=count($cols);
				foreach($cols as $counter=>$col) {
				  $insertSQL .= "'".$r[$col]."'";
			  if ($counter<$count-1) {$insertSQL .= ", ";}//dont want a , on the last one
				}//foreach
			  $insertSQL .= ")";
			
			  mysql_query($insertSQL, $conndb_world_content);//execute the query
			  }//while
				$screenMessage = "Did a copy of item#$itemID";
		
		break;
		case "Add":
			$ShowList = false; //hide the list
		
		break;
		case "Delete":
			//This does not permently delete the item from the database but actually set isactive to 0
			$query_atavism_item_templates_tables  = "UPDATE item_templates SET isactive='0' WHERE id=$itemID";
			$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);
			
			if($result_item_templates_tables){
	 			$screenMessage = "Deleted/Archive item#$itemID";
			}else{
				$screenMessage = "Error updating item#$itemID";
	 		}
			
		break;
		case "Search":
			$ShowList = true; //show the list
			if ($_SERVER['REQUEST_METHOD'] == 'POST')
			{
				if(isset($_POST['searchValue']))
				{
					$searchValue = $_POST['searchValue'];
					$sqlDoSearch = true;	
				}else{
					$sqlDoSearch = false;	
				}
				if(isset($_POST['field']))
				{
					$field = $_POST['field'];
				}else{
					$field = "name";
				}
			}
			if(isset($_GET['SearchValue']))
			{
				$searchValue = $_GET['SearchValue'];
				$field = $_GET['Field'];
				$sqlDoSearch = true;	
			}
			
		break;
		
	}
	
	if($ShowList)
	{
		// Here is the search form
		echo "<form method=\"post\" action=\"index.php?middle=DBItems&action=Search\">";
		echo "<input type=\"text\" name=\"searchValue\" value=\"\" size=\"50\">";
		echo "<select name=\"field\">";
		echo "<option value=\"name\">Name</option>";
		echo "<option value=\"itemtype\">Item Type</option>";
		echo "<option value=\"subType\">Sub Type</option>";
		echo "</select>";
		echo "<input type=\"submit\" name=\"submit\" value=\"Search\">";
		echo "</form>";
		echo "<br>";
		//Query everything first to see how much items we have in the DB Unless we have a Like Search
		//echo "SELECT * FROM item_templates WHERE isactive='1' AND $field '%" . $searchValue . "%'";
		if(!$sqlDoSearch)
		{
			$query_atavism_item_templates_tables  = "SELECT * FROM item_templates WHERE isactive='1'";												
			$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);
			$row_count = mysql_num_rows($result_item_templates_tables);	
		}else{
			$query_atavism_item_templates_tables  = "SELECT * FROM item_templates WHERE isactive='1' AND $field LIKE '%" . $searchValue . "%'";												
			$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);
			$row_count = mysql_num_rows($result_item_templates_tables);	
		}
		// Count pages from the ITEMSDBMAXSHOWPERPAGE Constant
		$page_count = 0;
		if (0 === $row_count) {  
			// maybe show some error since there is nothing in your table
		} else {
		   // determine page_count
		   $page_count = (int)ceil($row_count / ITEMSDBMAXSHOWPERPAGE);
		   // double check that request page is in range
		   if($page > $page_count) {
				// error to user, maybe set page to 1
				$page = 1;
		   }
		}
		
		// Calculate the actual offset
		$offset = ($page -1) * ITEMSDBMAXSHOWPERPAGE;

		// Building the item list
		if(!$sqlDoSearch)
		{
			$query_atavism_item_templates_tables  = "SELECT * FROM item_templates WHERE isactive='1' LIMIT " . ITEMSDBMAXSHOWPERPAGE . " OFFSET $offset";
			$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);	
		}else{
			$query_atavism_item_templates_tables  = "SELECT * FROM item_templates WHERE isactive='1' AND $field LIKE '%" . $searchValue . "%' LIMIT " . ITEMSDBMAXSHOWPERPAGE . " OFFSET $offset";
			$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);
		}

		// Adding basic search on name off item

			
		echo "<table width=\"900\" border=\"1\">";
		echo "<tbody>";
		echo "<tr>";
			echo "<td>ID</td>";
			echo "<td>Icon</td>";
			echo "<td>Name</td>";
			echo "<td>Item Type</td>";
			echo "<td>Sub Type</td>";
			echo "<td>Edit</td>";
			echo "<td>Copy</td>";
			echo "<td>Del</td>";
		echo "</tr>";
		
		while($row_atavism_item_templates_tables = mysql_fetch_array($result_item_templates_tables, MYSQL_ASSOC))
		{
	
			echo "<tr>";
			echo "<td>" . $row_atavism_item_templates_tables ['id'] . "</td>";
			echo "<td align=\"center\"><img src=\"" . $row_atavism_item_templates_tables ['icon'] .  "\" style=\"width:32px;height:32px;\"></td>";		
			echo "<td>" . $row_atavism_item_templates_tables ['name'] . "</td>";
			echo "<td>" . $row_atavism_item_templates_tables ['itemType'] . "</td>";
			//Lets hide the subtype for items other than Weapon and Armor
			if($row_atavism_item_templates_tables ['itemType'] == "Weapon" || $row_atavism_item_templates_tables ['itemType'] == "Armor")
			{
				echo "<td>" . $row_atavism_item_templates_tables ['subType'] . "</td>";
			}else{
				echo "<td>&nbsp</td>";
			}
			echo "<td><a href=\"index.php?middle=DBItems&itemID=" . $row_atavism_item_templates_tables ['id'] . "&action=Edit\">Edit</td>";
			echo "<td><a href=\"index.php?middle=DBItems&itemID=" . $row_atavism_item_templates_tables ['id'] . "&action=Copy\">Copy</td>";
			echo "<td><a href=\"index.php?middle=DBItems&itemID=" . $row_atavism_item_templates_tables ['id'] . "&action=Delete\">Del</td>";
			echo "</tr>";
		}
		
		echo "</tbody>";
		echo "</table>";
		echo "<br>";
		for ($i = 1; $i <= $page_count; $i++) {
		   if ($i === $page) { // this is current page
			   echo 'Page ' . $i . '<br>';
		   } else { // show link to other page   
		   		//lets add a reutrn line every 15 pages
				 if(($i % 15) == 0) echo "<br>";
				 if(!$sqlDoSearch){
			   		echo '<a href="/index.php?middle=DBItems&page=' . $i . '">Page ' . $i . '</a> ';
				 }else{
					 echo '<a href="/index.php?middle=DBItems&page=' . $i . '&action=Search&SearchValue=' . $searchValue . '&Field=' . $field . '">Page ' . $i . '</a> ';
				 }
		   }
		}
	}		
		
		
	
	echo "<br><br>$screenMessage<br><br>";
	
}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>