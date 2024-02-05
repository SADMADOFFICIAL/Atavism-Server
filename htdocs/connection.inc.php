<?php
$dbhost = "localhost";
$dbuser = "[USERNAME]";
$dbpass = "[PASSWORD]";

$dbname_atavism = 'atavism';
$dbname_world_content = 'world_content';
$dbname_master = 'master';
$dbname_admin = 'admin';

// Create connection
$conn = new mysqli($dbhost, $dbuser, $dbpass);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
//echo "Connected successfully";
?>