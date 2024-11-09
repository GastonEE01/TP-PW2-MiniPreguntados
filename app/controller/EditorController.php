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
            'preguntasSugeridas' => $pregutasSugeridas

        ]);
    }

    public function eliminarPregunta()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ID'])) {
            // Obtener el ID de la pregunta a eliminar
            $id = $_POST['ID'];
            print_r($id); // Asegúrate de que muestra un valor correcto

            // Llamada al modelo para eliminar la pregunta
            $this->crearPreguntaModel->eliminarPregunta($id);
        }
        // Redirigir al editor después de eliminar la pregunta
        header('Location: index.php?page=editor');
        exit();
    }

    public function agregarPregunta($params)
    {
        // Comprobamos que sea una solicitud POST y que se haya enviado un ID
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ID'])) {
            // Obtener el ID de la pregunta a eliminar
            $id = $_POST['ID'];

            // Asegúrate de que los parámetros necesarios estén presentes
            if (isset($params['Pregunta'], $params['OpcionA'], $params['OpcionB'], $params['OpcionC'], $params['OpcionD'], $params['OpcionCorrecta'], $params['Categoria'])) {
                // Llamar al modelo para agregar la pregunta y sus respuestas
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

                    // Llamar al método para eliminar la pregunta en la tabla sugerencia usando el ID
                    $this->crearPreguntaModel->eliminarPregunta($id);

                    // Redirigir después de agregar y eliminar la pregunta de sugerencia
                    header('Location: index.php?page=editor');
                    exit();
                } catch (Exception $e) {
                    // Manejar error si ocurre
                    echo "Error al agregar la pregunta: " . $e->getMessage();
                }
            } else {
                // Si faltan parámetros, mostrar un mensaje de error
                echo "Faltan parámetros para agregar la pregunta.";
            }
        } else {
            echo "No se proporcionó un ID para eliminar.";
        }
    }

}



