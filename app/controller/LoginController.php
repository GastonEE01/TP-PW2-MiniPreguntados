<?php

class LoginController
{
    private $presenter;
    private $loginModel;

    public function __construct($presenter, $loginModel)
    {
        $this->presenter = $presenter;
        $this->loginModel = $loginModel;
    }

    public function inicio()
    {
        echo $this->presenter->render('login');
    }

    public function login($data)
    {
        $user = $this->loginModel->loginUser($data);

        if (count($user) == 0) {
            echo $this->presenter->render('login');
        } else {
            echo $this->presenter->render('home');
        }
    }
}
