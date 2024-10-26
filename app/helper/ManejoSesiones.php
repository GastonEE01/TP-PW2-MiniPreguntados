<?php

class ManejoSesiones
{

    public function __construct()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

    public function iniciarSesion($usuario)
    {
        $_SESSION['usuario'] = $usuario;
    }

    public function obtenerUsuario()
    {
        return $_SESSION['usuario'] ?? null;
    }

    public function cerrarSesion()
    {
        session_unset();
        session_destroy();
    }

    public function usuarioAutenticado()
    {
        return isset($_SESSION['usuario']);
    }
}
