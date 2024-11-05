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

        echo $this->presenter->render("home", [
            'nombre_usuario'=>$user['nombre_usuario'],
            'descripcion' => $partida[$cantRegistros]['Descripcion'],
            'fecha_creada'=> $partida[$cantRegistros]['Fecha_creada']
        ]);
    }
    public function jugarPartida(){
    $fecha=isset($_GET['fecha'])?$_GET['fecha']:null;
    $categoria=$this->crearPartidaModel-> obtenerCategoriaAlAzar();
        echo $this->presenter->render("partida", [
            'categoria'=>$categoria[0]['categoria'],
            'fecha'=> $fecha
        ]);

    }



}