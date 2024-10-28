<?php

class RegistroController
{
    private $presenter;
    private $registroModel;
    private $senderEmailPHPMailer;

    public function __construct($presenter, $registroModel,$senderEmailPHPMailer)
    {
        $this->presenter = $presenter;
        $this->registroModel = $registroModel;
        $this->senderEmailPHPMailer = $senderEmailPHPMailer;

    }

    public function inicio()
    {
        // Renderizar la vista del inicio
        echo $this->presenter->render('registro');
    }

  /*  public function register($data)
    {
        $errors = [];

        // Validar email
        if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL) || strpos($data['email'], '@gmail.com') === false) {
            $errors[] = 'El email debe ser un Gmail válido.';
        }

        // Validar contraseña
        if (strlen($data['contrasenia']) < 5 || !preg_match('/[A-Za-z]/', $data['contrasenia']) || !preg_match('/[0-9]/', $data['contrasenia'])) {
            $errors[] = 'La contraseña debe tener al menos 5 caracteres, incluyendo al menos 1 letra y 1 número.';
        }

        // Verificar que la contraseña y la repetición coincidan
        if ($data['contrasenia'] !== $data['repeatPassword']) {
            $errors[] = 'Las contraseñas no coinciden.';
        }

        // mostrar los errores,si es que hay
        if (!empty($errors)) {
            echo $this->presenter->render('registro', ['errors' => $errors]);
            return;
        }

        //En el tp dice de hascodear la contraseña como lo hicimos con la pokedex
        //El tema es que para loguearte hay que ver en la tabla usuario y obtener el codigo por que no se por que no puedo usar la contraseña que creas
        $data['contrasenia'] = password_hash($data['contrasenia'], PASSWORD_DEFAULT);
        $userID =  $this->registroModel->createUser($data);

        if($userID){
            // Generar token y enviar email de activación
            $token = bin2hex(random_bytes(16));
            $validarToken =  $this->registroModel->validarToken($userID,$token);
            if($validarToken) {
                $this->registroModel->activarUsuario($userID);
                $this->senderEmailPHPMailer->sendActivationEmail($userID, $data['email'], $token);
                // sendActivationEmail($userId, $data['email'], $token);
                echo "Registro exitoso. Revisa tu correo para activar tu cuenta.";
            }
        } else {
            echo "Error al registrar el usuario.";

        }
        // Enviar correo de activación
        /*  $token = bin2hex(random_bytes(16)); // Generar un token único
          $enlace = "http://localhost/TP-pw2-MiniPreguntados/usuario/validar?id=$userId&token=$token";
          $this->senderEmail->sendActivationEmail($userId, $data['email'], $enlace);//ahora
  */
        // $this->senderEmail->sendActivationEmail($userId, $data['email'], $token); antes
/*
        echo $this->presenter->render('login', ['success' => 'Revisa tu correo para activar tu cuenta.']);
        //echo $this->presenter->render('login');
    }*/

    public function register($data)
    {
        $errors = [];

        // Validar email
        if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL) || strpos($data['email'], '@gmail.com') === false) {
            $errors[] = 'El email debe ser un Gmail válido.';
        }

        // Validar contraseña
        if (strlen($data['contrasenia']) < 5 || !preg_match('/[A-Za-z]/', $data['contrasenia']) || !preg_match('/[0-9]/', $data['contrasenia'])) {
            $errors[] = 'La contraseña debe tener al menos 5 caracteres, incluyendo al menos 1 letra y 1 número.';
        }

        // Verificar que la contraseña y la repetición coincidan
        if ($data['contrasenia'] !== $data['repeatPassword']) {
            $errors[] = 'Las contraseñas no coinciden.';
        }

        // mostrar los errores,si es que hay
        if (!empty($errors)) {
            echo $this->presenter->render('registro', ['errors' => $errors]);
            return;
        }

        // Hashear la contraseña
        $data['contrasenia'] = password_hash($data['contrasenia'], PASSWORD_DEFAULT);

        // Generar un token antes de crear el usuario
        $token = bin2hex(random_bytes(16));
        $userID =  $this->registroModel->createUser($data, $token); // Pasar el token aquí

        if ($userID) {
            // Aquí ya no necesitas validar el token porque el usuario se creó
            // Activar el usuario (si es necesario, según tu lógica)
            $this->registroModel->activarUsuario($userID); // O maneja la activación según sea necesario
            $this->senderEmailPHPMailer->sendActivationEmail($userID, $data['email'], $token);
            echo "Registro exitoso. Revisa tu correo para activar tu cuenta.";
        } else {
            echo "Error al registrar el usuario.";
        }

        echo $this->presenter->render('login', ['success' => 'Revisa tu correo para activar tu cuenta.']);
    }

}
