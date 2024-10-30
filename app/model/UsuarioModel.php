<?php

class UsuarioModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

 /*   public function validate($user, $pass)
    {
        $sql = "SELECT 1 
                FROM usuario 
                WHERE username = '" . $user. "' 
                AND password = '" . $pass . "'";

        $usuario = $this->database->query($sql);

        return sizeof($usuario) == 1;
    }*/

    public function validate($username, $password)
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->iniciarSesion($username);
        if($usuario){
            $sql = "SELECT * FROM usuario WHERE nombre_usuario = ?";
            $stmt = $this->database->getConnection()->prepare($sql);
            $stmt->bind_param("s", $username);
            $stmt->execute();
            $result = $stmt->get_result();
        }
        if ($result->num_rows === 0) {
            return false; // Usuario no existe
        }
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['contrasenia']) && $user['activo']) {
            return $user; // Usuario autenticado y activo
        }
        return false; // Credenciales incorrectas o usuario inactivo
    }

    public function activateUser($userId)
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        if ($usuario) {
            // Actualizar la cuenta del usuario para activarla
            $sql = "UPDATE usuario SET activo = 1 WHERE id = ?";
            $stmt = $this->database->getConnection()->prepare($sql);
            $stmt->bind_param("i", $userId);
            return $stmt->execute(); // Verifica si la ejecución es exitosa
        }
    }

}