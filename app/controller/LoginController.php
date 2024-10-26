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
        $nombre_usuario = $data['nombre_usuario'] ?? null;
        $contrasenia = $data['contrasenia'] ?? null;

        $user = $this->loginModel->loginUser($nombre_usuario, $contrasenia);

        if ($user) {
            $sesion = new ManejoSesiones();
            $sesion->iniciarSesion($user);
            header("Location: index.php?page=home");
        } else {
            echo $this->presenter->render("login", [
                'error' => 'Nombre de usuario o contraseña incorrectos'
            ]);
        }
    }

}
