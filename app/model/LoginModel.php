<?php

class LoginModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function loginUser($data)
    {
        $result = $this->database->query("SELECT * FROM usuario WHERE nombre_usuario='$data[nombre_usuario]' && contrasenia='$data[contrasenia]'");
        return $result;
    }
}
