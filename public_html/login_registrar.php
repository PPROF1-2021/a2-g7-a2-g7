
<?php
@session_start();

include './datosDb.php';

$correo= $_POST["correo"];
 $pass = $_POST["pass"];


 $validar_login = mysqli_query($con,"SELECT * FROM usuarios WHERE email='$correo' and clave2='$pass'");
 if(mysqli_num_rums($validar_login) > 0){
     $_SESSION['usuarios']= $correo;
    header("bienvenido.php");
exit;
 }else{
     echo '<script> 
     alert("El usuario no existe"
     )</SCRIPT>';
     exit;
 }
 ?>