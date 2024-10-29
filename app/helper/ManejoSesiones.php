<?php

class ManejoSesiones
{

    public function __construct()
    {
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }
    }

  /*  public function iniciarSesion($usuario)
    {
        $_SESSION['usuario'] = $usuario;
    }*/
    public function iniciarSesion($usuario)
    {
        $_SESSION['usuario'] = [
            'id' => $usuario['id'],
            'nombre_usuario' => $usuario['nombre_usuario'],
            'pais' => $usuario['pais'],
            'ciudad' => $usuario['ciudad'],
            'fotoIMG' => $usuario['fotoIMG']
        ];
        // Agrega un código para depurar
        error_log(print_r($_SESSION['usuario'], true)); // Esto registrará la información en el log
    }

    public function obtenerUsuario()
    {
        return $_SESSION['usuario'] ?? null;
    }

    public function obtenerUsuarioID()
    {
        $id = $_SESSION['usuario']['id'] ?? null;
        error_log("ID de usuario obtenido: " . print_r($id, true));
        return $id;
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
