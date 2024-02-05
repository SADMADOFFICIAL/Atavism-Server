<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
	
	include_once("./atavismfunctions.inc.php");
	include_once("./config.inc.php");
	
	$NOHUPSERVERBINPATH = "nohup " . SERVERBINPATH;
	
	//Lets get Data
	if (isset($_GET['action'])) {
    	switch($_GET['action']){
		 //> /dev/null & echo $!
			case "AuthRestart":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "auth.sh -v -C restart &");
				$message = "Request has been sent to restart authentification server, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			case "AuthStop":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "auth.sh -v -C stop &");
				$message = "Request has been sent to stop authentification server, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			case "AuthStatus":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "auth.sh -v -C status &");
				$message = "Request has been sent to get authentification server status, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			case "WorldRestart":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "world.sh -v -C restart &");
				$message = "Request has been sent to restart world server, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			case "WorldStop":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "world.sh -v -C stop &");
				$message = "Request has been sent to stop world server, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			case "WorldStatus":
				createCronJobs(CRONFILENAME, $NOHUPSERVERBINPATH . "world.sh -v -C status &");
				$message = "Request has been sent to get world server status, DO NOT PRESS F5 TO REFRESH PAGE";
			break;
			
		}
	}else{
    	$message = "";
	}

	// Lets check if the server is running by using ports
	$ip = "localhost";
	$authStatus = "";
	$worldStatus = "";
	$authPorts = "5090|9005|9010"; //auth server 5090-9005-9010 
	$worldPorts = "5040|5041|20377";//world server: 5040-5041-20377
	
	$authPortsArray = explode("|", $authPorts);
	$worldPortsArray = explode("|", $worldPorts);
	
	$authPortsTotal = count($authPortsArray);
	$worldPortsTotal = count($worldPortsArray);

	foreach ($authPortsArray as $port){
		$up = fsockopen($ip, $port, $errno, $errstr, 30);  
		
		if(!$up){  
			//echo "$errstr ($errno)<br />\n";
			//echo "Port: $port is down<br>\n";
			$authStatus = $authStatus . false . "|";
		}else{
			//echo "Port: $port is up<br>\n"; 
			$authStatus = $authStatus . true . "|"; 
		}
	}
	
	foreach ($worldPortsArray as $port){
		$up = fsockopen($ip, $port, $errno, $errstr, 30);  
		
		if(!$up){  
			//echo "$errstr ($errno)<br />\n";
			//echo "Port: $port is down<br>\n";
			$worldStatus = $worldStatus . false . "|";
		}else{
			//echo "Port: $port is up<br>\n";  
			$worldStatus = $worldStatus . true . "|";
		}	
	}
	
	$authStatus = rtrim($authStatus, "|");
	$worldStatus = rtrim($worldStatus, "|");
	
	$authStatusExplode = explode ("|", $authStatus);
	$worldStatusExplode = explode ("|", $worldStatus);
	
	if(count(array_filter($authStatusExplode)) == $authPortsTotal){
		echo "Authentification Server Status: All ports are opened and waiting for connections, authentification server is up<br>";
		echo "<bold>Authentification Server Actions</bold><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=AuthRestart\"><input type=\"button\" value=\"Auth Restart\"/></a><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=AuthStop\"><input type=\"button\" value=\"Auth Stop\"/></a><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=AuthStatus\"><input type=\"button\" value=\"Auth Status\"/></a><br>";
		
	}else{
		echo "Authentification Server Status: Some or all ports are not open, authentification server is down<br>";
		echo "<bold>Authentification Server Actions</bold><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=AuthRestart\"><input type=\"button\" value=\"Auth Start\"/></a><br>"; //Lets put a restart even if its only a start
		echo "<a href=\"index.php?middle=ServerTasks&action=AuthStatus\"><input type=\"button\" value=\"Auth Status\"/></a><br>";
	}
	
	if(count(array_filter($worldStatusExplode )) == $worldPortsTotal){
		
		echo "World Server Status: All ports are opened and waiting for connections, world server is up<br>";
		echo "<bold>World Server Actions</bold><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=WorldRestart\"><input type=\"button\" value=\"World Restart\"/></a><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=WorldStop\"><input type=\"button\" value=\"World Stop\"/></a><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=WorldStatus\"><input type=\"button\" value=\"World Status\"/></a><br>";
	}else{
		echo "World Server Status: Some or all ports are not open, world server is down<br>";
		echo "<bold>World Server Actions</bold><br>";
		echo "<a href=\"index.php?middle=ServerTasks&action=WorldRestart\"><input type=\"button\" value=\"World Start\"/></a><br>"; //Lets put a restart even if its only a start
		echo "<a href=\"index.php?middle=ServerTasks&action=WorldStatus\"><input type=\"button\" value=\"World Status\"/></a><br>";
	}
	echo "<br><bv><a href=\"index.php?middle=ServerTasks&action=Refresh\"><input type=\"button\" value=\"Refresh\"/></a><br>";
	echo "<br>" . $message;
	echo "<br> <a href=\"./CronJobs/LastServerQuery.log\" target=\"_blank\">Check the last servver query result</a>";

}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>