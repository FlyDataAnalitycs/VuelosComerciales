-- Mostrando el porcentaje de vuelos que han salido antes de los 15 minutos de la hora de salida programada
SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la salida'
FROM vuelo
WHERE (Hora_SalidaR - Hora_SalidaP) <= 15;


-- Mostrando el porcentaje de vuelos que han llegado antes de los 15 minutos de la hora de llegada programada
SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la llegada'
FROM vuelo
WHERE (Hora_LlegadaR - Hora_LlegadaP) <= 15;


-- Los aeropuertos con mayores tiempos de retraso en la salida
SELECT a.Aeropuerto, AVG(v.Hora_SalidaR - v.Hora_SalidaP) AS 'Retraso'
FROM vuelo AS v
JOIN aeropuerto_o AS a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
WHERE v.ID_EstadoVuelo = 'E'
GROUP BY v.ID_Aeropuerto_O
ORDER BY Retraso DESC
LIMIT 10
OFFSET 5;


-- Los aeropuertos con menores tiempos de retraso en la partida
SELECT a.Aeropuerto, AVG(v.Hora_SalidaR - v.Hora_SalidaP) AS 'Retraso'
FROM vuelo AS v
JOIN aeropuerto_o AS a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
WHERE v.ID_EstadoVuelo = 'E'
GROUP BY v.ID_Aeropuerto_O
ORDER BY Retraso ASC
LIMIT 10
OFFSET 5;


-- Mostrando la regularidad por aeropuerto de salida
SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aeropuertos O'
FROM vuelo as v
JOIN aeropuerto_o as a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY COUNT(*) DESC
LIMIT 10;


-- Mostrando la regularidad por aeropuerto de llegada
SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aeropuertos D'
FROM vuelo as v
JOIN aeropuerto_d as a
ON v.ID_Aeropuerto_D = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY COUNT(*) DESC
LIMIT 10;


-- Mostrando el procentaje de dominio de mercado por aerolinea
SELECT a.Aerolinea, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aerolinea'
FROM vuelo as v
JOIN aerolinea as a
ON v.ID_Aerolinea = a.ID_Aerolinea
GROUP BY v.ID_Aerolinea
ORDER BY COUNT(*) DESC
LIMIT 10;


-- Mostrando el porcentaje de vuelos por dia
SELECT DAYNAME(Fecha) AS 'Dia', COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de vuelos'
FROM vuelo
GROUP BY DAYNAME(Fecha)
ORDER BY COUNT(*) DESC;


-- Mostrando el porcentaje de vuelos por mes
SELECT MONTHNAME(Fecha) AS 'Mes', COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de vuelos'
FROM vuelo
GROUP BY MONTHNAME(Fecha)
ORDER BY COUNT(*) DESC;




