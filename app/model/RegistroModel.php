<?php

class RegistroModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

  /*  public function createUser($data)
    {
        $this->database->execute("INSERT INTO usuario (nombre,nombre_usuario, contrasenia,fecha_nacimiento,pais,sexo,ciudad,email) VALUES ('$data[nombre]', '$data[nombre_usuario]', '$data[contrasenia]', '$data[fecha_nacimiento]', '$data[pais]', '$data[sexo]', '$data[ciudad]', '$data[email]')");
    }*/

    // modificacion del metodo
   /* public function createUser($data)
    {
        $sql = "INSERT INTO usuario (nombre, nombre_usuario, contrasenia, fecha_nacimiento, pais, sexo, ciudad, email, token)
                VALUES (:nombre, :nombre_usuario, :contrasenia, :fecha_nacimiento, :pais, :sexo, :ciudad, :email, :token)";

        $params = [
            ':nombre' => $data['nombre'],
            ':nombre_usuario' => $data['nombre_usuario'],
            ':contrasenia' => $data['contrasenia'],
            ':fecha_nacimiento' => $data['fecha_nacimiento'],
            ':pais' => $data['pais'],
            ':sexo' => $data['sexo'],
            ':ciudad' => $data['ciudad'],
            ':email' => $data['email'],
            ':token' => $token, // Agregamos el token aquí

        ];

        return $this->database->execute($sql, $params);
    }*/

  /*  public function createUser($data, $token)
    {
        $sql = "INSERT INTO usuario (nombre, nombre_usuario, contrasenia, fecha_nacimiento, pais, sexo, ciudad, email, token)
            VALUES (:nombre, :nombre_usuario, :contrasenia, :fecha_nacimiento, :pais, :sexo, :ciudad, :email, :token)";

        $params = [
            ':nombre' => $data['nombre'],
            ':nombre_usuario' => $data['nombre_usuario'],
            ':contrasenia' => $data['contrasenia'],
            ':fecha_nacimiento' => $data['fecha_nacimiento'],
            ':pais' => $data['pais'],
            ':sexo' => $data['sexo'],
            ':ciudad' => $data['ciudad'],
            ':email' => $data['email'],
            ':token' => $token, // Agregamos el token aquí
        ];

        return $this->database->execute($sql, $params);
    }
*/

    public function createUser($data, $token)
    {
        $sql = "INSERT INTO usuario (nombre, nombre_usuario, contrasenia, fecha_nacimiento, pais, sexo, ciudad, email, token)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Los parámetros deben estar en el mismo orden que en la consulta
        $params = [
            $data['nombre'],
            $data['nombre_usuario'],
            $data['contrasenia'],
            $data['fecha_nacimiento'],
            $data['pais'],
            $data['sexo'],
            $data['ciudad'],
            $data['email'],
            $token // Aquí también pasamos el token
        ];

        return $this->database->execute($sql, $params);
    }

    public function validarToken($userId, $token)
    {

        // Aquí haces la consulta a la base de datos para verificar el token
        $sql = "SELECT * FROM usuarios WHERE id = ? AND token = ?";
        $stmt = $this->database->getConnection()->prepare($sql);
        $stmt->bind_param("is", $userId, $token);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->num_rows > 0; // Devuelve verdadero si hay una coincidencia
    }

    public function activarUsuario($userId)
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->iniciarSesion($userId);
        if($usuario) {
            // Actualizar la cuenta del usuario para activarla
            $sql = "UPDATE usuario SET activo = 1 WHERE id = ?";
            $stmt = $this->database->getConnection()->prepare($sql);
            $stmt->bind_param("i", $userId);
            $stmt->execute();
        }
    }
}
