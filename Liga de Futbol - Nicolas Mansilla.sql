CREATE DATABASE ligax;
USE ligax;

CREATE TABLE entrenador(
id_entrenador INT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL,
apellido VARCHAR (30) NOT NULL,
nacionalidad VARCHAR (30),
edad INT,
experiencia VARCHAR (150)
);

CREATE TABLE dirige (
    ID INT PRIMARY KEY,
    id_entrenador INT NOT NULL,
    id_equipo INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_entrenador) REFERENCES entrenador(id_entrenador),
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);

CREATE TABLE equipo(
id_equipo INT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL,
pais VARCHAR (30),
cantidad_de_jugadores INT,
presupuesto FLOAT
);

CREATE TABLE juega (
    ID INT PRIMARY KEY,
    id_futbolista INT NOT NULL,
    id_equipo INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    FOREIGN KEY (id_futbolista) REFERENCES futbolista(id_futbolista),
    FOREIGN KEY (id_equipo) REFERENCES equipo(id_equipo),
    CHECK (fecha_fin IS NULL OR fecha_fin > fecha_inicio)
);


CREATE TABLE futbolista(
id_futbolista INT PRIMARY KEY,
nombre VARCHAR (30) NOT NULL,
apellido VARCHAR (30) NOT NULL,
nacionalidad VARCHAR (30),
edad INT,
altura FLOAT,
peso FLOAT,
posicion VARCHAR (30),
salario FLOAT
);

CREATE TABLE estadisticas (
    id_estadistica INT PRIMARY KEY, 
    id_futbolista INT, 
    id_partido INT, 
    goles INT, 
    asistencias INT, 
    tarjetas_amarillas INT, 
    tarjetas_rojas INT, 
    minutos_jugados INT, 
    CONSTRAINT FK_id_futbolista FOREIGN KEY (id_futbolista) REFERENCES futbolista(id_futbolista),
    CONSTRAINT FK_id_partido FOREIGN KEY (id_partido) REFERENCES partido(id_partido)
);

CREATE TABLE partido (
    id_partido INT PRIMARY KEY, 
    fecha DATE NOT NULL, 
    estadio VARCHAR(30), 
    equipo_local INT, 
    equipo_visitante INT, 
    goles_local INT, 
    goles_visitante INT, 
    FOREIGN KEY (equipo_local) REFERENCES equipo(id_equipo), 
    FOREIGN KEY (equipo_visitante) REFERENCES equipo(id_equipo) 
);
