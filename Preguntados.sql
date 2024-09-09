CREATE DATABASE PREGUNTADOS;

USE PREGUNTADOS;

CREATE TABLE Categorias(
    IdCategoria INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre VARCHAR(200) NOT NULL,
    Foto TEXT NOT NULL,
    Color VARCHAR(200) NOT NULL,
);

CREATE TABLE Dificultades(
    IdDificultad INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    Nombre VARCHAR(200) NOT NULL
);

CREATE TABLE Preguntas(
    IdPregunta INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    IdCategoria INT NOT NULL FOREIGN KEY REFERENCES Categorias(IdCategoria),
    IdDificultad INT NOT NULL FOREIGN KEY REFERENCES Dificultades(IdDificultad),
    Enunciado VARCHAR(200) NOT NULL,
    Foto TEXT   
);

CREATE TABLE Respuestas(
    IdRespuesta INT NOT NULL PRIMARY KEY IDENTITY(1, 1),
    IdPregunta INT NOT NULL FOREIGN KEY REFERENCES Preguntas(IdPregunta),
    Opcion INT NOT NULL,
    Contenido VARCHAR(200) NOT NULL,
    Correcta BIT NOT NULL,
    Foto TEXT
);

INSERT INTO Dificultades (Nombre) VALUES 
('Facil'),
('Medio'),
('Dificil'),
('Todos');


INSERT INTO Categorias(Nombre,Foto,Color) VALUES 
('Futbol Europeo', 'https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2022%2F0211%2Fr973052_1296x729_16%2D9.jpg', '#6B5B95'),
('Futbol Sudamericano', 'https://resizer.glanacion.com/resizer/v2/el-gol-de-K72K6KDI6JFG3NLOF7F4EBDNAI.jpg?auth=1a097fa58d9ca6ca5a70364edaccc282fcc190204ee70f6492d5802ac6d0ca8d&width=880&height=586&quality=70&smart=true', '#FF6F61'),
('Decada 2000','https://www.coervercoaching.com/wp-content/uploads/2019/02/Ronaldinho_Real_Madrid-Milan-e1549895206735-1024x655.jpg', '#88B04B') ;

INSERT INTO Preguntas(IdCategoria, IdDificultad, Enunciado, Foto) VALUES
(1,1,'¿Cuál es el nombre del torneo de clubes más prestigioso de Europa?', 'https://www.ole.com.ar/2019/05/08/RxAcoR1ih_720x0__1.jpg'),
(1,1,'¿Qué selección ganó la Eurocopa 2016?', 'https://images.pagina12.com.ar/styles/focal_3_2_960x640/public/2024-06/848849-trofeo-20y-20pelota-20euro-202024.jpg?h=885011cc&itok=7LXybzPg'),
(1,1,'¿Qué club es conocido por sus colores blanco y negro en Italia?', 'https://image.spreadshirtmedia.com/image-server/v1/products/T1459A839PA3861PT28D1027674207W8333H10000/views/1,width=1200,height=630,appearanceId=839,backgroundColor=F2F2F2/bianconeri-turin-sticker.jpg'),
(1,1,'¿Cuál es el país anfitrión del club FC Bayern Múnich?', 'https://images2.minutemediacdn.com/image/upload/c_crop,w_4000,h_2250,x_0,y_199/c_fill,w_720,ar_16:9,f_auto,q_auto,g_auto/images/GettyImages/mmsport/90min_es_international_web/01hvdecb13p5a8953dm6.jpg'),
(1,1,'¿Qué selección ganó la Copa del Mundo en 2010?', 'https://fotografias.larazon.es/clipping/cmsimages02/2019/08/09/1481A0EC-82CB-4A69-8734-4573A5DE4D79/98.jpg?crop=680,383,x0,y4&width=1900&height=1069&optimize=low&format=webply'),
(1,2,'¿Cuál es el máximo goleador de la historia de la Liga de Campeones de la UEFA?','https://editorial.uefa.com/resources/0246-0e98e0aed53b-074f228dc0a2-1000/ucl_branding.jpeg'),
(1,2,'¿Qué equipo inglés ganó la Premier League en la temporada 2021-2022?','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNJhe9PDuxsWKxEbtVjcUrzMWy0ELjMd15uQ&s'),
(1,2,'¿Qué club es conocido por su apodo "El Atleti"?','https://imagenes.20minutos.es/files/image_640_360/uploads/imagenes/2024/03/13/sommer-y-griezmann.jpeg'),
(1,2,'¿Quién fue el máximo goleador de la Liga Española en la temporada 2022-2023?','https://i.pinimg.com/originals/f1/74/64/f17464898f6cdd95c777f632623dff41.jpg'),
(1,2,'¿Qué club italiano ganó la Serie A en la temporada 2022-2023?','https://images.daznservices.com/di/library/DAZN_News/2e/da/sorteggio-calendario-serie-a-tim-2021-2022_1mrzug9um05lr1p8pcyhymwd1p.png?t=-952716806'),
(1,3,'¿Cuál es el récord de puntos en una sola temporada de la Premier League?','https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png'),
(1,3,'¿Qué jugador tiene el récord de más partidos jugados en la Champions League?','https://editorial.uefa.com/resources/0246-0e98e0aed53b-074f228dc0a2-1000/ucl_branding.jpeg'),
(1,3,'¿Cuál es el único club que ha ganado la Liga de Campeones de la UEFA sin perder un solo partido en la fase de grupos y la fase eliminatoria en una temporada?','https://estaticos-cdn.prensaiberica.es/clip/e6898958-167a-47a1-8b26-83890a0d17d7_alta-libre-aspect-ratio_default_0.jpg'),
(1,3,'¿Qué equipo fue el primero en ganar el triplete (Liga, Copa y Liga de Campeones) en una sola temporada?','https://www.mundodeportivo.com/files/image_449_220/uploads/2017/03/09/60e76b85b02cc.jpeg'),
(1,3,'¿Cuál es el estadio con mayor capacidad en Europa?','https://www.vipealo.com/blog/wp-content/uploads/2022/02/AdobeStock_315861649-1.jpeg');

INSERT INTO Respuestas(IdPregunta,Opcion,Contenido,Correcta,Foto) VALUES 
(1,1,'Liga de Campeones de la UEFA',1,''),
(1,2,'Liga Europa',0,''),
(1,3,'Copa Intercontinental',0,''),
(1,4,'Copa del Mundo de Clubes',0,''),
(2,1,'Portugal',1,''),
(2,2,'Francia',0,''),
(2,3,'España',0,''),
(2,4,'Alemania',0,''),
(3,1,'Juventus',1,''),
(3,2,'AC Milan',0,''),
(3,3,'Inter de Milán',0,''),
(3,4,'Roma',0,''),
(4,1,'Alemania',1,''),
(4,2,'Francia',0,''),
(4,3,'España',0,''),
(4,4,'Italia',0,''),
(5,1,'España',1,''),
(5,2,'Alemania',0,''),
(5,3,'Italia',0,''),
(5,4,'Francia',0,''),
(6,1,'Cristiano Ronaldo',1,''),
(6,2,'Lionel Messi',0,''),
(6,3,'Raúl González',0,''),
(6,4,'Robert Lewandowski',0,''),
(7,1,'Manchester City',1,''),
(7,2,'Liverpool',0,''),
(7,3,'Chelsea',0,''),
(7,4,'Manchester United',0,''),
(8,1,'Atlético de Madrid',1,''),
(8,2,'Real Madrid',0,''),
(8,3,'Barcelona',0,''),
(8,4,'Valencia',0,''),
(9,1,'Robert Lewandowski',1,''),
(9,2,'Karim Benzema',0,''),
(9,3,'Lionel Messi',0,''),
(9,4,'Vinícius Jr.',0,''),
(10,1,'Inter de Milán',1,''),
(10,2,'Juventus',0,''),
(10,3,'AC Milan',0,''),
(10,4,'Roma',0,''),
(11,1,'Cristiano Ronaldo',1,''),
(11,2,'Lionel Messi',0,''),
(11,3,'Robert Lewandowski',0,''),
(11,4,'Zinedine Zidane',0,''),
(12,1,'100 puntos',1,''),
(12,2,'98 puntos',0,''),
(12,3,'96 puntos',0,''),
(12,4,'102 puntos',0,''),
(13,1,'Real Madrid',1,''),
(13,2,'AC Milan',0,''),
(13,3,'Barcelona',0,''),
(13,4,'Inter de Milán',0,''),
(14,1,'Celtic FC (1966-1967)',1,''),
(14,2,'Inter de Milán',0,''),
(14,3,'Barcelona',0,''),
(14,4,'Manchester United',0,''),
(15,1,'Estadio de Wembley',1,''),
(15,2,'Camp Nou',0,''),
(15,3,'Allianz Arena',0,''),
(15,4,'San Siro',0,'');

INSERT INTO Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) VALUES
(2, 1, '¿Qué país ha ganado más veces la Copa América?', 'https://assets.goal.com/images/v3/blt68ada127a483d571/Trofeo-Copa-America-%EF%BF%BD-CONMEBOL-9807.jpg?auto=webp&format=pjpg&width=3840&quality=60'),
(2, 1, '¿Cuál es el apodo de la selección de Argentina?', 'https://resizer.glanacion.com/resizer/v2/la-sede-de-la-5ITMJC27YJG3BBZATTJ4GCOUJA.jpg?auth=8f34b0a70c668152cdec2c29645215b9016933cab86e518f6792cc66c8ce866c&width=768&quality=70&smart=false'),
(2, 1, '¿En qué país se encuentra el estadio Maracaná?', 'https://www.tangol.com/blog/Fotos/maracana-stadium-in-the-city-of-rio-de-janeiro-you-will-love-it_0_201806251313430.JPG'),
(2, 1, '¿Qué club es conocido como "Los Millonarios"?', 'https://media.tycsports.com/files/2023/02/12/533839/monumental_1440x810_wmk.webp'),
(2, 1, '¿Qué selección ganó la Copa del Mundo en 2002?', 'https://cdn.forbes.com.mx/2022/12/rhett-lewis-bdJ8Kxaz-mQ-unsplash-e1671492402841.jpg'),
(2, 2, '¿Quién es el máximo goleador histórico de la selección uruguaya?', 'https://s.yimg.com/ny/api/res/1.2/Xpi7ar.anBFqAGKmAZGJRg--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTQyNw--/https://media.zenfs.com/es/efe.es/43053e7422ddc1bcd7554f44e275384a'),
(2, 2, '¿En qué año ganó River Plate su primera Copa Libertadores?', 'https://cloudfront-us-east-1.images.arcpublishing.com/grupoclarin/2C7G6LZHR5C33F4VCXGD5MMIVM.jpg'),
(2, 2, '¿Cuál es el máximo goleador de la historia de la Copa Libertadores?', 'https://elcordillerano-s3.cdn.net.ar/s3i233/2024/06/elcordillerano/images/83/33/833361_2984b6c611efdaf4f2533e89f2fd66d374e3932c1af80284b053e195c2dbe0cd/lg.webp'),
(2, 2, '¿Qué club ganó la Copa Sudamericana en 2022?', 'https://pxcdn.0223.com.ar/f/042024/1712770857923.webp?cw=748&ch=420&cma=1&extw=jpeg'),
(2, 2, '¿Quién fue el entrenador de la selección chilena que ganó la Copa América en 2015?', 'https://files.antena2.com/antena2/public/2023-10/selecciondechile_1_0.jpg?VersionId=SExA3wYVrigw.KweBuds.EdLZ62DgvA9'),
(2, 3, '¿En qué año ganó Nacional de Uruguay su primera Copa Libertadores?', 'https://imgs.elpais.com.uy/dims4/default/720c533/2147483647/strip/true/crop/705x485+22+0/resize/1440x990!/quality/90/?url=https%3A%2F%2Fel-pais-uruguay-production-web.s3.us-east-1.amazonaws.com%2Fbrightspot%2Fuploads%2F2020%2F04%2F23%2F5ea1931be6aa7.jpeg'),
(2, 3, '¿Quién fue el primer futbolista argentino en ganar el Balón de Oro?', 'https://images.daznservices.com/di/library/DAZN_News/ff/31/balon-de-oro-2021_1199mc93ccyp21f9h4db74nz8m.jpg?t=-1513217510'),
(2, 3, '¿Cuál es el club más antiguo de Chile?', 'https://pxbcdn.elchubut.com.ar/chubut/062024/1718233217160.jpg'),
(2, 3, '¿Cuál es el único club peruano que ha ganado la Copa Libertadores?', 'https://elcomercio.pe/resizer/NoB8TnwqO4oj6aZytzqKqOX5LXQ=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/NT2YDY5NIRBNRCIUCX5S54ZEKM.jpg'),
(2, 3, '¿En qué año fue fundada la Confederación Sudamericana de Fútbol (CONMEBOL)?', 'https://cdn.conmebol.com/wp-content/uploads/2018/02/logo-conmebol-750px-azul_25.jpg');

-- Pregunta 1: ¿Qué país ha ganado más veces la Copa América?
INSERT INTO Respuestas(IdPregunta, Opcion, Contenido, Correcta, Foto) VALUES
(16, 1, 'Uruguay', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgCZF9p58LH4tpMChcVQr8GkmmvXQHqbMfRw&s'),
(16, 2, 'Brasil', 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png'),
(16, 3, 'Argentina', 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png'),
(16, 4, 'Chile', 0, 'https://www.shutterstock.com/image-illustration/flag-chile-chilean-on-fabric-260nw-2452772195.jpg'),
(17, 1, 'La Albiceleste', 1, ''),
(17, 2, 'La Celeste', 0, ''),
(17, 3, 'La Vinotinto', 0, ''),
(17, 4, 'La Roja', 0, ''),
(18, 1, 'Brasil', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png'),
(18, 2, 'Argentina', 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png'),
(18, 3, 'Uruguay', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgCZF9p58LH4tpMChcVQr8GkmmvXQHqbMfRw&s'),
(18, 4, 'Chile', 0, 'https://www.shutterstock.com/image-illustration/flag-chile-chilean-on-fabric-260nw-2452772195.jpg'),
(19, 1, 'River Plate', 1, 'https://marcadegol.com/fotos//2022/08/review-camiseta-titular-adidas-de-river-plate-2022-2023-header.jpg'),
(19, 2, 'Boca Juniors', 0, 'https://i.pinimg.com/736x/1a/89/81/1a8981aa5dd5b9e88002735337855cf7.jpg'),
(19, 3, 'Flamengo', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTG0yGdbDJ_9XVM1yzUcYRS7BYOJgFdrAexHQ&s'),
(19, 4, 'Santos', 0, 'https://i.pinimg.com/originals/d7/91/32/d791327c772ef6e28c236987a6917c69.png'),
(20, 1, 'Brasil', 1, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/640px-Flag_of_Brazil.svg.png'),
(20, 2, 'Argentina', 0, 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/1200px-Flag_of_Argentina.svg.png'),
(20, 3, 'Uruguay', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgCZF9p58LH4tpMChcVQr8GkmmvXQHqbMfRw&s'),
(20, 4, 'Paraguay', 0, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxrhYErTq1Y66xzYcojWuiMuHGxuuLfVGNXw&s');



-- Pregunta 21: ¿Quién es el máximo goleador histórico de la selección uruguaya?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (21, 1, 'Luis Suárez', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (21, 2, 'Diego Forlán', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (21, 3, 'Edinson Cavani', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (21, 4, 'Enzo Francescoli', 0);

-- Pregunta 22: ¿En qué año ganó River Plate su primera Copa Libertadores?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (22, 1, '1986', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (22, 2, '1976', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (22, 3, '1996', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (22, 4, '2006', 0);

-- Pregunta 23: ¿Cuál es el máximo goleador de la historia de la Copa Libertadores?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (23, 1, 'Alberto Spencer', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (23, 2, 'Pelé', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (23, 3, 'Carlos Bianchi', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (23, 4, 'Teófilo Cubillas', 0);

-- Pregunta 24: ¿Qué club ganó la Copa Sudamericana en 2022?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (24, 1, 'Independiente del Valle', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (24, 2, 'Athletico Paranaense', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (24, 3, 'Lanús', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (24, 4, 'Colón', 0);

-- Pregunta 25: ¿Quién fue el entrenador de la selección chilena que ganó la Copa América en 2015?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (25, 1, 'Jorge Sampaoli', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (25, 2, 'Marcelo Bielsa', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (25, 3, 'Manuel Pellegrini', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (25, 4, 'Héctor Cúper', 0);


-- Pregunta 26: ¿En qué año ganó Nacional de Uruguay su primera Copa Libertadores?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (26, 1, '1971', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (26, 2, '1961', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (26, 3, '1980', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (26, 4, '1988', 0);

-- Pregunta 27: ¿Quién fue el primer futbolista argentino en ganar el Balón de Oro?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (27, 1, 'Alfredo Di Stéfano', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (27, 2, 'Diego Maradona', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (27, 3, 'Lionel Messi', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (27, 4, 'Mario Kempes', 0);

-- Pregunta 28: ¿Cuál es el club más antiguo de Chile?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (28, 1, 'Santiago Wanderers', 1);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (28, 2, 'Colo-Colo', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (28, 3, 'Universidad de Chile', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (28, 4, 'Audax Italiano', 0);

-- Pregunta 29: ¿Cuál es el único club peruano que ha ganado la Copa Libertadores?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (29, 1, 'Sporting Cristal', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (29, 2, 'Alianza Lima', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (29, 3, 'Universitario', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (29, 4, 'Club Universitario de Deportes', 1);

-- Pregunta 30: ¿En qué año fue fundada la Confederación Sudamericana de Fútbol (CONMEBOL)?
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (30, 1, '1920', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (30, 2, '1919', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (30, 3, '1922', 0);
insert into Respuestas(IdPregunta, Opcion, Contenido, Correcta) 
values (30, 4, '1916', 1);



-- Insertar preguntas de nivel fácil
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 1, '¿En qué año ganó Brasil el Mundial de la FIFA en la década de 2000?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 1, '¿Qué jugador argentino ganó el Balón de Oro por primera vez en la década de 2000?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 1, '¿Qué equipo ganó la UEFA Champions League en 2005 tras una famosa remontada?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 1, '¿Qué selección sudamericana ganó la Copa América en 2004?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 1, '¿Quién fue el máximo goleador de la Copa Mundial de la FIFA 2006?', '');



-- Insertar preguntas de nivel medio
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 2, '¿Qué equipo italiano ganó la Serie A durante cinco temporadas consecutivas entre 2005 y 2009?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 2, '¿Qué entrenador llevó al FC Barcelona a ganar su primera Liga de Campeones en la década de 2000?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 2, '¿Quién fue el portero titular de la selección italiana en la final del Mundial 2006?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 2, '¿Qué selección ganó la Eurocopa 2004 en una de las mayores sorpresas del fútbol?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 2, '¿Qué jugador fue conocido como "el emperador" durante la década de 2000?', '');

-- Insertar preguntas de nivel difícil
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 3, '¿Qué equipo sudamericano ganó la Copa Libertadores tres veces consecutivas entre 2000 y 2003?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 3, '¿Qué jugador ganó la Bota de Oro como máximo goleador de las ligas europeas en 2003/2004?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 3, '¿Qué equipo inglés descendió de la Premier League en 2003 y volvió a subir en 2007?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 3, '¿Qué selección eliminó a Argentina en los cuartos de final del Mundial de 2006?', '');
insert into Preguntas (IdCategoria, IdDificultad, Enunciado, Foto) values (3, 3, '¿Qué futbolista brasileño fue transferido del Santos al Real Madrid en 2005?', '');






-- Respuestas para la pregunta "¿En qué año ganó Brasil el Mundial de la FIFA en la década de 2000?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (31, 1, '2002', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (31, 2, '2004', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (31, 3, '2006', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (31, 4, '2008', 0, '');

-- Respuestas para la pregunta "¿Qué jugador argentino ganó el Balón de Oro por primera vez en la década de 2000?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (32, 1, 'Lionel Messi', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (32, 2, 'Juan Román Riquelme', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (32, 3, 'Carlos Tévez', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (32, 4, 'Gabriel Batistuta', 0, '');

-- Respuestas para la pregunta "¿Qué equipo ganó la UEFA Champions League en 2005 tras una famosa remontada?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (33, 1, 'Liverpool', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (33, 2, 'AC Milan', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (33, 3, 'Real Madrid', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (33, 4, 'Manchester United', 0, '');

-- Respuestas para la pregunta "¿Qué selección sudamericana ganó la Copa América en 2004?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (34, 1, 'Brasil', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (34, 2, 'Argentina', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (34, 3, 'Uruguay', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (34, 4, 'Colombia', 0, '');

-- Respuestas para la pregunta "¿Quién fue el máximo goleador de la Copa Mundial de la FIFA 2006?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (35, 1, 'Miroslav Klose', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (35, 2, 'Ronaldo', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (35, 3, 'Thierry Henry', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (35, 4, 'David Villa', 0, '');




-- Respuestas para la pregunta "¿Qué equipo italiano ganó la Serie A durante cinco temporadas consecutivas entre 2005 y 2009?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (36, 1, 'Inter de Milán', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (36, 2, 'AC Milan', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (36, 3, 'Juventus', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (36, 4, 'Roma', 0, '');

-- Respuestas para la pregunta "¿Qué entrenador llevó al FC Barcelona a ganar su primera Liga de Campeones en la década de 2000?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (37, 1, 'Frank Rijkaard', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (37, 2, 'Pep Guardiola', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (37, 3, 'Louis van Gaal', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (37, 4, 'Tito Vilanova', 0, '');

-- Respuestas para la pregunta "¿Quién fue el portero titular de la selección italiana en la final del Mundial 2006?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (38, 1, 'Gianluigi Buffon', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (38, 2, 'Francesco Toldo', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (38, 3, 'Angelo Peruzzi', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (38, 4, 'Marco Amelia', 0, '');

-- Respuestas para la pregunta "¿Qué selección ganó la Eurocopa 2004 en una de las mayores sorpresas del fútbol?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (39, 1, 'Grecia', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (39, 2, 'Portugal', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (39, 3, 'Francia', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (39, 4, 'España', 0, '');

-- Respuestas para la pregunta "¿Qué jugador fue conocido como 'el emperador' durante la década de 2000?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (40, 1, 'Adriano', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (40, 2, 'Ronaldinho', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (40, 3, 'Zlatan Ibrahimović', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (40, 4, 'Francesco Totti', 0, '');




-- Respuestas para la pregunta "¿Qué equipo sudamericano ganó la Copa Libertadores tres veces consecutivas entre 2000 y 2003?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (41, 1, 'Boca Juniors', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (41, 2, 'São Paulo', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (41, 3, 'Santos', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (41, 4, 'River Plate', 0, '');

-- Respuestas para la pregunta "¿Qué jugador ganó la Bota de Oro como máximo goleador de las ligas europeas en 2003/2004?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (42, 1, 'Thierry Henry', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (42, 2, 'Diego Forlán', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (42, 3, 'Ruud van Nistelrooy', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (42, 4, 'Andriy Shevchenko', 0, '');

-- Respuestas para la pregunta "¿Qué equipo inglés descendió de la Premier League en 2003 y volvió a subir en 2007?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (43, 1, 'Sunderland', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (43, 2, 'Leeds United', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (43, 3, 'West Ham United', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (43, 4, 'Manchester City', 0, '');

-- Respuestas para la pregunta "¿Qué selección eliminó a Argentina en los cuartos de final del Mundial de 2006?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (44, 1, 'Alemania', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (44, 2, 'Brasil', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (44, 3, 'Italia', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (44, 4, 'Francia', 0, '');

-- Respuestas para la pregunta "¿Qué futbolista brasileño fue transferido del Santos al Real Madrid en 2005?"
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (45, 1, 'Robinho', 1, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (45, 2, 'Kaká', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (45, 3, 'Ronaldinho', 0, '');
insert into Respuestas (IdPregunta, Opcion, Contenido, Correcta, Foto) values (45, 4, 'Ronaldo', 0, '');
