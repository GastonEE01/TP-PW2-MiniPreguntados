// Grafico

function openPopup(type) {
    const popup = document.getElementById('popup');
    const popupTitle = document.getElementById('popupTitle');
    const popupContent = document.getElementById('popupContent');

    popup.style.display = 'block';

    switch(type) {
        case 'jugadores':
            popupTitle.textContent = '🏆 Top Jugadores';
            popupContent.innerHTML = `
                <ul>
                    <li>1. SuperTrivia2023 - 1500 puntos</li>
                    <li>2. QuizMaster99 - 1450 puntos</li>
                    <li>3. BrainiacGamer - 1400 puntos</li>
                    <li>4. TriviaQueen - 1350 puntos</li>
                    <li>5. KnowledgeNinja - 1300 puntos</li>
                </ul>
            `;
            break;
        case 'preguntas':
            popupTitle.textContent = '❓ Preguntas Populares';
            popupContent.innerHTML = `
                <ul>
                    <li>¿Cuál es la capital de Francia?</li>
                    <li>¿Quién pintó la Mona Lisa?</li>
                    <li>¿En qué año se fundó Google?</li>
                    <li>¿Cuál es el planeta más grande del sistema solar?</li>
                    <li>¿Quién escribió "Cien años de soledad"?</li>
                </ul>
            `;
            break;
        case 'preguntasCreadas':
            popupTitle.textContent = '✍️ Últimas Preguntas Creadas';
            popupContent.innerHTML = `
                <ul>
                    <li>¿Cuál es el animal más rápido del mundo?</li>
                    <li>¿En qué año se estrenó la primera película de Star Wars?</li>
                    <li>¿Cuál es el elemento químico más abundante en el universo?</li>
                    <li>¿Quién inventó la bombilla eléctrica?</li>
                    <li>¿Cuál es la montaña más alta del mundo?</li>
                </ul>
            `;
            break;
        case 'usuariosNuevos':
            popupTitle.textContent = '👋 Nuevos Usuarios';
            popupContent.innerHTML = `
                <ul>
                    <li>TriviaNewbie23</li>
                    <li>QuizEnthusiast</li>
                    <li>LearningLover99</li>
                    <li>CuriousMind2023</li>
                    <li>KnowledgeSeeker42</li>
                </ul>
            `;
            break;
    }
}

function closePopup() {
    const popup = document.getElementById('popup');
    popup.style.display = 'none';
}

// Cerrar el popup si se hace clic fuera de él
window.onclick = function(event) {
    const popup = document.getElementById('popup');
    if (event.target == popup) {
        popup.style.display = 'none';
    }
}

// Chart creation
const ctx = document.getElementById('questionChart').getContext('2d');
new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['Pendiente', 'Aprobada', 'Rechazada', 'Reportada', 'Desactivada'],
        datasets: [{
            label: 'Cantidad de Preguntas',
            data: [12, 19, 3, 5, 2],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: 'Cantidad de Preguntas por Estado'
            }
        }
    }
});