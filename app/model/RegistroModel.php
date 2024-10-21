<?php

class RegistroModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function createUser($data)
    {
        $this->database->execute("INSERT INTO usuario (nombre,nombre_usuario, contrasenia,fecha_nacimiento,pais,sexo,ciudad,email) VALUES ('$data[nombre]', '$data[nombre_usuario]', '$data[contrasenia]', '$data[fecha_nacimiento]', '$data[pais]', '$data[sexo]', '$data[ciudad]', '$data[email]')");
    }
}
