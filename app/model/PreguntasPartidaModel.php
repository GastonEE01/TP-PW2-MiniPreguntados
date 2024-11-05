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
    public function traerRespuestasDePregunta($id){
        $sql = "SELECT * FROM Respuesta WHERE pregunta_id=? ";

        try {

            // $stmt = $this->database->prepare($sql);
            $result=$this->database->execute($sql,[$id]);
            shuffle($result);
            return $result;
        } catch (PDOException $e) {
            error_log("Error al traer las respuestas: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }
   /** public function VerificarRespuesta($respuesta , $userID,$id_partida)
    {
        $sql = "SELECT * FROM Respuesta 
                WHERE Texto_respuesta= ?";

        try {

            // $stmt = $this->database->prepare($sql);
            $result=$this->database->execute($sql,[$respuesta]);

            if ($result[0]['Es_correcta']){
                $sql="UPDATE Partida SET puntuacion = puntuacion+1 WHERE Usuario_id = ?";
                try {
                    $resultActualizacionPuntaje=$this->database->execute($sql,[$userID]);
                    return $result;
                } catch (PDOException $e) {
                    error_log("Error al actualizar el puntaje en la partida: " . $e->getMessage());
                }
            }

            return null;
        } catch (PDOException $e) {
            error_log("Error al crear partida: " . $e->getMessage());
            // Maneja el error adecuadamente
        }
    }**/

    public function verificarRespuesta($respuesta, $userID, $id_partida)
    {
        $sql = "SELECT * FROM Respuesta 
            WHERE Texto_respuesta = ?";

        try {
            $result = $this->database->execute($sql, [$respuesta]);

            if ($result && $result[0]['Es_correcta']) {
                $sql = "UPDATE Partida SET puntuacion = puntuacion + 1 
                    WHERE Usuario_id = ? AND ID = ?";

                try {
                    $this->database->execute($sql, [$userID, $id_partida]);
                    return $result;
                } catch (PDOException $e) {
                    error_log("Error al actualizar el puntaje en la partida: " . $e->getMessage());
                    return null;
                }
            }

            return null;
        } catch (PDOException $e) {
            error_log("Error al verificar respuesta: " . $e->getMessage());
            return null;
        }
    }

}

















?>