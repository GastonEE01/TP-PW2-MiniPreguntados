<?php

class HomeController
{

    private $presenter;


    public function __construct($presenter )
    {
        $this->presenter = $presenter;

    }

    public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';

        echo $this->presenter->render('home', [
            'nombre_usuario' => $username
        ]);
    }



}