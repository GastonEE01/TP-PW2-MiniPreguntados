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
    public function createUser($data)
    {
        $sql = "INSERT INTO usuario (nombre, nombre_usuario, contrasenia, fecha_nacimiento, pais, sexo, ciudad, email)
                VALUES (:nombre, :nombre_usuario, :contrasenia, :fecha_nacimiento, :pais, :sexo, :ciudad, :email)";

        $params = [
            ':nombre' => $data['nombre'],
            ':nombre_usuario' => $data['nombre_usuario'],
            ':contrasenia' => $data['contrasenia'],
            ':fecha_nacimiento' => $data['fecha_nacimiento'],
            ':pais' => $data['pais'],
            ':sexo' => $data['sexo'],
            ':ciudad' => $data['ciudad'],
            ':email' => $data['email']
        ];

        return $this->database->execute($sql, $params);
    }
}
