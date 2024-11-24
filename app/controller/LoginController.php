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
        $sesion = new ManejoSesiones();
        // Limpio la cache por si el usuario va para atras ( <- ) y NO APRETO EL BOTON DE CERRAR SESION
        $sesion->limpiarCache();
        echo $this->presenter->render('login', [
            'nombre_usuario' => 'Invitado',
            'id' => ''
        ]);
    }

    /*
        public function validarUsuario($data)
        {
            $nombre_usuario = $data['nombre_usuario'] ?? null;
            $contrasenia = $data['contrasenia'] ?? null;
            $buscarUsuario = $this->loginModel->buscarUsuario($nombre_usuario);

            if ($buscarUsuario['activo'] == 1) {
                // Si el rol es 2, redirige a la vista del editor
                $sesion = new ManejoSesiones();
                $sesion->iniciarSesion($buscarUsuario);

                if ($buscarUsuario['rol'] == 2) {
                   // header("Location: index.php?page=editor");

                    header("Location: /tp-pw2-MiniPreguntados/app/editor");
                    exit();
                }
                // Si el rol es 3, redirige a la vista del administrador
                elseif ($buscarUsuario['rol'] == 3) {
                   // header("Location: admin");

                    header("Location: /tp-pw2-MiniPreguntados/app/admin");
                    exit();
                }else {
                    $buscarUsuario = $this->loginModel->loginUser($nombre_usuario,$contrasenia);
                   // $sesion = new ManejoSesiones();
                  //  $user =  $sesion->iniciarSesion($buscarUsuario);
                  //  print_r($user);
                  //  error_log("Datos de la sesión: " . print_r($_SESSION['usuario'], true)); // Depuración
                    header("Location: /tp-pw2-MiniPreguntados/app/home/listarPartidas");
                    exit();
                }
            } else {
                        echo $this->presenter->render("login", [
                            'error' => 'Nombre de usuario o contraseña incorrectos'
                        ]);
                    }
                }

    */

    public function validarUsuario($data)
    {
        $nombre_usuario = $data['nombre_usuario'] ?? null;
        $contrasenia = $data['contrasenia'] ?? null;

        $user = $this->loginModel->loginUser($nombre_usuario, $contrasenia);

        if ($user['activo'] == 1) {
            $sesion = new ManejoSesiones();
            $sesion->iniciarSesion($user);
            // Si el rol es 2, redirige a la vista del editor
            if ($user['rol'] == 2) {
                header("Location: /tp-pw2-MiniPreguntados/app/editor");
                exit;
            } // Si el rol es 3, redirige a la vista del administrador
            elseif ($user['rol'] == 3) {
                header("Location: /tp-pw2-MiniPreguntados/app/admin");
                exit;
            } else {
                header("Location: /tp-pw2-MiniPreguntados/app/home/listarPartidas");
                exit;
            }
        } else {
            echo $this->presenter->render("login", [
                'error' => 'Nombre de usuario o contraseña incorrectos'
            ]);
        }
    }

    public function cerrarSesion()
    {
        $sesion = new ManejoSesiones();
        $sesion->cerrarSesion();
        header("Location: /tp-pw2-MiniPreguntados/app/login");
        exit;
    }

//     public function validarUsuario($data)
//    {
//        $sesion = new ManejoSesiones();
//        $sesion->cerrarSesion();
//
//        $nombre_usuario = $data['nombre_usuario'] ?? null;
//        $contrasenia = $data['contrasenia'] ?? null;
//
//        // Verifica si el usuario existe
//        $buscarUsuario = $this->loginModel->buscarUsuario($nombre_usuario);
//        $this->loginModel->loginUser($buscarUsuario, $contrasenia);
//
//        if ($buscarUsuario && $buscarUsuario['activo'] == 1) {
//
//            $sesion = new ManejoSesiones();
//            $sesion->iniciarSesion($buscarUsuario);
//            $this->loginModel->loginUser($buscarUsuario, $contrasenia);
//
//            // Si es editor, redirige a la vista del editor
//            if ($buscarUsuario['rol'] == 2 ) {
//                header("Location: /tp-pw2-MiniPreguntados/app/editor");
//                exit();
//            }
//
//            // Si es administrador, redirige a la vista del administrador
//            elseif ($buscarUsuario['rol'] == 3) {
//                header("Location: /tp-pw2-MiniPreguntados/app/admin");
//                exit();
//            }
//
//            // Si es un usuario común
//            else {
//                // session_unset();
//                //session_destroy();
//                $user = $this->loginModel->loginUser($buscarUsuario, $contrasenia);
//               // $sesion1 = new ManejoSesiones();
//                //$sesion1->iniciarSesion($user);
//                header("Location: /tp-pw2-MiniPreguntados/app/home/listarPartidas");
//                exit();
//            }
//        } else {
//            // Renderiza la vista de login con mensaje de error
//            echo $this->presenter->render("login", [
//                'error' => 'Nombre de usuario o contraseña incorrectos'
//            ]);
//        }
//    }

    /* public function validarUsuario($data)
     {
         $nombre_usuario = $data['nombre_usuario'] ?? null;
         $contrasenia = $data['contrasenia'] ?? null;

         // Verifica si el usuario existe
         $buscarUsuario = $this->loginModel->buscarUsuario($nombre_usuario);

         // Verificar si el usuario fue encontrado
         if ($buscarUsuario) {
             error_log("Usuario encontrado: " . print_r($buscarUsuario, true));
         } else {
             error_log("Usuario no encontrado: $nombre_usuario");
         }

         if ($buscarUsuario && $buscarUsuario['activo'] == 1) {
             // Verifica la contraseña
             if (!password_verify($contrasenia, $buscarUsuario['contrasenia'])) {
                 error_log("Contraseña incorrecta para el usuario: $nombre_usuario");
                 echo $this->presenter->render("login", [
                     'error' => 'Contraseña incorrecta'
                 ]);
                 return;
             }

             // Cierra sesión previa (por seguridad)
             $sesion = new ManejoSesiones();
             $sesion->cerrarSesion();

             // Inicia una nueva sesión para el usuario actual
             $sesion->iniciarSesion($buscarUsuario);
             error_log("Sesión iniciada con el usuario: " . print_r($_SESSION['usuario'], true));

             // Redirecciona según el rol
             switch ($buscarUsuario['rol']) {
                 case 2: // Editor
                     header("Location: /tp-pw2-MiniPreguntados/app/editor");
                     exit();
                 case 3: // Administrador
                     header("Location: /tp-pw2-MiniPreguntados/app/admin");
                     exit();
                 default: // Usuario común
                     header("Location: /tp-pw2-MiniPreguntados/app/home/listarPartidas");
                     exit();
             }
         } else {
             error_log("Usuario no activo o no encontrado: $nombre_usuario");
             // Renderiza la vista de login con mensaje de error
             echo $this->presenter->render("login", [
                 'error' => 'Nombre de usuario o contraseña incorrectos'
             ]);
         }
     }
 */
}


