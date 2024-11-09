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


