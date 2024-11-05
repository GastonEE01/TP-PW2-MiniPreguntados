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

CREATE TABLE Sugerencia (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Pregunta TEXT NOT NULL,
    Categoria VARCHAR(50),
    Usuario_id INT,
    FOREIGN KEY (Usuario_id) REFERENCES Usuario(id)
);

INSERT INTO  usuario(id,nombre,nombre_usuario,contrasenia,fecha_nacimiento,pais,sexo,ciudad,email,rol,latitudMapa,longitudMapa)
values
    (100,'admin','admin_user','1234a','2000-02-02','Argentina','FEMENINO','La pampa','admin@gmail.com',3,0,0  ),
    (101,'editor','editor_user','1234e','2000-02-02','Argentina','FEMENINO','La pampa','editor@gmail.com',2,0,0  );

UPDATE usuario
SET rol = 3
WHERE id = 100;

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
