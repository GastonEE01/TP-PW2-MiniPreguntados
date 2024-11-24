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
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $id_usuario = $sesion->obtenerUsuarioID();
        $id = $usuario['id'] ?? 'Invitado';

        // Valido que el usuario tenga la sesion iniciada, sino lo mando al login
        if($username=='Invitado')
            header("Location: /tp-pw2-MiniPreguntados/app/login");

        echo $this->presenter->render('admin', [
            'nombre_usuario' => $username,
            'id' => $id
        ]);
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