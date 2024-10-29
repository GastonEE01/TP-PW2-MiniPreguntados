<?php

class PerfilController
{
    private $presenter;

    public function __construct($presenter)
    {
        $this->presenter = $presenter;
    }

  /*  public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $pais = $usuario['pais'] ?? 'Invitado';
        $ciudad = $usuario['ciudad'] ?? 'Invitado';
        $fotoIMG = $usuario['fotoIMG'] ?? 'Invitado';

        echo $this->presenter->render('perfil', [
            'nombre_usuario' => $username,'pais' => $pais,'ciudad' => $ciudad,'fotoIMG' => $fotoIMG
        ]);
    }*/

    public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $pais = $usuario['pais'] ?? 'Invitado';
        $ciudad = $usuario['ciudad'] ?? 'Invitado';
        $fotoIMG = $usuario['fotoIMG'] ?? 'Invitado';

        echo $this->presenter->render('perfil', [
            'nombre_usuario' => $username,
            'pais' => $pais,
            'ciudad' => $ciudad,
            'fotoIMG' => $fotoIMG
        ]);
    }
}

