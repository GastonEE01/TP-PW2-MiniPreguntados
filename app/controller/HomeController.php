<?php

class HomeController
{
    private $presenter;
    private $crearPartidaModel;
    private $homeModel;

    public function __construct($presenter,$homeModel ,$crearPartidaModel)
    {
        $this->presenter = $presenter;
    $this->crearPartidaModel=$crearPartidaModel;
    $this->homeModel=$homeModel;
    }

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
    public function listarPartidas(){
        $sesion=new ManejoSesiones();
        $user=$sesion->obtenerUsuario();
        $partidas=$this->crearPartidaModel->obtenerPartidas($user['id']);
        $mejoresPunutajesJugador=$this->homeModel->trearMejoresPuuntajesJugadores();
        echo $this->presenter->render('home', ['partidas'=>$partidas,
            'puntajes'=>$mejoresPunutajesJugador,
            'nombre_usuario'=>$user['nombre_usuario']
            ]);
    }


}