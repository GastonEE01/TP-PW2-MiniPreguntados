<?php

class PartidaController
{
    private $presenter;
    private $preguntasPartidaModel;
    public function __construct($presenter,$preguntasPartidaModel)
    {
        $this->presenter = $presenter;
        $this->preguntasPartidaModel=$preguntasPartidaModel;
    }

    public function inicio()
    {
        // Renderiza la vista correcta
        echo $this->presenter->render('partida');
    }
    public function validarRespuesta()
    {
        $fecha=isset($_GET['fecha'])?$_GET['fecha']:null;
        $respuesta = isset($_POST['answer'])?$_POST['answer']:null;
        $sesion=New ManejoSesiones();
        $user = $sesion->obtenerUsuario();
        $respuesVerificada= $this->preguntasPartidaModel->verificarRespuesta($respuesta, $user['id'],$fecha);
        if ($respuesVerificada != null ){

            header('location:index.php?page=crearPartida&action=jugarPartida');

        }else{
          echo $this->presenter->render("home",[]);
        }
        print_r("asdasdasd");
     //   echo $this->presenter->render('home');

    }
}