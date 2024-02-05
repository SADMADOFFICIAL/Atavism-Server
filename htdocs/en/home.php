<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
//Put stuff here
}else if(isset($_SESSION['login_user'])){
	echo "This will be the CMS for Atavism. It is under heavy developement!<br><br>";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>