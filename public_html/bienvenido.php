
<?php
sessioon_stat();

if (!isset($_session['usuarios'])){
    echo '
    <script>
    alert
    ("por favor debes iniciar sesion"); 
    </script>';
}
?>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"content="width=device-width, initial-scale=1.0">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/tpicker.css">
  <script type="text/javascript" src="js/tpicker.js"></script>
  <link rel="stylesheet" href="css/styles.scss">

</head>
