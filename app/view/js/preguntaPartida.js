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

function showModalCorrecta(Es_correcta) {
    if(Es_correcta == 1)
    var modal = document.getElementById("modalCorrecta");
    modal.style.display = "block"; // Mostrar el modal

    // Redirigir después de 3 segundos
    setTimeout(function() {
        window.location.href = "/ruleta"; // Aquí va la URL de la ruleta
    }, 3000); // Redirige después de 3 segundos
}

function showModalPerdiste(Es_correcta) {
    if(Es_correcta == 0)
        var modal = document.getElementById("modalPerdiste");
    modal.style.display = "block"; // Mostrar el modal

    // Redirigir a home cuando el modal sea cerrado
    setTimeout(function() {
        window.location.href = "/home"; // Aquí va la URL del home
    }, 3000); // Redirige después de 3 segundos
}


