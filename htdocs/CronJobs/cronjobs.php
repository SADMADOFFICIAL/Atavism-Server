<?php
define("CRONFILENAME", "SERVERCOMMAND.txt"); //Will put what the conr job needs to do in there	-- Will always go into the CronJobs DIrectory
define("SERVERBINPATH", "/home/atavism/atavism_server_v2018/bin/"); // This is the path of your atavism server
define("WEBLINKTOCRON", "http://localhost/CronJobs/");
define("PATHTOWWW", "/var/www/html/CronJobs/");

$filename = WEBLINKTOCRON . CRONFILENAME;

if (file_get_contents("$filename") != "") { //If the file exist read it and then delete it
	$removeFileLog = exec("rm " . PATHTOWWW . "LastServerQuery.log");
	$file = file_get_contents("$filename");
	$removeFile = exec("rm " . PATHTOWWW . CRONFILENAME);
	$ServerQuery = "Executed Query at: " . date("Y-m-d H:i:s") . "\n";
	$ServerQuery = $ServerQuery . shell_exec("$file");
	file_put_contents(PATHTOWWW . "LastServerQuery.log", $ServerQuery);
}


?>