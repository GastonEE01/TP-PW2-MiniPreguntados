<?php

class HomeController
{

    private $presenter;

    public function __construct($presenter)
    {
        $this->presenter = $presenter;
    }

    public function inicio()
    {
        // Renderizar la vista del inicio
        echo $this->presenter->render('home');
    }
}