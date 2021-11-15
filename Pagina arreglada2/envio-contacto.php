<!DOCTYPE html>
<html lang = "es">
<head>
    <meta charset= "utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardadr datos del cliente</title>
    
</head>

<body>
    <P> <a href=" index.html>"> Regresar </a> </p>
    <input type ="button" value="volver" onclick="pvolver();"> <br>
    <input type="button" value="submit" id= "submit" onclick="paginaRedirect();"> <br>
    <!--message-->
    <div id="mensaje"> </div>
    
    <?php
      $nombre = $_POST["nombre"];
      $email = $_POST["telefono"];
      $usuario2 = $_POST["E-mail"];
      $contraseña = $_POST["contraseña"];

      print " <p>su nombre es <strong> $nombre <strong>. </p>\n";
      print"\n";
      print " <p>su nombre es <strong> $email<strong>. </p>\n";
      print"\n";
      print " <p>su nombre es <strong> $usuario2<strong>. </p>\n";
      print"\n";
      print " <p>su nombre es <strong> $contraseña <strong>. </p>\n";
      print"\n";

      //incluimos los datos de conexion y funciones//
      include( "datosDB.PHP");
      $con= mysqli_connect($host,$usuario,$clave,$basededatos)or die("no se ha podido conectar al servidor");
      if (!$con){
          die("conexion fallida: ". mysqli_connect_error()); 
      }
      $db = mysqli_select_db($con, $basededatos) or die ( "Upps! no se ha podido conectar a la base de datos" );
$consulta = "INSERT INTO usuarios (nombre,email,usuario,clave) VALUES ('$nombre', '$email', '$usuario2', '$contraseña')";

// Usamos esas variables:
if (mysqli_query ($con, $consulta)){
    echo "<h3>Registro agregado.</h3>";
    } else {
    echo "<h3>No se agregó nuevo registro</h3>";
    echo "Error: " . $consulta . "<br>" . mysqli_error($con);
 }
 mysqli_close($con);


?>



<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="js/script.js"></script>  
</body>

</html>