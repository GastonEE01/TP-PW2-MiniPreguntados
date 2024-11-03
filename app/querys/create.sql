CREATE TABLE Rol (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Rol VARCHAR(50) NOT NULL
);

CREATE TABLE Status (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Estado VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasenia VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    pais  VARCHAR(255) NOT NULL,
    sexo  VARCHAR(255) NOT NULL,
    ciudad  VARCHAR(255) NOT NULL,
    email  VARCHAR(255) NOT NULL  
    Path_img_perfil VARCHAR(255),
    activo BOOLEAN DEFAULT FALSE,
    token INT,
    latitudMapa INT,
    longitudMapa INT,
    Rol_id INT,
    FOREIGN KEY (Rol_id) REFERENCES Rol(ID)
);

CREATE TABLE Categoria (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(50) NOT NULL,
    Color VARCHAR(50)
);

CREATE TABLE Pregunta (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Pregunta TEXT NOT NULL,
    Dificultad INT NOT NULL,
    Categoria_id INT,
    FOREIGN KEY (Categoria_id) REFERENCES Categoria(ID)
);

CREATE TABLE Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Status_id INT,
    Puntuacion INT NOT NULL,
    Puntuacion_porcentaje DECIMAL(5, 2) NOT NULL,
    Usuario_id INT,
    Fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_finalizada DATETIME,
    FOREIGN KEY (Status_id) REFERENCES Status(ID),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Pregunta_vista (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Usuario_id INT,
    Pregunta_id INT,
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID)
);

CREATE TABLE Reporte (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Pregunta_id INT,
    Descripcion TEXT NOT NULL,
    Usuario_id INT,
    FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID),
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Sugerencia (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Pregunta TEXT NOT NULL,
    Categoria VARCHAR(50),
    Usuario_id INT,
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

INSERT INTO  usuario(id,nombre,nombre_usuario,contrasenia,fecha_nacimiento,pais,sexo,ciudad,email,rol,latitudMapa,longitudMapa)
values
    (100,'admin','admin_user','1234a','2000-02-02','Argentina','FEMENINO','La pampa','admin@gmail.com',2,0,0  ),
    (101,'editor','editor_user','1234e','2000-02-02','Argentina','FEMENINO','La pampa','editor@gmail.com',2,0,0  );

UPDATE usuario
SET rol = 3
WHERE id = 100;

UPDATE usuario
SET activo = 1
WHERE id = 100;