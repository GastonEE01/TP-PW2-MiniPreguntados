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
        $Status_ids = 1;
        $puntaje = 0;

        $sql = "INSERT INTO partida (Status_id,Descripcion,Puntuacion,Puntuacion_porcentaje,Usuario_id,Fecha_creada,Fecha_finalizada) 
            VALUES (?, ?, ?, ?, ? ,? ,?)";

        try {

           // $stmt = $this->database->prepare($sql);
            $result=$this->database->execute($sql,[$Status_ids,$descripcion, $puntaje,0,$id_usuario, $fechaInicio,null]);
            return $descripcion;
        } catch (PDOException $e) {
            error_log("Error al crear partida: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }
    public function obtenerCategoriaAlAzar(){
        $numRandom=rand(1,6);
        $arrayRandom=array();
      array_push($arrayRandom,$numRandom);
        $sql="SELECT categoria From Categoria where id=?";
        $result =$this->database->execute($sql,$arrayRandom);
        return $result;
    }

}