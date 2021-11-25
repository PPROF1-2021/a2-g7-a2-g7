<?php

include 'hora.html';
$timepkr = $_POST["timepkr"];
$btn_primary=$_POST["btn_primary"];
  //incluimos los datos de conexion y funciones//
  include("./datosDb.php");
  $con= mysqli_connect($host,$usuario,$clave,$basededatos)or die("no se ha podido conectar al servidor");
  if (!$con){
      die("conexion fallida: ". mysqli_connect_error()); 
  }



  $db = mysqli_select_db($con, $basededatos) or die ( "Upps! no se ha podido conectar a la base de datos" );

$CONSULTA "INSERT INTO turnos (horaturno,dia) VALUES ('$timepkr','$btn_primary')";
$ejecutar=mysql_query($conexion,$CONSULTA);

if (mysqli_query ($con, $consulta)){
    echo "<h3>turno registrado.</h3>";
    } else {
    echo "<h3>No se agregó nuevo turno</h3>";
    echo "Error: " . $consulta . "<br>" . mysqli_error($con);
 }
 mysqli_close($con);


?>

