<?php

class PreguntasPartidaController
{

    private $presenter;
    private $preguntaPartidaModel;

    public function __construct($presenter,$preguntaPartidaModel)
    {
        $this->presenter = $presenter;
        $this->preguntaPartidaModel=$preguntaPartidaModel;

    }

    public function inicio()
    {
        // Renderiza la vista correcta
        echo $this->presenter->render('preguntasPartida');
    }

    public function mostrarPregunta(){
        $fecha=isset($_GET['fecha'])?$_GET['fecha']:null;
        $categoria=isset($_GET['categoria'])?$_GET['categoria']:null;
        $pregunta=$this->preguntaPartidaModel->buscarPregunta($categoria);
        $opcion =$this->preguntaPartidaModel->traerRespuestasDePregunta($pregunta['ID']);
        $data=[
            'pregunta'=>$pregunta['Pregunta'],
            'id_pregunta'=>$pregunta['ID'],
           'opcion1'=>$opcion[0]['Texto_respuesta'],
            'opcion2'=>$opcion[1]['Texto_respuesta'],
           'opcion3'=>$opcion[2]['Texto_respuesta'],
           'opcion4'=>$opcion[3]['Texto_respuesta'],
            'fecha'=>$fecha
        ];
        echo $this->presenter->render('preguntasPartida',$data);

    }
}