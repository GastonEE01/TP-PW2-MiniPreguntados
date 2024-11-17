<?php

class AdminController
{

    private $presenter;

    public function __construct($presenter)
    {
        $this->presenter = $presenter;
    }

    public function inicio()
    {
        echo $this->presenter->render('admin');
    }


    public function obtenerEstadisticasPreguntas() {
        // Datos ficticios que podrían venir de una consulta a la base de datos
        $estadisticas = [
            'Pendiente' => 15,
            'Aprobada' => 20,
            'Rechazada' => 5,
            'Reportada' => 7,
            'Desactivada' => 3
        ];
        header('Content-Type: application/json');
        echo json_encode($estadisticas);
    }
}