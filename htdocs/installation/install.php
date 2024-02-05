<!doctype html>
<html>
<head>
<meta charset="utf-8">
 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">

<title>Atavism X.9 Installation & Configuration Script</title>
</head>

<body>
<center>
<div>
<?php

ini_set('max_execution_time', 300);

if (isset($_POST['submit'])) {

	include("../atavismfunctions.inc.php");
	//include("../config.inc.php");
	//include("../conndb_atavism.inc.php");
	if (empty($_POST['username']) || empty($_POST['password'])) {
		$error = "Username or Password is invalid";
	}else{
		$dbuser = $_POST['username']; //Gettting root MySQL Username from POST
		$dbpass = $_POST['password']; //Getting MySQL Password from POST
		$dns = $_POST['dns'];
		$external_dns = $_POST['external_dns'];
	        $email = $_POST['email'];
	        $serverkey = $_POST['serverkey'];
		$installtype = $_POST['installtype'];
		
		if($dns==""){ $dns = $_SERVER['SERVER_NAME'];}
		if($external_dns=="") {$external_dns = $_SERVER['SERVER_NAME'];}
		
		
		echo "Install Type is: $installtype<br>";
	
		if($installtype == "NewInstall"){	
			
			$dbrestore_master = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/Core/master.sql");
			$dbrestore_admin = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/Core/admin.sql");
			$dbrestore_atavism = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/Core/atavism.sql");
			$dbrestore_world_content = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/Core/world_content.sql");
			
		}else if($installtype == "NewInstallData"){	
			
			$dbrestore_master = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/Demo/master.sql");
			$dbrestore_admin = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/Demo/admin.sql");
			$dbrestore_atavism = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/Demo/atavism.sql");
			$dbrestore_world_content = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/Demo/world_content.sql");
			
		}else if($installtype == "UpdateCore"){
			// Backup Master	
			$db_version = readVersion("localhost", $dbuser, $dbpass );
			if($db_version!="10.8.0|Core"){
			    echo "Not valid DB Version ".$db_version." != 10.8.0|Core";
			    die();
			}
//			die();
			
			echo "Start Updating Structure DB<br>";	
			// Do the Update Structure
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/updates/Core/Structure/admin.sql");
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/updates/Core/Structure/atavism.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/updates/Core/Structure/master.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/updates/Core/Structure/world_content.sql");
			echo "End Updating Structure DB<br>";

			// Do the Update Data
			echo "Start Updating Data DB<br>";
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/updates/Core/Data/admin.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/updates/Core/Data/atavism.sql");
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/updates/Core/Data/master.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/updates/Core/Data/world_content.sql");
			echo "End Updating Data DB<br>";
	
		}else if($installtype == "UpdateDemo"){
			
			
			$db_version = readVersion("localhost", $dbuser, $dbpass );
			if($db_version!="10.8.0|Demo"){
			    echo "Not valid DB Version ".$db_version." != 10.8.0|Demo";
			    die();
			}
//			die();
			
			echo "Start Updating Structure DB<br>";
			// Do the Update Structure
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/updates/Demo/Structure/admin.sql");
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/updates/Demo/Structure/atavism.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/updates/Demo/Structure/master.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/updates/Demo/Structure/world_content.sql");
			echo "End Updating Structure DB<br>";
			
			// Do the Update Data
			echo "Start Updating Data DB<br>";
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"admin","./sql/updates/Demo/Data/admin.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"atavism","./sql/updates/Demo/Data/atavism.sql");
//			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"master","./sql/updates/Demo/Data/master.sql");
			$dbupdate = restoreMySQLTableSpecialTrigger("localhost",$dbuser,$dbpass,"world_content","./sql/updates/Demo/Data/world_content.sql");
			echo "End Updating Data DB<br>";
	}

		//Do it either NewInstall or Update
		echo `sudo cp -rpf ./configfiles/auth.properties.org ./configfiles/auth.properties`;
		echo `sudo cp -rpf ./configfiles/world.properties.org ./configfiles/world.properties`;
	
		replace_in_file("./configfiles/auth.properties", "[USERNAME]", $dbuser);
		replace_in_file("./configfiles/auth.properties", "[PASSWORD]", $dbpass);
		replace_in_file("./configfiles/auth.properties", "[DNSNAME]", $dns);
		replace_in_file("./configfiles/world.properties", "[EXTERNALDNSNAME]", $external_dns);
		replace_in_file("./configfiles/world.properties", "[USERNAME]", $dbuser);
		replace_in_file("./configfiles/world.properties", "[PASSWORD]", $dbpass);
		replace_in_file("./configfiles/world.properties", "[DNSNAME]", $dns);
		replace_in_file("./configfiles/world.properties", "[EMAIL]", $email);
		replace_in_file("./configfiles/world.properties", "[SERVERKEY]", $serverkey);

		replace_in_file("../config.inc.php", "[USERNAME]", $dbuser);
		replace_in_file("../config.inc.php", "[PASSWORD]", $dbpass);
		replace_in_file("../connection.inc.php", "[USERNAME]", $dbuser);
		replace_in_file("../connection.inc.php", "[PASSWORD]", $dbpass);
		echo `sudo cp -rf ./configfiles/auth.properties ../../bin/auth.properties`;
		echo `sudo cp -rf ./configfiles/world.properties ../../bin/world.properties`;
		echo `sudo dos2unix ../../bin/auth.properties ../../bin/world.properties`;
		
		 
		echo "<br><br><h2>If you do not see any errors, everything has been done correctly.</h2>";
	}

}else{ ?>
</div></center>
<?php
include "../top_menu.php";
?>
    <div id="main" align="center">
    <h1>Atavism Automated Installation & Configuration System - Development Only !!!</h1>
	<h3 class="text-danger">If you updating current Atavism installation you must take full DB backup!!!</h3>
    <br>This will reinstall the default Database or Update to the latest Atavism <br>
    Note: You can find your Atavism Server Key in the <a href="http://apanel.atavismonline.com" target="_blank">Atavism Account Management Website</a>.
	<br>

	
    <div id="login">

	<div class="container">
  <h2>Atavism X.9 Server Configuration Form</h2>
  <form class="form-horizontal" action="" method="post">
    <div class="form-group">
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" placeholder="Enter Atavism Account E-mail" name="email">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-6">
        <input type="text" class="form-control" id="serverkey" placeholder="Enter Atavism Server Key" name="serverkey">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-6">
        <input type="text" class="form-control" id="name" placeholder="Enter DB Username" name="username">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-6">          
        <input type="password" class="form-control" id="password" placeholder="Enter DB Password" name="password">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-6">
        <input type="text" class="form-control" id="dns" placeholder="Enter IP/FQDN of this server (Current Server IP is: <?php echo $_SERVER['SERVER_NAME'];?>) " name="dns" >
      </div>
     </div>
    <div class="form-group">
      <div class="col-sm-6">
        <input type="text" class="form-control" id="dns" placeholder="Enter IP/FQDN for External Public connections to this server" name="external_dns" >
      </div>
     </div>

	<div class="radio">
		<label><input type="radio" id="installtype" name="installtype" value="NewInstall" > New Install without Demo Data (Core)</label>
	</div>
	<div class="radio">
		<label><input type="radio" id="installtype" name="installtype" value="NewInstallData" checked> New Install with Demo Data</label>
	</div>
    <div class="radio">
		<label><input type="radio" id="installtype" name="installtype" value="UpdateCore" > Update Current Atavism without Demo Data (Core) from 10.8.0</label>
	</div> 
		<div class="radio">
		<label><input type="radio" id="installtype" name="installtype" value="UpdateDemo"> Update Current Atavism with Demo data from 10.8.0</label>
	</div> 
	

</br>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" name="submit" class="btn btn-info">Submit</button>
      </div>
    </div>
  </form>
</div>

    <span><?php if(isset($error))echo $error; ?></span>
    </form>
    </div>
    </div>
	<?php
}
?>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>
</body>
</html>
