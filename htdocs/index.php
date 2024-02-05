<?php
include('login.php'); // Includes Login Script
include_once("atavismfunctions.inc.php");
?>
<!doctype html>
<html>
<head>
<link href="CSS/Menu.css" rel="stylesheet" type="text/css" />
<link href="CSS/MainBody.css" rel="stylesheet" type="text/css" />
<link href="CSS/DragDrop.css" rel="stylesheet" type="text/css" />
<meta charset="utf-8">
<title>Atavism Server Tools</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/jquery-ui.js"></script>
<?php //echo js_link("./js/dragdrop.js"); echo "\n"; ?>
<style =type="text/css">
body{
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;	
}
</style>
</head>

<body bgcolor="c2e3fb">

<?php
include_once("config.inc.php");
//include_once("./conndb_atavism.inc.php");
if(isset($_GET["middle"])){
	$middle = $_GET["middle"];
}else{
	$middle = "home";
}
?>


<div align="center" TOP:35px id="Top">
</div>
<div align="center">
<?php
    if(isset($_SESSION['login_user'])){
		echo "Welcome " . $_SESSION['login_user'] . " your account level is " . $_SESSION['admin_level'] . " <b id=\"logout\"><a href=\"logout.php\">[Log Out]</a> </b>";
	}
  ?>
</div>   
<div align="center" id="MenuHolder">
	<nav> 
 		<?php 
		if(isset($_SESSION['login_user'])){
			include("menu.php");
        }
	 	?> 
	</nav>      
 </div>
<br>
<div align="center" id="Middle">

	<?php 
		include("middle.php"); 	
	?>
</div>
<br>
<div align="center" id="Footer">
			<?php include("footer.php"); ?>
</div>
</body>
</html>