<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
	$directory = ".\backups\sql\\";
	$logFiles = glob($directory . "*.sql");
	
	echo "<br><br>Already processed SQL Backup files:<br>";
	
	foreach($logFiles as $logfile)
	{
		echo "<a href=\"$logfile\" target=\"_blank\">" . basename($logfile) . "</a>  --- <a href=restoreMySQLfromBackup.php?filename=$logfile>Restore</a><br>";
	}
}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>