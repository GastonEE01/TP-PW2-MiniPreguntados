CREATE TABLE  usuario (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  nombre_usuario VARCHAR(50) NOT NULL,
  contrasenia VARCHAR(255) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  pais  VARCHAR(255) NOT NULL,
  sexo  VARCHAR(255) NOT NULL,
  ciudad  VARCHAR(255) NOT NULL,
  email  VARCHAR(255) NOT NULL  
);

ALTER TABLE usuario
    ADD COLUMN activo BOOLEAN DEFAULT FALSE,
    ADD COLUMN token INT;



CREATE TABLE partida (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         id_usuario INT,
                         puntaje INT DEFAULT 0,
                         fecha_inicio DATETIME,
                         fecha_fin DATETIME,
                         estado ENUM('en curso', 'finalizada'),
                         FOREIGN KEY (id_usuario) REFERENCES usuario(id)
);

ALTER TABLE partida
    ADD COLUMN descripcion varchar(50);
