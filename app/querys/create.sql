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

ALTER TABLE usuario
    ADD COLUMN rol INT,
    ADD COLUMN latitudMapa INT,
    ADD COLUMN longitudMapa INT;

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