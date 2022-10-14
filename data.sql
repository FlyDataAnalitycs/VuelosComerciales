DROP TABLE IF EXISTS vuelos;
CREATE TABLE IF NOT EXISTS vuelos (
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

INSERT INTO vuelos 
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
FROM vuelo2005;

-- Crear tabla de EstadoVuelo
DROP TABLE IF EXISTS EstadoVuelo;
CREATE TABLE IF NOT EXISTS EstadoVuelo (
    ID_EstadoVuelo string,
    EstadoVuelo string
);

-- Insertar en tabla de EstadoVuelo, para A = Aerolinea, B = Clima, C = NAS, D = Seguridad, E = Exitoso, ND = No Disponible
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

-- Crear tabla de DepTime
DROP TABLE IF EXISTS DepTime;
CREATE TABLE IF NOT EXISTS DepTime (
    ID_DepTime string,
    DepTime string
);
-- Insertar en tabla de DepTime, para A = Puntual, B = Retrasado, C = Tardio, ND = No Disponible
INSERT INTO DepTime
SELECT 'A', 'Puntual';
INSERT INTO DepTime
SELECT 'B', 'Retrasado';
INSERT INTO DepTime
SELECT 'C', 'Tardio';
INSERT INTO DepTime
SELECT 'ND', 'No Disponible';

-- Crear tabla de ArrTime
DROP TABLE IF EXISTS ArrTime;
CREATE TABLE IF NOT EXISTS ArrTime (
    ID_ArrTime string,
    ArrTime string
);

-- Insertar en tabla de ArrTime, para A = Puntual, B = Retrasado, C = Tardio, ND = No Disponible
INSERT INTO ArrTime
SELECT 'A', 'Puntual';
INSERT INTO ArrTime
SELECT 'B', 'Retrasado';
INSERT INTO ArrTime
SELECT 'C', 'Tardio';
INSERT INTO ArrTime
SELECT 'ND', 'No Disponible';


