<?php
require '../vendor/autoload.php'; // Asegúrate de incluir el autoload de Composer

use Dompdf\Dompdf;
use Dompdf\Options;

// Configuración de DOMPDF
$options = new Options();
$options->set('isHtml5ParserEnabled', true);
$options->set('isRemoteEnabled', true); // Permite cargar imágenes remotas (URLs)
$dompdf = new Dompdf($options);

// Contenido HTML del PDF
$html = '
<!DOCTYPE html>
<html>
<head>
    <title>Ejemplo PDF</title>
   
</head>
<body>
    <img src="http://localhost/tp-pw2-MiniPreguntados/app/chart.png" alt="Gráfico de Estadísticas">
</body>
</html>
';

// Cargar el contenido HTML en DOMPDF
$dompdf->loadHtml($html);

// (Opcional) Configurar tamaño de papel y orientación
//$dompdf->setPaper('A4', 'portrait'); // 'portrait' o 'landscape'

// Renderizar el PDF
$dompdf->render();

// Enviar el PDF al navegador
$dompdf->stream('reporte.pdf', ['Attachment' => 0]); // 'Attachment' => 0 para visualizar en el navegador
