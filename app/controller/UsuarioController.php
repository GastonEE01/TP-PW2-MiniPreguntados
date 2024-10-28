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

   /* public function auth()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $validation = $this->model->validate($user, $pass);

        if ($validation) {
            $_SESSION['user'] = $user;
        }

        header('location: /inicio');
        exit();
    }*/

    public function auth()
    {
        $user = $_POST['username'];
        $pass = $_POST['password'];

        $validation = $this->model->validate($usuario, $pass);

        if ($validation) {

            if (!$validation['activo']) { // Aquí agregas la verificación de si está activo
                header('Location: /TP-pw2-MiniPreguntados/app/index.php?login&error=not_activated');
                exit();
            }

            $_SESSION['user'] = $user;
            header('location: /inicio');
            exit();
        } else {
            header('Location: /TP-pw2-MiniPreguntados/app/index.php?login&error=invalid_credentials');
            exit();
        }
    }


    public function mostrarInicio()
    {
        echo $this->presenter->render('inicio'); // Asume que 'inicio' es tu vista Mustache
    }

   /* public function validar($params)
    {
        $userId = $params['id'] ?? null;
        $token = $params['token'] ?? null;

        // Verificar el usuario y el token en la base de datos
        $usuarioModel = new UsuarioModel($this->database);
        $usuario = $usuarioModel->getUserByIdAndToken($userId, $token);

        if ($usuario && !$usuario['activo']) {
            // Activar al usuario
            $usuarioModel->activateUser($userId);
            // Redirigir al login con mensaje de éxito
            header("Location: /TP-pw2-MiniPreguntados/app/index.php?login&activated=true");
            exit();
        } else {
            // Redirigir al login con mensaje de error
            header("Location: /TP-pw2-MiniPreguntados/app/index.php?login&error=activation_failed");
            exit();
        }
    }*/
    public function validar($params)
    {
        $userId = $params['id'] ?? null;
        $token = $params['token'] ?? null;

        // Verificar el usuario y el token en la base de datos
        $usuarioModel = new UsuarioModel($this->database);
        $usuario = $usuarioModel->getUserByIdAndToken($userId, $token);

        if ($usuario && !$usuario['activo']) {
            // Activar al usuario
            $usuarioModel->activateUser($userId); // Asegúrate de que este método esté funcionando correctamente
            // Redirigir al login con mensaje de éxito
            header("Location: /TP-pw2-MiniPreguntados/app/index.php?login&activated=true");
            exit();
        } else {
            // Redirigir al login con mensaje de error
            header("Location: /TP-pw2-MiniPreguntados/app/index.php?login&error=activation_failed");
            exit();
        }
    }

}