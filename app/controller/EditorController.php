<?php

class EditorController
{

    private $presenter;
    private $crearPreguntaModel;

    public function __construct($presenter, $crearPreguntaModel)
    {
        $this->presenter = $presenter;
        $this->crearPreguntaModel = $crearPreguntaModel;

    }

    public function inicio()
    {
        $sesion = new ManejoSesiones();
        $usuario = $sesion->obtenerUsuario();
        $id_usuario = $sesion->obtenerUsuarioID();
        $id = $usuario['id'] ?? 'Invitado';
        $username = $usuario['nombre_usuario'] ?? 'Invitado';
        $pais = $usuario['pais'] ?? 'Invitado';
        $ciudad = $usuario['ciudad'] ?? 'Invitado';
        $fotoIMG = $usuario['fotoIMG'] ?? 'Invitado';
        $pregutasSugeridas = $this->crearPreguntaModel->obtenerPreguntasSugeridas($id);
        echo $this->presenter->render('editor', [
            'nombre_usuario' => $username,
            'pais' => $pais,
            'ciudad' => $ciudad,
            'fotoIMG' => $fotoIMG,
            'preguntasSugeridas' => $pregutasSugeridas,
            'id' => $id
        ]);
    }

    public function eliminarPregunta()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ID'])) {
            $id = $_POST['ID'];
            print_r($id);

            $this->crearPreguntaModel->eliminarPregunta($id);
        }
        header('Location: index.php?page=editor');
        exit();
    }

    public function agregarPregunta($params)
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ID'])) {
            $id = $_POST['ID'];

            // Asegúrate de que los parámetros necesarios estén presentes
            if (isset($params['Pregunta'], $params['OpcionA'], $params['OpcionB'], $params['OpcionC'], $params['OpcionD'], $params['OpcionCorrecta'], $params['Categoria'])) {
                try {
                    $this->crearPreguntaModel->agregarPregunta(
                        $params['Pregunta'],
                        $params['OpcionA'],
                        $params['OpcionB'],
                        $params['OpcionC'],
                        $params['OpcionD'],
                        $params['OpcionCorrecta'],
                        $params['Categoria']
                    );

                    $this->crearPreguntaModel->eliminarPregunta($id);

                    header('Location: index.php?page=editor');
                    exit();
                } catch (Exception $e) {
                    echo "Error al agregar la pregunta: " . $e->getMessage();
                }
            } else {
                echo "Faltan parámetros para agregar la pregunta.";
            }
        } else {
            echo "No se proporcionó un ID para eliminar.";
        }
    }
    public function modificarPregunta($data) {
        // Extraer los datos
        $id = $data['ID'];
        $pregunta = $data['Pregunta'];
        $opcionA = $data['OpcionA'];
        $opcionB = $data['OpcionB'];
        $opcionC = $data['OpcionC'];
        $opcionD = $data['OpcionD'];
        $opcionCorrecta = $data['OpcionCorrecta'];
        $categoria = $data['Categoria'];
        $idUsuario = $data['Usuario_id'];

        $resultado = $this->crearPreguntaModel->modificarPreguntaSugerida($id, $pregunta, $opcionA, $opcionB, $opcionC, $opcionD, $opcionCorrecta, $categoria,$idUsuario);

        if ($resultado['affected_rows'] > 0) {
            echo "Pregunta actualizada exitosamente.";
        } else {
            echo "Advertencia: No se actualizó ninguna fila. Verifica que el ID existe y los datos han cambiado.";
        }
    }



}



