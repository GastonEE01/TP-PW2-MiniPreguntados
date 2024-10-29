<?php

class HomeController
{

    private $presenter;


    public function __construct($presenter )
    {
        $this->presenter = $presenter;

    }

  /*  public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';

        echo $this->presenter->render('home', [
            'nombre_usuario' => $username
        ]);
    }*/

    public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $id_usuario = $sesion->obtenerUsuarioID();
        $id = $usuario['id'] ?? 'Invitado';
        echo $this->presenter->render('home', [
            'nombre_usuario' => $username,
            'id' => $id
        ]);
    }


}