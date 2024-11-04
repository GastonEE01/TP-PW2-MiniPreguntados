<?php

class PartidaController
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
        echo $this->presenter->render('partida');
    }
    public function validarRespuesta()
    {
        print_r("asdasdasd");
     //   echo $this->presenter->render('home');

    }
}