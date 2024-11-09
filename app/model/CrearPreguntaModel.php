<?php

class CrearPreguntaModel
{
    private $database;

    public function __construct($database)
    {
        $this->database = $database;
    }

    public function crearSugerenciaPregunta($data, $id_usuario)
    {
        // Ajustamos la consulta SQL. Eliminamos 'ID' si es una columna autoincremental.
        $sql = "INSERT INTO Sugerencia (pregunta, opcionA, opcionB, opcionC, opcionD, opcionCorrecta, categoria, Usuario_id) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Ajustamos los parámetros para coincidir con la consulta
        $params = [
            $data['Pregunta'],
            $data['OpcionA'],
            $data['OpcionB'],
            $data['OpcionC'],
            $data['OpcionD'],
            $data['OpcionCorrecta'],
            $data['Categoria'],
            $id_usuario
        ];

        // Ejecutamos la consulta
        $this->database->execute($sql, $params);
    }

    public function obtenerPreguntasSugeridas($id_user)
    {
        $sql = "SELECT * FROM sugerencia WHERE Usuario_id=? ";
        try {

            $result = $this->database->execute($sql, [$id_user]);
            return $result;
        } catch (PDOException $e) {
            error_log("Error al obtener preguntas sugeridas: " . $e->getMessage());
            // Maneja el error adecuadamente
        }

    }

    public function eliminarPregunta($id){
        $sql = "DELETE FROM sugerencia WHERE ID = ?";
        $this->database->execute($sql, [$id]);
    }

    public function agregarPregunta($pregunta, $opcionA, $opcionB, $opcionC, $opcionD, $opcionCorrecta, $categoria)
    {
        // Obtener id de categoria
        $idCategoria = $this->obtenerCategoria($categoria); // Llama a obtenerCategoria usando $this

        // agregar pregunta
        $sqlPregunta = "INSERT INTO pregunta (Pregunta, Dificultad, Categoria_id) VALUES (?, ?, ?)";
        $dificultad = 1; // Nivel de dificultad predeterminado
        $this->database->execute($sqlPregunta, [$pregunta, $dificultad, $idCategoria]);

        // Obtener el ID de la última pregunta insertada
        $sqlLastInsertId = "SELECT ID FROM pregunta ORDER BY ID DESC LIMIT 1";
        $result = $this->database->query($sqlLastInsertId);

        if (count($result) > 0) {
            $preguntaId = $result[0]['ID'];
        } else {
            throw new Exception("No se pudo obtener el ID de la última pregunta.");
        }

        // Insertar las respuestas (opciones) en la base de datos
        $this->insertarRespuesta($opcionA, 0, $preguntaId);
        $this->insertarRespuesta($opcionB, 0, $preguntaId);
        $this->insertarRespuesta($opcionC, 0, $preguntaId);
        $this->insertarRespuesta($opcionD, 0, $preguntaId);
        $this->insertarRespuesta($opcionCorrecta, 1, $preguntaId); // Opción correcta
    }
    // Función para insertar las respuestas
    private function insertarRespuesta($respuesta, $esCorrecta, $preguntaId)
    {
        $sqlRespuesta = "INSERT INTO respuesta (Texto_respuesta, Es_correcta, Pregunta_id, id_partida) VALUES (?, ?, ?, ?)";
        $this->database->execute($sqlRespuesta, [$respuesta, $esCorrecta, $preguntaId, null]);
    }

    public function obtenerCategoria($categoria)
    {
        $id = 0;
        switch ($categoria) {
            case 'Arte':
                $id = 1;
                break;
            case 'Cine':
                $id = 2;
                break;
            case 'Deportes':
                $id = 3;
                break;
            case 'Historia':
                $id = 4;
                break;
            case 'Ciencia':
                $id = 5;
                break;
            case 'Geografía':
                $id = 6;
                break;
            default:
                break;
        }
        return $id;
    }



}
