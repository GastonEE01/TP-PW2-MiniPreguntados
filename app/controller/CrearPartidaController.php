<?php

class CrearPartidaController
{

    private $presenter;
    private $crearPartidaModel;
    public function __construct($presenter,$crearPartidaModel)
    {
        $this->presenter = $presenter;
        $this->crearPartidaModel = $crearPartidaModel;

    }

    public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $id_usuario = $sesion->obtenerUsuarioID();  // Obtener el ID de usuario
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $id = $usuario['id'] ?? 'Invitado';

        echo $this->presenter->render('crearPartida',[
            'nombre_usuario' => $username,
            'id' => $id,


        ]);
    }

    public function obtenerDatosDePartida() {
        $sesion = new ManejoSesiones();
        $id_usuario = $sesion->obtenerUsuarioID();
        $descripcion = $_POST['descripcion'];
        echo ($id_usuario);
        if(!$id_usuario){
            header("Location: index.php?page=login");
            exit();
        }
        else{
            $descripcion = $_POST['descripcion'];
            $this->crearPartidaModel->crearPartida($descripcion, $id_usuario);
            header("Location: index.php?page=home");
            exit();

        }

    }
    public function guardarPartida(){
        $sesion=New ManejoSesiones();
        $user = $sesion->obtenerUsuario();
        $descripcion=isset($_POST['descripcion'])?$_POST['descripcion']:null;
        $result=$this->crearPartidaModel->crearPartida($descripcion,$user['id']);
        $partida=$this->crearPartidaModel->buscarPorID($result['user_id']);
        $cantRegistros=count($partida);
        $cantRegistros-=1;

        $partidas=$this->crearPartidaModel->obtenerPartidas($user['id']);
        echo $this->presenter->render('home', ['partidas'=>$partidas,
            'nombre_usuario'=>$user['nombre_usuario'],
            'id_partida'=> $partida[$cantRegistros]['ID']
        ]);

    }



    public function jugarPartida(){
    $id_partida=isset($_GET['id_partida'])?$_GET['id_partida']:null;

    $categoria=$this->crearPartidaModel-> obtenerCategoriaAlAzar();
        echo $this->presenter->render("partida", [
            'categoria'=>$categoria[0]['categoria'],
            'id_partida'=> $id_partida
        ]);

    }



}