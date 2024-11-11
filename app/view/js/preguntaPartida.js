function mostrarFondo(categoria) {
    var colorFondo;
    console.log('Categoria:', categoria); // Verificar el valor de la categoría

    if (categoria == 'Arte') {
        colorFondo = '#ff9800';
    } else if (categoria == 'Cine') {
        colorFondo = '#9c27b0';
    } else if (categoria == 'Deportes') {
        colorFondo = '#f44336';
    } else if (categoria == 'Historia') {
        colorFondo = '#ffeb3b';
    } else if (categoria == 'Ciencia') {
        colorFondo = '#4caf50';
    } else if (categoria == 'Geografía') {
        colorFondo = '#2196f3';
    }
    // Asignar el color al fondo del body
    document.body.style.backgroundColor = colorFondo;
}


function mostrarModal(Es_correcta) {
    console.log(Es_correcta);
    if (Es_correcta == 1) {
        document.getElementById("modalCorrecta").style.display = "block";
        setTimeout(function() {
            window.location.href = "/partida";
        }, 3000);
    } else if (Es_correcta == null) {
        document.getElementById("modalPerdiste").style.display = "block";
        setTimeout(function() {
            window.location.href = "/home";
        }, 3000);
    }

}

// temporalizador
let countdownElement = document.getElementById('countdown');
let progressBar = document.getElementById('progressBar');
let totalTime = 10; // Tiempo total en segundos
let timeLeft = totalTime;
let modal = document.getElementById('timeOverModal');
let closeModal = document.getElementById('closeModal');

// Función para actualizar el contador y la barra de progreso
let countdownInterval = setInterval(() => {
    timeLeft--;
    countdownElement.textContent = timeLeft;

    // Calcular el ancho de la barra de progreso
    let progressPercentage = ((totalTime - timeLeft) / totalTime) * 100;
    progressBar.style.width = progressPercentage + '%';

    if (timeLeft <= 0) {
        clearInterval(countdownInterval); // Detener el temporizador

        // Reproducir el sonido
        //let alertSound = document.getElementById('alertSound');
     //   alertSound.play();

        // Mostrar el modal
      //  modal.style.display = "flex";

        // Esperar a que se cierre el modal para redirigir
      //  closeModal.onclick = function() {
      //      modal.style.display = "none"; // Cerrar el modal
      //      window.location.href = 'home.html'; // Asegúrate de que esta ruta sea correcta
     //   };

        // También cerrar el modal al hacer clic fuera del contenido
     //   window.onclick = function(event) {
       //     if (event.target == modal) {
        //         modal.style.display = "none"; // Cerrar el modal
         //        window.location.href = 'home.html'; // Asegúrate de que esta ruta sea correcta
          //  }
      //  };
    }
}, 1000); // Actualizar cada segundo

let enviarRespuesta=document.getElementById("enviarRespuesta")

   enviarRespuesta.addEventListener("click",()=>{
        let valorDelContador=countdownElement.textContent
       document.getElementById("tiempo").setAttribute("value", valorDelContador);




        alert(valorDelContador)

    })
