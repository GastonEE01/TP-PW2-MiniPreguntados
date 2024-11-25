<?php

class AdminModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function traerPreguntasCorrectas(){
        $sql = "SELECT * FROM Pregunta ";

        $result= $this->database->execute($sql, []);

        $correctas=0;
        $incorrectas=0;
        foreach ($result as $respuestas){
        $respuestasCorrectas=$respuestas['acertada'];
        $respuestasIncorrectas=$respuestas['mostrada']-$respuestas['acertada'];

        $correctas+=$respuestasCorrectas;
        $incorrectas+=$respuestasIncorrectas;
        }
        $sumaDeAmbas=$correctas+$incorrectas;
        $porcentajeCorrectas =round(($correctas / $sumaDeAmbas) * 100, 2) ;
        $porcentajeIncorrectas = round( ($incorrectas / $sumaDeAmbas) * 100,2);

        $correctaseIncorrectas=[$porcentajeCorrectas,$porcentajeIncorrectas];
        return $correctaseIncorrectas;
    }
}