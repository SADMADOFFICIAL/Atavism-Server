<?php
if(isset($_SESSION['login_user']) && $_SESSION['admin_level'] > 4){
//Put stuff here
}else if(isset($_SESSION['login_user'])){
	echo "You do not have enought rights to use this function";
}else{
	header("location: index.php"); // Redirecting To Other Page
}
?>