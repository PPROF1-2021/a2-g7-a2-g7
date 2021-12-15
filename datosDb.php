<?php
$host="Localhost";
$usuario="id17753865_marlenb";
$clave="Felizcumple06.";
$basededatos="id17753865_turnero_castracion20";

$cann = new mysqli($host, $usuario, $clave, $basededatos);
mysqli_query($cann, "SET character_set_result=utf8");
if($cann->connect_error){
    die("database error: ". $cann->connect_error);
}
?>