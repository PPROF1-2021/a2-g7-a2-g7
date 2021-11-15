// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'
  
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
  
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
      .forEach(function (form) {
        form.addEventListener('submit', function (event) {
          if (!form.checkValidity()) {
            event.preventDefault()
            alert('Por favor complete los campos');
            event.stopPropagation()
          }
  
          form.classList.add('was-validated')
        }, false)
      })
  })()

  function pVolver() {
    location.replace("login-copia(2).html");
  }
  function paginaRedirect(){
    var delay = 4000; // tiempo in milliseconds
   
    // Display message
    document.getElementById("mensaje").innerHTML = "Espere, en breve será redirigido a la pagina de inicio.";
    
    setTimeout(function(){
     window.location = "index.html";
    },delay);
    
   }