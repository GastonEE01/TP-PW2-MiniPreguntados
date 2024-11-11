<?php

class PreguntasPartidaController
{

    private $presenter;
    private $preguntaPartidaModel;
    private $usuarioModel;
    public function __construct($presenter,$preguntaPartidaModel,$usuarioModel )
    {
        $this->presenter = $presenter;
        $this->preguntaPartidaModel=$preguntaPartidaModel;
        $this->usuarioModel=$usuarioModel;
    }

    public function inicio()
    {
        // Renderiza la vista correcta
        echo $this->presenter->render('preguntasPartida');
    }


    public function mostrarPregunta(){
        $id_partida=isset($_GET['id_partida'])?$_GET['id_partida']:null;
       // print_r($id_partida);
        $sesion=New ManejoSesiones();
        $user = $sesion->obtenerUsuario();
        $username = $user['nombre_usuario'] ?? 'Invitado';

      //  $respuesta = isset($_POST['answer'])?$_POST['answer']:null;

        $categoria=isset($_GET['categoria'])?$_GET['categoria']:null;
        $nivelUsuario=$this->usuarioModel->verificarNivelDeUsuario($user['id']);
        $pregunta=$this->preguntaPartidaModel->buscarPregunta($categoria,$nivelUsuario);
        $opcion =$this->preguntaPartidaModel->traerRespuestasDePregunta($pregunta['ID']);


        $data=[
            'pregunta'=>$pregunta['Pregunta'],
            'id_pregunta'=>$pregunta['ID'],
           'opcion1'=>$opcion[0]['Texto_respuesta'],
            'opcion2'=>$opcion[1]['Texto_respuesta'],
           'opcion3'=>$opcion[2]['Texto_respuesta'],
           'opcion4'=>$opcion[3]['Texto_respuesta'],
            'id_partida'=>$id_partida,
            'categoria' => $categoria,
          //  'Es_correcta' =>  $respuesVerificada,
            'nombre_usuario' => $username

        ];

        echo $this->presenter->render('preguntasPartida',$data);
     //  print_r($respuesVerificada);
      //  print_r(1);

    }
}