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
    email  VARCHAR(255) NOT NULL  ,
    Path_img_perfil VARCHAR(255),
    activo BOOLEAN DEFAULT FALSE,
    token INT,
    latitudMapa INT,
    longitudMapa INT,
    rol INT,
    FOREIGN KEY (rol) REFERENCES Rol(ID)
);

ALTER TABLE Usuario
    ADD COLUMN total_respuestas INT DEFAULT 1,
    ADD COLUMN total_respuestas_correctas INT DEFAULT 0;

UPDATE Usuario
SET total_respuestas_correctas = 0,
    total_respuestas=1;

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


ALTER TABLE Pregunta
    ADD COLUMN mostrada INT DEFAULT 1,
    ADD COLUMN acertada INT DEFAULT 1;

UPDATE Pregunta
SET Dificultad = 1,
     mostrada = 1,
    acertada=1;

CREATE TABLE Respuesta (
ID INT PRIMARY KEY AUTO_INCREMENT,
Texto_respuesta TEXT NOT NULL,
Es_correcta BOOLEAN DEFAULT FALSE, -- Solo una respuesta tendrá TRUE para cada pregunta
Pregunta_id INT,
FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID)
);
CREATE TABLE Partida (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Status_id INT,
    Descripcion TEXT NOT NULL ,
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

/*
CREATE TABLE Sugerencia (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Pregunta TEXT NOT NULL,
    Categoria VARCHAR(50),
    Usuario_id INT,
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);
*/

/* Modifique la tabla para implementar que el usuario pueda crear pregunta*/
CREATE TABLE Sugerencia (
                            ID INT PRIMARY KEY AUTO_INCREMENT,
                            Pregunta TEXT NOT NULL,
                            OpcionA VARCHAR(255) NOT NULL,
                            OpcionB VARCHAR(255) NOT NULL,
                            OpcionC VARCHAR(255) NOT NULL,
                            OpcionD VARCHAR(255) NOT NULL,
                            OpcionCorrecta CHAR(1) NOT NULL, -- para almacenar la letra de la opción correcta
                            Categoria VARCHAR(50),
                            Usuario_id INT,
                            FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

INSERT INTO  usuario(id,nombre,nombre_usuario,contrasenia,fecha_nacimiento,pais,sexo,ciudad,email,Path_img_perfil,activo,token,latitudMapa,longitudMapa,rol,total_respuestas,total_respuestas_correctas)
values
    (100,'admin','admin_user','1234a','2000-02-02','Argentina','FEMENINO','La pampa','admin@gmail.com',null,1,0,0,0,2,0,0 ),
    (101,'editor','editor_user','1234e','2000-02-02','Argentina','FEMENINO','La pampa','editor@gmail.com',null,1,0,0,0,3,0,0  );


UPDATE usuario
SET activo = 1
WHERE id = 100;


INSERT INTO Categoria (Categoria, Color) VALUES ('Arte', 'Azul');
INSERT INTO Categoria (Categoria, Color) VALUES ('Cine', 'Rojo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Deportes', 'Verde');
INSERT INTO Categoria (Categoria, Color) VALUES ('Historia', 'Amarillo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Ciencia', 'Morado');
INSERT INTO Categoria (Categoria, Color) VALUES ('Geografía', 'Naranja');

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién pintó La Última Cena?', 1, 1);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿En qué museo se encuentra la Mona Lisa?', 1, 1);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es el estilo de arte de Picasso?', 2, 1);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué artista es famoso por sus obras de girasoles?', 1, 1);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué color se usa principalmente en la obra La Noche Estrellada?', 2, 1);

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién dirigió la película "Titanic"?', 1, 2);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿En qué año se estrenó "El Padrino"?', 2, 2);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué actor interpretó a Forrest Gump?', 1, 2);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es la película con mayor recaudación?', 2, 2);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué película ganó el Oscar en 2020?', 2, 2);

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién ganó el Mundial 2014?', 1, 3);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿En qué país se originó el baloncesto?', 1, 3);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuántos jugadores tiene un equipo de fútbol?', 1, 3);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién tiene más medallas olímpicas?', 2, 3);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué deporte juega Roger Federer?', 1, 3);

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién fue el primer presidente de EE.UU.?', 1, 4);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿En qué año terminó la Segunda Guerra Mundial?', 1, 4);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién descubrió América?', 1, 4);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál fue la primera civilización?', 2, 4);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién fue conocido como el Rey Sol?', 2, 4);

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Quién formuló la teoría de la relatividad?', 1, 5);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es el planeta más grande del sistema solar?', 1, 5);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué elemento es el más abundante en el universo?', 2, 5);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es la fórmula del agua?', 1, 5);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué órgano bombea la sangre?', 1, 5);

INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es el país más grande del mundo?', 1, 6);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿En qué continente está Egipto?', 1, 6);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Cuál es el río más largo del mundo?', 1, 6);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Qué país tiene más habitantes?', 1, 6);
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES ('¿Dónde se encuentra el Monte Everest?', 1, 6);


UPDATE Pregunta
SET Dificultad =2
WHERE ID=3;
UPDATE Pregunta
SET Dificultad =3
WHERE ID=4;

UPDATE Pregunta
SET Dificultad =3
WHERE ID=7;
UPDATE Pregunta
SET Dificultad =2
WHERE ID=6;

UPDATE Pregunta
SET Dificultad =3
WHERE ID=14;
UPDATE Pregunta
SET Dificultad =2
WHERE ID=15;

UPDATE Pregunta
SET Dificultad =3
WHERE ID=18;
UPDATE Pregunta
SET Dificultad =2
WHERE ID=17;

UPDATE Pregunta
SET Dificultad =3
WHERE ID=21;
UPDATE Pregunta
SET Dificultad =2
WHERE ID=22;

UPDATE Pregunta
SET Dificultad =3
WHERE ID=27;
UPDATE Pregunta
SET Dificultad =2
WHERE ID=30;


INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Leonardo da Vinci', TRUE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Pablo Picasso', FALSE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Vincent van Gogh', FALSE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Claude Monet', FALSE, 1);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Museo del Louvre', TRUE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Museo del Prado', FALSE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Museo Nacional', FALSE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Galería Uffizi', FALSE, 2);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Leonardo da Vinci', TRUE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Pablo Picasso', FALSE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Vincent van Gogh', FALSE, 1);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Claude Monet', FALSE, 1);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Museo del Louvre', TRUE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Museo del Prado', FALSE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Galería Nacional', FALSE, 2);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Galería Uffizi', FALSE, 2);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Cubismo', TRUE, 3);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Impresionismo', FALSE, 3);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Surrealismo', FALSE, 3);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Realismo', FALSE, 3);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Vincent van Gogh', TRUE, 4);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Claude Monet', FALSE, 4);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Leonardo da Vinci', FALSE, 4);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Salvador Dalí', FALSE, 4);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Azul', TRUE, 5);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Rojo', FALSE, 5);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Amarillo', FALSE, 5);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Verde', FALSE, 5);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('James Cameron', TRUE, 6);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Steven Spielberg', FALSE, 6);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Martin Scorsese', FALSE, 6);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Christopher Nolan', FALSE, 6);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1972', TRUE, 7);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1980', FALSE, 7);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1975', FALSE, 7);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1990', FALSE, 7);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Tom Hanks', TRUE, 8);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Leonardo DiCaprio', FALSE, 8);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Robert De Niro', FALSE, 8);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Johnny Depp', FALSE, 8);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Avatar', TRUE, 9);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Titanic', FALSE, 9);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Avengers: Endgame', FALSE, 9);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Jurassic Park', FALSE, 9);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Parasite', TRUE, 10);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Joker', FALSE, 10);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1917', FALSE, 10);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Once Upon a Time in Hollywood', FALSE, 10);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Alemania', TRUE, 11);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Argentina', FALSE, 11);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Brasil', FALSE, 11);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Francia', FALSE, 11);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Estados Unidos', TRUE, 12);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Canadá', FALSE, 12);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Brasil', FALSE, 12);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('España', FALSE, 12);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('11', TRUE, 13);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('10', FALSE, 13);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('9', FALSE, 13);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('12', FALSE, 13);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Michael Phelps', TRUE, 14);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Usain Bolt', FALSE, 14);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Simone Biles', FALSE, 14);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Carl Lewis', FALSE, 14);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Tenis', TRUE, 15);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Fútbol', FALSE, 15);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Baloncesto', FALSE, 15);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Golf', FALSE, 15);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('George Washington', TRUE, 16);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Thomas Jefferson', FALSE, 16);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Abraham Lincoln', FALSE, 16);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('John Adams', FALSE, 16);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1939', TRUE, 17);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1941', FALSE, 17);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1936', FALSE, 17);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1945', FALSE, 17);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Genghis Khan', TRUE, 18);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Julio César', FALSE, 18);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Alejandro Magno', FALSE, 18);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Napoleón Bonaparte', FALSE, 18);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Francia', TRUE, 19);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Inglaterra', FALSE, 19);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Rusia', FALSE, 19);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Alemania', FALSE, 19);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1989', TRUE, 20);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1990', FALSE, 20);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1985', FALSE, 20);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('1991', FALSE, 20);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('H2O', TRUE, 21);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('CO2', FALSE, 21);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('O2', FALSE, 21);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('H2SO4', FALSE, 21);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Júpiter', TRUE, 22);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Saturno', FALSE, 22);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Marte', FALSE, 22);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Venus', FALSE, 22);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Célula', TRUE, 23);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Átomo', FALSE, 23);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Molécula', FALSE, 23);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Organelo', FALSE, 23);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Albert Einstein', TRUE, 24);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Isaac Newton', FALSE, 24);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Galileo Galilei', FALSE, 24);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Nikola Tesla', FALSE, 24);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Litio', TRUE, 25);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Oro', FALSE, 25);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Plata', FALSE, 25);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Plomo', FALSE, 25);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Río Amazonas', TRUE, 26);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Río Nilo', FALSE, 26);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Río Yangtsé', FALSE, 26);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Río Misisipi', FALSE, 26);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Rusia', TRUE, 27);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Canadá', FALSE, 27);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('China', FALSE, 27);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Estados Unidos', FALSE, 27);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('África', TRUE, 28);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Asia', FALSE, 28);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Europa', FALSE, 28);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Oceanía', FALSE, 28);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Océano Pacífico', TRUE, 29);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Océano Atlántico', FALSE, 29);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Océano Índico', FALSE, 29);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Océano Ártico', FALSE, 29);

INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Tokio', TRUE, 30);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Kioto', FALSE, 30);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Osaka', FALSE, 30);
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES ('Hiroshima', FALSE, 30);

INSERT INTO Status (Estado) VALUES ('En curso');

-- Insertar estado 'Finalizado'
INSERT INTO Status (Estado) VALUES ('Finalizado');

-- Crear tres usuarios
INSERT INTO Usuario (nombre, nombre_usuario, contrasenia, fecha_nacimiento, pais, sexo, ciudad, email, Path_img_perfil, activo, token, latitudMapa, longitudMapa, rol)
VALUES
    ('Juan Pérez', 'juanp', 'password123', '1990-05-20', 'Argentina', 'Masculino', 'Buenos Aires', 'juanp@example.com', 1, TRUE, NULL, NULL, NULL, 1),
    ('María García', 'mariag', 'password123', '1985-11-12', 'Argentina', 'Femenino', 'Córdoba', 'mariag@example.com', 1, TRUE, NULL, NULL, NULL, 1),
    ('Carlos Díaz', 'carlosd', 'password123', '1992-03-15', 'Argentina', 'Masculino', 'Rosario', 'carlosd@example.com', 1, TRUE, NULL, NULL, NULL, 1);


-- Crear partidas para los usuarios
INSERT INTO Partida (Status_id, Descripcion, Puntuacion, Puntuacion_porcentaje, Usuario_id, Fecha_creada, Fecha_finalizada)
VALUES
-- Partidas para Juan Pérez (usuario ID 1)
(1, 'Partida 1 para Juan', 950, 95.00, 1, '2024-01-01 10:00:00', '2024-01-01 10:30:00'),
(1, 'Partida 2 para Juan', 800, 80.00, 1, '2024-01-05 15:00:00', '2024-01-05 15:40:00'),

-- Partidas para María García (usuario ID 2)
(1, 'Partida 1 para María', 920, 92.00, 2, '2024-01-02 11:00:00', '2024-01-02 11:45:00'),
(1, 'Partida 2 para María', 870, 87.00, 2, '2024-01-06 16:00:00', '2024-01-06 16:35:00'),

-- Partidas para Carlos Díaz (usuario ID 3)
(1, 'Partida 1 para Carlos', 900, 90.00, 3, '2024-01-03 12:00:00', '2024-01-03 12:50:00'),
(1, 'Partida 2 para Carlos', 850, 85.00, 3, '2024-01-07 17:00:00', '2024-01-07 17:30:00');



/*
-- Tabla Usuario
CREATE TABLE Usuario (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(50) NOT NULL,
                         nombre_usuario VARCHAR(50) NOT NULL,
                         contrasenia VARCHAR(255) NOT NULL,
                         fecha_nacimiento DATE NOT NULL,
                         pais VARCHAR(255) NOT NULL,
                         sexo VARCHAR(255) NOT NULL,
                         ciudad VARCHAR(255) NOT NULL,
                         email VARCHAR(255) NOT NULL,
                         Path_img_perfil VARCHAR(255),
                         activo BOOLEAN DEFAULT FALSE,
                         token INT,
                         latitudMapa INT,
                         longitudMapa INT,
                         total_respuestas INT DEFAULT 1,
                         total_respuestas_correctas INT DEFAULT 0,
                         enLinea BOOLEAN DEFAULT FALSE,
                         rol INT NOT NULL DEFAULT 1
);

-- Tabla Categoria
CREATE TABLE Categoria (
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           Categoria VARCHAR(50) NOT NULL,
                           Color VARCHAR(50)
);

-- Tabla Pregunta
CREATE TABLE Pregunta (
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          Pregunta TEXT NOT NULL,
                          Dificultad INT NOT NULL,
                          Categoria_id INT,
                          mostrada INT DEFAULT 1,
                          acertada INT DEFAULT 1,
                          FOREIGN KEY (Categoria_id) REFERENCES Categoria(ID)
);

-- Tabla Respuesta
CREATE TABLE Respuesta (
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           Texto_respuesta TEXT NOT NULL,
                           Es_correcta BOOLEAN DEFAULT FALSE,
                           Pregunta_id INT,
                           id_partida INT,
                           FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID)
);

-- Tabla Partida
CREATE TABLE Partida (
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         Descripcion TEXT NOT NULL,
                         Puntuacion INT NOT NULL,
                         Puntuacion_porcentaje DECIMAL(5, 2) NOT NULL,
                         Usuario_id INT,
                         Fecha_creada DATETIME DEFAULT CURRENT_TIMESTAMP,
                         Fecha_finalizada DATETIME,
                         FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

-- Tabla Pregunta_vista
CREATE TABLE Pregunta_vista (
                                ID INT AUTO_INCREMENT PRIMARY KEY,
                                Usuario_id INT,
                                Pregunta_id INT,
                                FOREIGN KEY (Usuario_id) REFERENCES Usuario(id),
                                FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID)
);

-- Tabla Reporte
CREATE TABLE Reporte (
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         Pregunta_id INT,
                         Descripcion TEXT NOT NULL,
                         Usuario_id INT,
                         FOREIGN KEY (Pregunta_id) REFERENCES Pregunta(ID),
                         FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

-- Tabla Sugerencia
CREATE TABLE Sugerencia (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            Pregunta TEXT NOT NULL,
                            OpcionA TEXT NOT NULL,
                            OpcionB TEXT NOT NULL,
                            OpcionC TEXT NOT NULL,
                            OpcionD TEXT NOT NULL,
                            OpcionCorrecta CHAR(1) NOT NULL,
                            Categoria VARCHAR(50) NOT NULL,
                            Usuario_id INT,
                            FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);


INSERT INTO Categoria (Categoria, Color) VALUES ('Arte', 'Azul');
INSERT INTO Categoria (Categoria, Color) VALUES ('Cine', 'Rojo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Deportes', 'Verde');
INSERT INTO Categoria (Categoria, Color) VALUES ('Historia', 'Amarillo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Ciencia', 'Morado');
INSERT INTO Categoria (Categoria, Color) VALUES ('Geografía', 'Naranja');

-- Insertar usuario "editor"
INSERT INTO Usuario (
    nombre,
    nombre_usuario,
    contrasenia,
    fecha_nacimiento,
    pais,
    sexo,
    ciudad,
    email,
    Path_img_perfil,
    activo,
    token,
    latitudMapa,
    longitudMapa,
    total_respuestas,
    total_respuestas_correctas,
    enLinea,
    rol
) VALUES (
             'Editor User',             -- nombre
             'editor',                  -- nombre_usuario
             '1234e',                   -- contrasenia
             '1990-01-01',              -- fecha_nacimiento
             'Argentina',               -- pais
             'Masculino',               -- sexo
             'Buenos Aires',            -- ciudad
             'editor@example.com',      -- email
             'path/to/editor_profile',  -- Path_img_perfil
             TRUE,                      -- activo
             NULL,                      -- token
             -34,                       -- latitudMapa
             -58,                       -- longitudMapa
             10,                        -- total_respuestas
             8,                         -- total_respuestas_correctas
             TRUE,                      -- enLinea
             2                          -- rol (editor)
         );

-- Insertar usuario "admin"
INSERT INTO Usuario (
    nombre,
    nombre_usuario,
    contrasenia,
    fecha_nacimiento,
    pais,
    sexo,
    ciudad,
    email,
    Path_img_perfil,
    activo,
    token,
    latitudMapa,
    longitudMapa,
    total_respuestas,
    total_respuestas_correctas,
    enLinea,
    rol
) VALUES (
             'Admin User',              -- nombre
             'admin',                   -- nombre_usuario
             '1234a',                   -- contrasenia
             '1985-05-15',              -- fecha_nacimiento
             'Argentina',               -- pais
             'Femenino',                -- sexo
             'Córdoba',                 -- ciudad
             'admin@example.com',       -- email
             'path/to/admin_profile',   -- Path_img_perfil
             TRUE,                      -- activo
             NULL,                      -- token
             -31,                       -- latitudMapa
             -64,                       -- longitudMapa
             15,                        -- total_respuestas
             12,                        -- total_respuestas_correctas
             TRUE,                      -- enLinea
             3                          -- rol (admin)
         );

INSERT INTO Categoria (Categoria, Color) VALUES ('Arte', 'Azul');
INSERT INTO Categoria (Categoria, Color) VALUES ('Cine', 'Rojo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Deportes', 'Verde');
INSERT INTO Categoria (Categoria, Color) VALUES ('Historia', 'Amarillo');
INSERT INTO Categoria (Categoria, Color) VALUES ('Ciencia', 'Morado');
INSERT INTO Categoria (Categoria, Color) VALUES ('Geografía', 'Naranja');

-- Insertar preguntas para la categoría "Arte"
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Quién pintó la Mona Lisa?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿Dónde se encuentra el Museo del Louvre?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿Qué técnica de pintura utilizó Leonardo da Vinci en la Mona Lisa?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿En qué movimiento artístico se encuentra el Guernica?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿Quién es conocido como El Greco?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿Quién pintó la Capilla Sixtina?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿En qué período artístico se desarrolló la pintura de la Capilla Sixtina?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿En qué año fue pintada la Mona Lisa?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿De qué material está hecha la escultura de David de Miguel Ángel?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Arte')),
                                                              ('¿Qué estilo artístico utilizó Salvador Dalí?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Arte'));

-- Insertar respuestas para las preguntas de la categoría "Arte"
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('Leonardo da Vinci', TRUE, 1),
                                                                      ('Francia', TRUE, 2),
                                                                      ('Óleo sobre lienzo', TRUE, 3),
                                                                      ('Cubismo', TRUE, 4),
                                                                      ('Doménikos Theotokópoulos', TRUE, 5),
                                                                      ('Miguel Ángel', TRUE, 6),
                                                                      ('Renacimiento', TRUE, 7),
                                                                      ('1512', TRUE, 8),
                                                                      ('Bronce', TRUE, 9),
                                                                      ('Surrealismo', TRUE, 10);

-- Insertar preguntas para la categoría "Cine"
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Quién dirigió la película "El Padrino"?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Qué actor protagonizó la película "Forrest Gump"?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿En qué año se estrenó "La Guerra de las Galaxias"?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Cómo se llama el personaje principal en la película "Titanic"?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Quién ganó el Oscar a Mejor Director en 2018?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Cuál es el nombre de la saga de películas sobre un mago joven?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Qué película ganó el Oscar a Mejor Película en 2020?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿En qué película aparece el personaje de "Jack Sparrow"?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿Quién dirigió la película "Inception"?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Cine')),
                                                              ('¿En qué película de Pixar aparece el personaje de "Woody"?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Cine'));

-- Insertar respuestas para las preguntas de la categoría "Cine"
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('Francis Ford Coppola', TRUE, 1),
                                                                      ('Tom Hanks', TRUE, 2),
                                                                      ('1977', TRUE, 3),
                                                                      ('Rose', TRUE, 4),
                                                                      ('Guillermo del Toro', TRUE, 5),
                                                                      ('Harry Potter', TRUE, 6),
                                                                      ('Parasite', TRUE, 7),
                                                                      ('Piratas del Caribe', TRUE, 8),
                                                                      ('Christopher Nolan', TRUE, 9),
                                                                      ('Toy Story', TRUE, 10);

-- Insertar preguntas para la categoría "Deportes"
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Quién ganó el Mundial de Fútbol 2018?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Cuántos jugadores tiene un equipo de fútbol en el campo?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿En qué año se celebraron los primeros Juegos Olímpicos modernos?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Qué deporte se juega con una raqueta y una pelota amarilla?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿En qué país se originó el rugby?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Cuántos minutos dura un partido de fútbol profesional?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Quién es conocido como el mejor jugador de tenis de todos los tiempos?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Qué país ganó el Mundial de Fútbol 2014?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿Cuántos jugadores forman un equipo de baloncesto?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes')),
                                                              ('¿En qué año se jugó el primer Super Bowl?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Deportes'));

-- Insertar respuestas para las preguntas de la categoría "Deportes"
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('Francia', TRUE, 1),
                                                                      ('11', TRUE, 2),
                                                                      ('1896', TRUE, 3),
                                                                      ('Tenis', TRUE, 4),
                                                                      ('Inglaterra', TRUE, 5),
                                                                      ('90 minutos', TRUE, 6),
                                                                      ('Roger Federer', TRUE, 7),
                                                                      ('Alemania', TRUE, 8),
                                                                      ('5', TRUE, 9),
                                                                      ('1967', TRUE, 10);

-- Insertar preguntas para la categoría "Historia"
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Quién fue el primer presidente de los Estados Unidos?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿En qué año comenzó la Revolución Francesa?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Qué imperio construyó la Gran Muralla China?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Dónde tuvo lugar la Batalla de Waterloo?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Quién fue el primer emperador de Roma?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿En qué año terminó la Segunda Guerra Mundial?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Qué evento histórico ocurrió el 11 de septiembre de 2001?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Quién descubrió América?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿Qué guerra enfrentó a Estados Unidos y Vietnam?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Historia')),
                                                              ('¿En qué año cayó el Muro de Berlín?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Historia'));

-- Insertar respuestas para las preguntas de la categoría "Historia"
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('George Washington', TRUE, 1),
                                                                      ('1789', TRUE, 2),
                                                                      ('Dinastía Ming', TRUE, 3),
                                                                      ('Bélgica', TRUE, 4),
                                                                      ('Augusto', TRUE, 5),
                                                                      ('1945', TRUE, 6),
                                                                      ('Los atentados del 11 de septiembre', TRUE, 7),
                                                                      ('Cristóbal Colón', TRUE, 8),
                                                                      ('Guerra de Vietnam', TRUE, 9),
                                                                      ('1989', TRUE, 10);

-- Insertar preguntas para la categoría Ciencia
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Cuál es el elemento químico con el símbolo O?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Ciencia')),
                                                              ('¿Qué planeta es conocido como el "Planeta Rojo"?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Ciencia')),
                                                              ('¿Qué parte del cuerpo humano produce insulina?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Ciencia')),
                                                              ('¿Cómo se llama el proceso mediante el cual las plantas producen su propio alimento?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Ciencia')),
                                                              ('¿Quién propuso la teoría de la relatividad?', 4, (SELECT ID FROM Categoria WHERE Categoria = 'Ciencia'));

-- Insertar respuestas para la categoría Ciencia
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('Oxígeno', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el elemento químico con el símbolo O?')),
                                                                      ('Hidrógeno', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el elemento químico con el símbolo O?')),
                                                                      ('Carbono', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el elemento químico con el símbolo O?')),
                                                                      ('Nitrógeno', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el elemento químico con el símbolo O?')),

                                                                      ('Marte', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué planeta es conocido como el "Planeta Rojo"?')),
                                                                      ('Júpiter', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué planeta es conocido como el "Planeta Rojo"?')),
                                                                      ('Venus', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué planeta es conocido como el "Planeta Rojo"?')),
                                                                      ('Saturno', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué planeta es conocido como el "Planeta Rojo"?')),

                                                                      ('El páncreas', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué parte del cuerpo humano produce insulina?')),
                                                                      ('El hígado', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué parte del cuerpo humano produce insulina?')),
                                                                      ('Los riñones', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué parte del cuerpo humano produce insulina?')),
                                                                      ('El corazón', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué parte del cuerpo humano produce insulina?')),

                                                                      ('Fotosíntesis', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cómo se llama el proceso mediante el cual las plantas producen su propio alimento?')),
                                                                      ('Respiración celular', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cómo se llama el proceso mediante el cual las plantas producen su propio alimento?')),
                                                                      ('Transpiración', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cómo se llama el proceso mediante el cual las plantas producen su propio alimento?')),
                                                                      ('Digestión', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cómo se llama el proceso mediante el cual las plantas producen su propio alimento?')),

                                                                      ('Albert Einstein', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Quién propuso la teoría de la relatividad?')),
                                                                      ('Isaac Newton', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Quién propuso la teoría de la relatividad?')),
                                                                      ('Galileo Galilei', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Quién propuso la teoría de la relatividad?')),
                                                                      ('Nikola Tesla', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Quién propuso la teoría de la relatividad?'));

-- Insertar preguntas para la categoría Geografía
INSERT INTO Pregunta (Pregunta, Dificultad, Categoria_id) VALUES
                                                              ('¿Cuál es la capital de Francia?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Geografía')),
                                                              ('¿En qué continente se encuentra el río Amazonas?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Geografía')),
                                                              ('¿Qué país tiene más habitantes del mundo?', 1, (SELECT ID FROM Categoria WHERE Categoria = 'Geografía')),
                                                              ('¿En qué continente se encuentra el desierto del Sahara?', 2, (SELECT ID FROM Categoria WHERE Categoria = 'Geografía')),
                                                              ('¿Cuál es el océano más grande?', 3, (SELECT ID FROM Categoria WHERE Categoria = 'Geografía'));

-- Insertar respuestas para la categoría Geografía
INSERT INTO Respuesta (Texto_respuesta, Es_correcta, Pregunta_id) VALUES
                                                                      ('París', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es la capital de Francia?')),
                                                                      ('Londres', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es la capital de Francia?')),
                                                                      ('Roma', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es la capital de Francia?')),
                                                                      ('Madrid', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es la capital de Francia?')),

                                                                      ('Sudamérica', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el río Amazonas?')),
                                                                      ('África', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el río Amazonas?')),
                                                                      ('Asia', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el río Amazonas?')),
                                                                      ('Europa', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el río Amazonas?')),

                                                                      ('China', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué país tiene más habitantes del mundo?')),
                                                                      ('India', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué país tiene más habitantes del mundo?')),
                                                                      ('Estados Unidos', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué país tiene más habitantes del mundo?')),
                                                                      ('Indonesia', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Qué país tiene más habitantes del mundo?')),

                                                                      ('África', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el desierto del Sahara?')),
                                                                      ('Asia', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el desierto del Sahara?')),
                                                                      ('América del Norte', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el desierto del Sahara?')),
                                                                      ('Oceanía', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿En qué continente se encuentra el desierto del Sahara?')),

                                                                      ('Océano Pacífico', TRUE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el océano más grande?')),
                                                                      ('Océano Atlántico', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el océano más grande?')),
                                                                      ('Océano Índico', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el océano más grande?')),
                                                                      ('Océano Ártico', FALSE, (SELECT ID FROM Pregunta WHERE Pregunta = '¿Cuál es el océano más grande?'));
*/