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
    <style>
        body { font-family: Arial, sans-serif; line-height: 1.5; }
        h1 { color: #333; }
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 8px; text-align: left; }
    </style>
</head>
<body>
    <h1>Reporte de Usuarios</h1>
    <p>Este es un ejemplo de generación de PDF con PHP y DOMPDF.</p>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>Juan Pérez</td>
                <td>juan@example.com</td>
            </tr>
            <tr>
                <td>2</td>
                <td>María López</td>
                <td>maria@example.com</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
';

// Cargar el contenido HTML en DOMPDF
$dompdf->loadHtml($html);

// (Opcional) Configurar tamaño de papel y orientación
$dompdf->setPaper('A4', 'portrait'); // 'portrait' o 'landscape'

// Renderizar el PDF
$dompdf->render();

// Enviar el PDF al navegador
$dompdf->stream('reporte.pdf', ['Attachment' => 0]); // 'Attachment' => 0 para visualizar en el navegador
