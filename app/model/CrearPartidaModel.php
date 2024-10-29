<?php

class CrearPartidaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function crearPartida($descripcion,$id_usuario)
    {
        $fechaInicio = date('Y-m-d H:i:s');
        $estado = 'en curso';
        $puntaje = 0;

        $sql = "INSERT INTO partida (id_usuario, descripcion, fecha_inicio, estado, puntaje) 
            VALUES (?, ?, ?, ?, ?)";

        try {
            $stmt = $this->database->prepare($sql);
            $stmt->execute([$id_usuario, $descripcion, $fechaInicio, $estado, $puntaje]);
        } catch (PDOException $e) {
            error_log("Error al crear partida: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }

}