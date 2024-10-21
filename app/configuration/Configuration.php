<?php
include_once("helper/MysqlDatabase.php");
include_once("helper/MysqlObjectDatabase.php");
include_once("helper/IncludeFilePresenter.php");
include_once("helper/Router.php");
include_once("helper/MustachePresenter.php");
include_once('vendor/mustache/src/Mustache/Autoloader.php');

include_once("model/PokedexModel.php");
include_once("model/RegistroModel.php");
include_once("controller/PokedexController.php");
include_once("model/LoginModel.php");

include_once("model/UsuarioModel.php");


include_once("controller/UsuarioController.php");
include_once("controller/HomeController.php");
include_once("controller/PerfilController.php");
include_once("controller/InicioController.php");
include_once("controller/RegistroController.php");
include_once("controller/LoginController.php");


class Configuration
{
    public function __construct() {}

    public function getPresenter()
    {
        // Asegúrate de devolver una instancia de MustachePresenter
        return new MustachePresenter("./view");
    }

    public function getInicioController()
    {
        return new InicioController($this->getPresenter());
    }

    public function getRegistroController()
    {
        return new RegistroController($this->getPresenter(), new RegistroModel($this->getDatabase()));
    }

    public function getLoginController()
    {
        return new LoginController($this->getPresenter(), new LoginModel($this->getDatabase()));
    }

    public function getHomeController()
    {
        return new HomeController($this->getPresenter());
    }

    public function getPerfilController()
    {
        return new PerfilController($this->getPresenter());
    }

    public function getDatabase()
    {
        $config = parse_ini_file("configuration/config.ini");
        return new MysqlDatabase($config["host"], $config["port"], $config["username"], $config["password"], $config["dbname"]);
    }

    public function getRouter()
    {
        return new Router($this, "getInicioController", "inicio");
    }
}
