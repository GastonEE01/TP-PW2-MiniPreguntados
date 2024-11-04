<?php

class PreguntasPartidaModel{
    private $database;
    public function __construct($database)
    {
        $this->database = $database;
    }
    public function buscarPregunta($categoria)
    {
        $sql = "SELECT P.* FROM Pregunta P INNER JOIN Categoria C ON P.Categoria_id = C.ID
                WHERE C.Categoria =? ; ";

        try {

            // $stmt = $this->database->prepare($sql);
            $result=$this->database->execute($sql,[$categoria]);
            $min = 0; // Este debe ser el índice mínimo
            $max = count($result) - 1; // Este debe ser el índice máximo, ajustando según tu arreglo
            $randomIndex = rand($min, $max);
            return $result[$randomIndex];
        } catch (PDOException $e) {
            error_log("Error al crear partida: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }
    public function trerRespuestasDePregunta($id){
        $sql = "SELECT * FROM Respuesta WHERE pregunta_id=? ";

        try {

            // $stmt = $this->database->prepare($sql);
            $result=$this->database->execute($sql,[$id]);
            shuffle($result);
            return $result;
        } catch (PDOException $e) {
            error_log("Error al crear partida: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }
}

















?>