<?php

class LoginController
{
    private $presenter;
    private $loginModel;

    public function __construct($presenter, $loginModel)
    {
        $this->presenter = $presenter;
        $this->loginModel = $loginModel;
    }

    public function inicio()
    {
        echo $this->presenter->render('login');
    }

    public function login($data)
    {
        $nombre_usuario = $data['nombre_usuario'] ?? null;
        $contrasenia = $data['contrasenia'] ?? null;

        $user = $this->loginModel->loginUser($nombre_usuario, $contrasenia);

        if ($user['activo'] == 1) {
            // Si el rol es 2, redirige a la vista del editor
            if ($user['rol'] == 2) {
               // header("Location: index.php?page=editor");
                 header("Location: editor");
                exit;
            }
            // Si el rol es 3, redirige a la vista del administrador
            elseif ($user['rol'] == 3) {
                header("Location: admin");

                exit;
            }else {
                    $sesion = new ManejoSesiones();
                    $sesion->iniciarSesion($user);

                header("Location: home/listarPartidas");
                exit;
                }
        } else {
                    echo $this->presenter->render("login", [
                        'error' => 'Nombre de usuario o contraseña incorrectos'
                    ]);
                }
            }
    }


