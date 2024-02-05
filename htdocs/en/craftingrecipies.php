<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
//Put stuff here
	include_once 'config.inc.php';
	include_once 'conndb_atavism.inc.php';

	// Lets search for all Crafting elements
	$query_atavism_item_templates_tables  = "SELECT * FROM item_templates WHERE isactive='1'";
	$result_item_templates_tables = mysql_query($query_atavism_item_templates_tables, $conndb_world_content);

	echo "<div class=\"left\">";
		echo "<div id=\"CraftingElements\">";
		while($row_atavism_item_templates_tables = mysql_fetch_array($result_item_templates_tables, MYSQL_ASSOC))
			{
				echo "<div class=\"imgWrap\">";
				echo "<span id=\"" . $row_atavism_item_templates_tables ['id'] . "\"><img src=\"" . $row_atavism_item_templates_tables ['icon'] .  "\" style=\"width:32px;height:32px;\" alt=\"" . $row_atavism_item_templates_tables ['name'] . "\">";
				echo "<p class=\"imgDescription\">" . $row_atavism_item_templates_tables ['name'] . "</p>";
				//echo $row_atavism_item_templates_tables ['name'] . "</span>";	
				echo "</span>";
				echo "</div>";
			}
		echo "</div>";
	echo "</div>";
	
	echo "<div class=\"left\">";
	echo "<div id=\"box1\"></div>";
	echo "</div>";
	
	echo "<form id=\"frm\" style=\"float:left; margin:10px;\">";
	echo "</form>";
	
	echo js_link("./js/dragdrop.js"); 

}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>