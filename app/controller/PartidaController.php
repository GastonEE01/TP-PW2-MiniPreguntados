<?php

class PartidaController
{
    private $presenter;
    private $preguntasPartidaModel;
    private $crearPartidaModel;
    private $homeModel;

    public function __construct($presenter,$preguntasPartidaModel,$crearPartidaModel,$homeModel)
    {
        $this->presenter = $presenter;
        $this->preguntasPartidaModel=$preguntasPartidaModel;
        $this->crearPartidaModel=$crearPartidaModel;
        $this->homeModel=$homeModel;

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
                'id_partida'=> $id_partida,
                'Es_correcta' =>  $respuesVerificada
            ]);
            print_r('Es_correcta');
            print_r(            $this->preguntasPartidaModel->verificarRespuesta($respuesta, $user['id'],$id_partida)
            );

        }else{
            // Actualziar el ranking despues de jugar una partida
            $sesion=new ManejoSesiones();
            $user=$sesion->obtenerUsuario();
            $partidas=$this->crearPartidaModel->obtenerPartidas($user['id']);
            $mejoresPunutajesJugador=$this->homeModel->trearMejoresPuuntajesJugadores();
            echo $this->presenter->render('home', ['partidas'=>$partidas,
                'puntajes'=>$mejoresPunutajesJugador,
                'nombre_usuario'=>$user['nombre_usuario'],
                'Es_correcta' =>  $respuesVerificada
            ]);
            print_r('Es_correcta');
            print_r(            $this->preguntasPartidaModel->verificarRespuesta($respuesta, $user['id'],$id_partida)
            );
        }
    }

}