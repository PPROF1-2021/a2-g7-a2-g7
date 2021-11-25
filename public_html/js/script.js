

  function validarfor(){

    var correo = document.getElementById("mail").value; 
  
    var expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    
    
    if ( !expr.test(correo) ){                                                            //COMPRUEBA MAIL
        alert("Error: La dirección de correo " + correo + " es incorrecta.");
        return false;
    }
    
    
    
    }
    function validar(){
      var validado = true;
      elementos = document.getElementsByClassName("inputFormu");
      for(i=0;i<elementos.length;i++){
        if(elementos[i].value == "" || elementos[i].value == null){
        validado = false
        }
      }
      if(validado){
      document.getElementById("boton").disabled = false;
      
      }else{
         document.getElementById("boton").disabled = true;
      //Salta un alert cada vez que escribes y hay un campo vacio
      //alert("Hay campos vacios")   
      }
    }
    var campo1 = document.getElementById("campo1");
    if(campo1.length == 0){
        alert("campo requerido");
        campo1.focus();
        return;
    }
  function pVolver() {
    location.replace("login-copia2.html");
  }
  function paginaRedirect(){
    var delay = 4000; // tiempo in milliseconds
   
    // Display message
    document.getElementById("mensaje").innerHTML = "Espere, en breve será redirigido a la pagina de inicio.";
    
    setTimeout(function(){
     window.location = "index.html";
    },delay);
    
   }