DROP TABLE IF EXISTS vuelo;
CREATE TABLE IF NOT EXISTS vuelo (
    Anio int,
    Mes int,
    Dia int,
    Dia_Sem int,
    ID_Aerolinea string,
    ID_Aeropuerto_O string,
    ID_Aeropuerto_D string,
    Hora_SalidaR double,
    Hora_SalidaP int,
    Hora_LlegadaR double,
    Hora_LlegadaP int,
    Duracion_Promedio double,
    Distancia int,
    ID_EstadoVuelo string,
    ID_DepTime string,
    ID_ArrTime string,
);

CREATE TABLE `data_flight`.`vuelo2016` (
	`Anio` SMALLINT NOT NULL,
	`Mes` TINYINT NOT NULL,
	`Dia` TINYINT NOT NULL,
	`Dia_Sem` TINYINT NULL,
	`ID_Aerolinea` VARCHAR(10) NOT NULL,
	`ID_Aeropuerto_O` VARCHAR(10) NOT NULL,
	`ID_Aeropuerto_D` VARCHAR(10) NOT NULL,
	`Hora_SalidaR` SMALLINT NULL,
	`Hora_SalidaP` SMALLINT NOT NULL,
	`Hora_LlegadaR` SMALLINT NULL,
	`Hora_LlegadaP` SMALLINT NOT NULL,
	`Duracion_Promedio` DECIMAL(20,6) NULL,
	`Distancia` DECIMAL(20,6) NOT NULL,
	`ID_EstadoVuelo` VARCHAR(10) NOT NULL,
	`ID_DepTime` VARCHAR(10) NOT NULL,
	`ID_ArrTime` VARCHAR(10) NOT NULL
)

INSERT INTO vuelo 
SELECT 
    Anio,
    Mes,
    Dia,
    Dia_Sem,
    ID_Aerolinea,
    ID_Aeropuerto_O,
    ID_Aeropuerto_D,
    Hora_SalidaR,
    Hora_SalidaP,
    Hora_LlegadaR,
    Hora_LlegadaP,
    Duracion_Promedio,
    Distancia,
    ID_EstadoVuelo,
    ID_DepTime,
    ID_ArrTime
FROM vuelo2014;

INSERT INTO vuelo 
SELECT 
    Anio,
    Mes,
    Dia,
    Dia_Sem,
    ID_Aerolinea,
    ID_Aeropuerto_O,
    ID_Aeropuerto_D,
    Hora_SalidaR,
    Hora_SalidaP,
    Hora_LlegadaR,
    Hora_LlegadaP,
    Duracion_Promedio,
    Distancia,
    ID_EstadoVuelo,
    ID_DepTime,
    ID_ArrTime
FROM vuelo2015;

INSERT INTO vuelo 
SELECT 
    Anio,
    Mes,
    Dia,
    Dia_Sem,
    ID_Aerolinea,
    ID_Aeropuerto_O,
    ID_Aeropuerto_D,
    Hora_SalidaR,
    Hora_SalidaP,
    Hora_LlegadaR,
    Hora_LlegadaP,
    Duracion_Promedio,
    Distancia,
    ID_EstadoVuelo,
    ID_DepTime,
    ID_ArrTime
FROM vuelo2016;

INSERT INTO vuelo 
SELECT 
    Anio,
    Mes,
    Dia,
    Dia_Sem,
    ID_Aerolinea,
    ID_Aeropuerto_O,
    ID_Aeropuerto_D,
    Hora_SalidaR,
    Hora_SalidaP,
    Hora_LlegadaR,
    Hora_LlegadaP,
    Duracion_Promedio,
    Distancia,
    ID_EstadoVuelo,
    ID_DepTime,
    ID_ArrTime
FROM vuelo2017;

INSERT INTO vuelo 
SELECT 
    Anio,
    Mes,
    Dia,
    Dia_Sem,
    ID_Aerolinea,
    ID_Aeropuerto_O,
    ID_Aeropuerto_D,
    Hora_SalidaR,
    Hora_SalidaP,
    Hora_LlegadaR,
    Hora_LlegadaP,
    Duracion_Promedio,
    Distancia,
    ID_EstadoVuelo,
    ID_DepTime,
    ID_ArrTime
FROM vuelo2018;

-- Creando tabla de EstadoVuelo
DROP TABLE IF EXISTS EstadoVuelo;
CREATE TABLE IF NOT EXISTS EstadoVuelo (
    ID_EstadoVuelo string,
    EstadoVuelo string
);

-- Insertando en tabla de EstadoVuelo, para A = Aerolinea, B = Clima, C = NAS, D = Seguridad, E = Exitoso, ND = No Disponible
INSERT INTO EstadoVuelo
SELECT 'A', 'Aerolinea';
INSERT INTO EstadoVuelo
SELECT 'B', 'Clima';
INSERT INTO EstadoVuelo
SELECT 'C', 'NAS';
INSERT INTO EstadoVuelo
SELECT 'D', 'Seguridad';
INSERT INTO EstadoVuelo
SELECT 'E', 'Exitoso';
INSERT INTO EstadoVuelo
SELECT 'ND', 'No Disponible';

-- Creando tabla de DepTime
DROP TABLE IF EXISTS DepTime;
CREATE TABLE IF NOT EXISTS DepTime (
    ID_DepTime string,
    DepTime string
);
-- Insertando en tabla de DepTime, para A = Adelantado, B = A Tiempo, C = Retrasado, ND = No Disponible
INSERT INTO DepTime
SELECT 'A', 'Adelantado';
INSERT INTO DepTime
SELECT 'B', 'A Tiempo';
INSERT INTO DepTime
SELECT 'C', 'Retrasado';
INSERT INTO DepTime
SELECT 'ND', 'No Disponible';

-- Creando tabla de ArrTime
DROP TABLE IF EXISTS ArrTime;
CREATE TABLE IF NOT EXISTS ArrTime (
    ID_ArrTime string,
    ArrTime string
);

-- Insertando en tabla de ArrTime, para A = Adelantado, B = A Tiempo, C = Retrasado, ND = No Disponible
INSERT INTO ArrTime
SELECT 'A', 'Adelantado';
INSERT INTO ArrTime
SELECT 'B', 'A Tiempo';
INSERT INTO ArrTime
SELECT 'C', 'Retrasado';
INSERT INTO ArrTime
SELECT 'ND', 'No Disponible';

-- Creando tabla de aeropuertos
CREATE TABLE `data_flight`.`aeropuertos` (
	`ID_Aeropuerto` VARCHAR(10) NOT NULL,
	`Aeropuerto` VARCHAR(50) NOT NULL,
	`Ciudad` VARCHAR(40) NULL,
	`Estado` VARCHAR(10) NULL,
	`Latitud` DECIMAL(20,6) NOT NULL,
	`Longitud` DECIMAL(20,6) NOT NULL
)

-- Creando las llaves primarias
ALTER TABLE aeropuerto_o ADD PRIMARY KEY (ID_Aeropuerto);
ALTER TABLE aeropuerto_d ADD PRIMARY KEY (ID_Aeropuerto);
ALTER TABLE aerolinea ADD PRIMARY KEY (ID_Aerolinea);
ALTER TABLE estadoVuelo ADD PRIMARY KEY (ID_EstadoVuelo);
ALTER TABLE deptime ADD PRIMARY KEY (ID_DepTime);
ALTER TABLE arrtime ADD PRIMARY KEY (ID_ArrTime);


-- Creando una columna con numeros naturales y convertirlo en clave primaria
SET @a = 0;
ALTER TABLE vuelo ADD COLUMN ID_Vuelo int;
UPDATE vuelo SET ID_Vuelo=@a:=@a+1;
ALTER TABLE vuelo ADD PRIMARY KEY (ID_Vuelo);

-- Creando los indices
ALTER TABLE vuelo ADD INDEX (ID_Aerolinea);
ALTER TABLE vuelo ADD INDEX (ID_Aeropuerto_O);
ALTER TABLE vuelo ADD INDEX (ID_Aeropuerto_D);
ALTER TABLE vuelo ADD INDEX (ID_EstadoVuelo);
ALTER TABLE vuelo ADD INDEX (ID_DepTime);
ALTER TABLE vuelo ADD INDEX (ID_ArrTime);

-- Creando las relaciones de constraint
ALTER TABLE vuelo ADD CONSTRAINT FK_Aerolinea FOREIGN KEY (ID_Aerolinea) REFERENCES Aerolinea(ID_Aerolinea);
ALTER TABLE vuelo ADD CONSTRAINT FK_EstadoVuelo FOREIGN KEY (ID_EstadoVuelo) REFERENCES EstadoVuelo(ID_EstadoVuelo);
ALTER TABLE vuelo ADD CONSTRAINT FK_DepTime FOREIGN KEY (ID_DepTime) REFERENCES DepTime(ID_DepTime);
ALTER TABLE vuelo ADD CONSTRAINT FK_ArrTime FOREIGN KEY (ID_ArrTime) REFERENCES ArrTime(ID_ArrTime);

ALTER TABLE vuelo ADD CONSTRAINT FK_Aeropuerto_O FOREIGN KEY (ID_Aeropuerto_O) REFERENCES aeropuerto_o(ID_Aeropuerto);
ALTER TABLE vuelo ADD CONSTRAINT FK_Aeropuerto_D FOREIGN KEY (ID_Aeropuerto_D) REFERENCES aeropuerto_d(ID_Aeropuerto);


-- Exportando los valores unicos de Id las tablas a archivos csv
SELECT DISTINCT ID_Aeropuerto_D 
INTO OUTFILE 'F:/PROYECTO_GRUPAL/extracciones/aeropuertosD.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '
'
FROM vuelo;

SELECT DISTINCT ID_Aeropuerto_O 
INTO OUTFILE 'F:/PROYECTO_GRUPAL/extracciones/aeropuertosO.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '
'
FROM vuelo;



-- Exportando los datos de ID_Vuelo, ID_Aeropuerto_O, Hora_SalidaR, Latitud y Longitud para ID_EstadoVuelo = 'B'
SELECT v.Anio, v.Mes, v.Dia, v.ID_Vuelo, v.ID_Aeropuerto_O, v.Hora_SalidaR, a.Latitud, a.Longitud
INTO OUTFILE 'F:/PROYECTO_GRUPAL/extracciones/vueloSB.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '
'
FROM vuelo as v
JOIN aeropuerto_o as a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
WHERE v.ID_EstadoVuelo = 'B';



-- Exportando datos 
SELECT v.Anio, v.Mes, v.Dia, v.ID_Vuelo, v.ID_Aeropuerto_O, v.Hora_SalidaR, a.Latitud, a.Longitud
INTO OUTFILE 'F:/PROYECTO_GRUPAL/extracciones/vueloSA.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '
'
FROM vuelo as v
JOIN aeropuerto_o as a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
WHERE v.ID_DepTime = 'A' and v.Anio = 2018;



-- TRABAJO DE HEROKU

-- Exportando datos de la tabla vuelo para el año 2018
SELECT * 
INTO OUTFILE 'F:/PROYECTO_GRUPAL/DATA_2018/vuelo.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '
'
FROM vuelo
WHERE Anio = 2018;











































