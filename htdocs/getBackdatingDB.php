<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
include_once 'config.inc.php';
include_once 'conndb_atavism.inc.php';

$query_atavism_backdating_tables  = "SELECT * FROM backdating_tables";
$result_backdating_tables = mysql_query($query_atavism_backdating_tables, $conndb_atavism);

while($row_atavism_backdating_tables = mysql_fetch_array($result_backdating_tables, MYSQL_ASSOC))
{
	
	$type_of_backdating = $row_atavism_backdating_tables['oid_manager_Type'];
	$table_displayname = $row_atavism_backdating_tables['DisplayName'];
	$table_updatetime = $row_atavism_backdating_tables['LastUpdate'];
	$table_name = $row_atavism_backdating_tables['TableName'];
	
    echo "ObjectID Manager Type: $type_of_backdating <br>" .
		 "Table Name: $table_displayname <br>" .
		 "Table DB Name: $table_name <br>" .
         "Last Update: $table_updatetime <br>";
		 $query_atavism_backdating_type  = "SELECT * FROM objstore WHERE type='$type_of_backdating'";
		 $result_backdating_type = mysql_query($query_atavism_backdating_type, $conndb_atavism);
		 $type_rows_count = mysql_num_rows($result_backdating_type);
		 //Since some type return more tanh one row, we need to make some small changes to the output
		 switch($type_of_backdating)
			 {
				case "ITEM":
			 		echo "Type $type_of_backdating Count: $type_rows_count <br>";
				break;
				case "PLAYER":
			 		echo "Type $type_of_backdating Count:  " . ($type_rows_count / 2) . "<br>";
				break;
			 }
		 
		 
		 
		 
		 $query_atavism_backdating_template  = "SELECT * FROM $table_name WHERE updatetimestamp > '$table_updatetime'";
		 $result_backdating_template = mysql_query($query_atavism_backdating_template, $conndb_world_content);
		 
		 if($result_backdating_template != "")
		 {
			 $type_rows_count_template = mysql_num_rows($result_backdating_template);
			 echo "$table_name has $type_rows_count_template items to be updated<br>";
		 }
		 
		 if($type_rows_count > 0){
			 switch($type_of_backdating)
			 {
				case "ITEM":
			 		echo "<a href=\"index.php?middle=UpdateItems&table_name=$table_name&update_time=$table_updatetime&type_of_backdating=$type_of_backdating\">Update</a><br><br>";
				break;
				case "PLAYER":
			 		echo "<a href=\"index.php?middle=UpdateCharacters&table_name=$table_name&update_time=$table_updatetime&type_of_backdating=$type_of_backdating\">Update</a><br><br>";
				break;
			 }
		 }
			 
} 

}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>