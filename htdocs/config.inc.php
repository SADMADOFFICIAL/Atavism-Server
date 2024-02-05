<?php 
/* DB Connection Informations */
$dbhost = "localhost";
$dbuser = "[USERNAME]"; //Enter your MySQL Username
$dbpass = "[PASSWORD]"; //Enter your MySQL Password

$dbname_atavism = 'atavism';
$dbname_world_content = 'world_content';
$dbname_admin = 'admin';
$dbname_master = 'master';

/* Contant for Atavism CMS Software */
define("EFFECTSCOL", "12"); // How many effects can exist for an item -- This value should never be changed unless Atavism changes the way it handles more effects
define("ITEMTOBEDELETED", false); // Should the backdating delete destroyed item from in the game
define("REPLACEALLOBJSTORE", true); // In cae something goes wrong and you want to rebuild all the ITEMS in your DB
define("SKILLMAXSTARTLVL", "5"); // Starting skill max point
define("ITEMSDBMAXSHOWPERPAGE", "10"); // Haw many items should be shown per page for the items
define("CRONFILENAME", "SERVERCOMMAND.txt"); //Will put what the conr job needs to do in there	-- Will always go into the CronJobs DIrectory
define("SERVERBINPATH", "/home/atavism/atavism_server_v2018/bin/"); // This is the path of your atavism server


?>