<?php
class MysqlDatabase
{
    private $conn;
    public function __construct($host, $port, $username, $password, $database)
    {
        $this->conn = mysqli_connect($host, $username, $password, $database, $port);

        if (!$this->conn) {
            die("Connection failed: " . mysqli_connect_error());
        }
    }

    // Agrego esto para que funcione la bdd con sesiones
    public function getConnection() {
        return $this->conn;
    }

    /*
    public function query($sql){
        $result = mysqli_query($this->conn, $sql);
        return  mysqli_fetch_all($result, MYSQLI_ASSOC);
    }*/

    public function query($sql) {
        $result = mysqli_query($this->conn, $sql);
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    public function execute($sql, $params = []) {
        $stmt = mysqli_prepare($this->conn, $sql);

        if ($stmt === false) {
            throw new mysqli_sql_exception(mysqli_error($this->conn));
        }

        // Vincular los parámetros
        if (!empty($params)) {
            $types = str_repeat('s', count($params)); // Asumiendo que todos los parámetros son strings
            mysqli_stmt_bind_param($stmt, $types, ...$params);
        }

        // Ejecutar la consulta
        $result = mysqli_stmt_execute($stmt);

        if ($result === false) {
            mysqli_stmt_close($stmt); // Cerrar el stmt antes de lanzar la excepción
            throw new mysqli_sql_exception(mysqli_error($this->conn));
        }

        // Obtener el número de filas afectadas antes de cerrar el stmt
        $affectedRows = mysqli_stmt_affected_rows($stmt);
        mysqli_stmt_close($stmt); // Cerrar el stmt después de obtener las filas afectadas
        $insertedId = mysqli_insert_id($this->conn);//trae el id del ultimo registro creado o eso dice chatgpt

        return [
            'affected_rows' => $affectedRows,
            'user_id' => $insertedId
        ];
    }


    /*
    public function execute($sql){
        mysqli_query($this->conn, $sql);
        return $this->conn->affected_rows;
    }*/



    public function __destruct()
    {
        mysqli_close($this->conn);
    }
}
