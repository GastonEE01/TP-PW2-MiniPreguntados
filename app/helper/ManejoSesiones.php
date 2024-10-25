<?php

class ManejoSesiones
{

    public function startSession()
    {
        if (session_status() == PHP_SESSION_NONE) {
            session_start();
        }
    }

    public function setUser($user)
    {
        $_SESSION['user'] = $user;
    }

    public function getUser()
    {
        return isset($_SESSION['user']) ? $_SESSION['user'] : null;
    }

    public function logout()
    {
        session_unset();
        session_destroy();
    }

    public function iniciarSesion($usuario) {
        session_start(); // Asegúrate de iniciar la sesión
        $_SESSION['usuario'] = $usuario;
    }

    public function cerrarSesion() {
        session_destroy();
    }

    public function obtenerUsuario() {
        session_start(); // Asegúrate de iniciar la sesión
        return isset($_SESSION['usuario']) ? $_SESSION['usuario'] : null;
    }

    public function usuarioAutenticado() {
        return isset($_SESSION['usuario']);
    }
}