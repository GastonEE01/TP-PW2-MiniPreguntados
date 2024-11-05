<?php

class PartidaController
{
    private $presenter;
    private $preguntasPartidaModel;
    private $crearPartidaModel;
    public function __construct($presenter,$preguntasPartidaModel,$crearPartidaModel)
    {
        $this->presenter = $presenter;
        $this->preguntasPartidaModel=$preguntasPartidaModel;
        $this->crearPartidaModel=$crearPartidaModel;
    }

    public function inicio()
    {
        // Renderiza la vista correcta
        echo $this->presenter->render('partida');
    }
    public function validarRespuesta()
    {
        $id=isset($_POST['id_partida'])?$_POST['id_partida']:null;
        $id_partida=intval($id);
        $respuesta = isset($_POST['answer'])?$_POST['answer']:null;
        $sesion=New ManejoSesiones();
        $user = $sesion->obtenerUsuario();
        $respuesVerificada= $this->preguntasPartidaModel->verificarRespuesta($respuesta, $user['id'],$id_partida);
        if ($respuesVerificada != null ){
            $categoria=$this->crearPartidaModel-> obtenerCategoriaAlAzar();
            echo $this->presenter->render("partida", [
                'categoria'=>$categoria[0]['categoria'],
                'id_partida'=> $id_partida
            ]);

        }else{
          echo $this->presenter->render("home",[]);
        }
        print_r($id_partida);
     //   echo $this->presenter->render('home');

    }

}