<?php

class UsuarioController
{

    private $model;
    private $presenter;

    public function __construct($model, $presenter)
    {
        $this->model = $model;
        $this->presenter = $presenter;
    }

    public function auth()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $validation = $this->model->validate($user, $pass);

        if ($validation) {
            $_SESSION['user'] = $user;
        }

        header('location: /inicio');
        exit();
    }
    public function mostrarInicio()
    {
        echo $this->presenter->render('inicio'); // Asume que 'inicio' es tu vista Mustache
    }
}