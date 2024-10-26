<?php

class LoginModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function loginUser($nombre_usuario, $contrasenia) {
        $sql = "SELECT * FROM usuario WHERE nombre_usuario = ? AND contrasenia = ?"; // Usamos la clase MysqlObjectDatabase, que ya tiene la conexión manejada
        $stmt = $this->database->getConnection()->prepare($sql); // Accedemos a la conexion

        if ($stmt === false) {
            die('Error en la preparación de la consulta: ' . $this->database->getConnection()->error);
        }

        $stmt->bind_param("ss", $nombre_usuario, $contrasenia);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            return $result->fetch_assoc();
        } else {
            return null;
        }

        $stmt->close();
    }

}
