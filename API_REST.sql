-- Mostrar el porcentaje de vuelos que han salido antes de los 15 minutos de la hora de salida programada
SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la salida'
FROM vuelo
WHERE (Hora_SalidaR - Hora_SalidaP) <= 15;

-- Mostrar el porcentaje de vuelos que han llegado antes de los 15 minutos de la hora de llegada programada
SELECT COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Puntuales en la llegada'
FROM vuelo
WHERE (Hora_LlegadaR - Hora_LlegadaP) <= 15;



-- Mostrar el promedio de espera al llegar, agrupado por Aeropuerto
SELECT a.Aeropuerto, AVG(v.Hora_LlegadaR - v.Hora_LlegadaP) AS 'Promedio Espera D'
FROM vuelo as v
JOIN aeropuertos_d as a
ON v.ID_Aeropuerto_D = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY 'Promedio Espera D' DESC
LIMIT 10;

-- Mostrar el promedio de espera al llegar, agrupado por Aeropuerto
SELECT a.Aeropuerto, AVG(v.Hora_SalidaR - v.Hora_SalidaP) AS 'Promedio Espera O'
FROM vuelo as v
JOIN aeropuertos_o as a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY 'Promedio Espera O' DESC
LIMIT 10;

-- Eliminar filas de vuelo con Hora_SalidaR y Hora_LlegadaR = 0
DELETE FROM vuelo
WHERE Hora_SalidaR = 0 AND Hora_LlegadaR = 0;



-- Mostrar la regularidad por aeropuerto de salida
SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aropuertos O'
FROM vuelo as v
JOIN aeropuertos_o as a
ON v.ID_Aeropuerto_O = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Mostrar la regularidad por aeropuerto de llegada
SELECT a.Aeropuerto, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aeropuertos D'
FROM vuelo as v
JOIN aeropuertos_d as a
ON v.ID_Aeropuerto_D = a.ID_Aeropuerto
GROUP BY a.ID_Aeropuerto
ORDER BY COUNT(*) DESC
LIMIT 10;



-- Mostrar el procentaje de dominio de mercado por aerolinea
SELECT a.Aerolinea, COUNT(*)*100/(SELECT COUNT(*) FROM vuelo) AS 'Porcentaje de aerolinea'
FROM vuelo as v
JOIN aerolinea as a
ON v.ID_Aerolinea = a.ID_Aerolinea
GROUP BY v.ID_Aerolinea
ORDER BY COUNT(*) DESC
LIMIT 10;



