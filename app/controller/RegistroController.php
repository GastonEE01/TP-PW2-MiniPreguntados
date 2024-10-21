<?php

class RegistroController
{
    private $presenter;
    private $registroModel;

    public function __construct($presenter, $registroModel)
    {
        $this->presenter = $presenter;
        $this->registroModel = $registroModel;
    }

    public function inicio()
    {
        // Renderizar la vista del inicio
        echo $this->presenter->render('registro');
    }

    public function register($data)
    {
        $this->registroModel->createUser($data);
        echo $this->presenter->render('home');
    }
}
