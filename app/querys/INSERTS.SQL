-- Arrancan los inserts
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
INSERT INTO Status (Estado) VALUES ('Finalizado');

INSERT INTO Rol (Rol) VALUES ('Normal');
INSERT INTO Rol (Rol) VALUES ('Editor');
INSERT INTO Rol (Rol) VALUES ('Administrador');


INSERT INTO Usuario (nombre,
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
                     rol)
VALUES				('admin', 
                     'admin',
                     '$2y$10$SarjfMTLpHKo3qAOOdn4Q.WlXRI5uXZSGw5OuF2YMg6FbEqtTI0f2', 
                     '1968-08-12', 
                     'Argentina', 
                     'masculino', 
                     'Buenos Aires',
                     'estevezgaston01@gmail.com',
                     NULL, 
                     1, 
                     NULL,
                     NULL,
                     NULL,
                     3);

INSERT INTO Usuario (nombre,
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
                     rol)
                    ('editor',
                    'editor', 
                    '$2y$10$Yl8F0Hz6XESgaRqFiwzHX.fH2V.d5JU8VkL8/plaPlFSKFcDIcBE2', 
                    '1970-04-22', 
                    'Argentina',
                     'femenino',
                      'Buenos Aires', 
                      'estevezgaston01@gmail.com', NULL, 1, NULL, NULL, NULL, 2);