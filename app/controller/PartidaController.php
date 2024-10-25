<?php

class PartidaController
{
    private $presenter;

    public function __construct($presenter)
    {
        $this->presenter = $presenter;
    }

    public function inicio()
    {
        // Renderiza la vista correcta
        echo $this->presenter->render('partida');
    }

}