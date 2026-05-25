USE aeropuerto;
GO

SELECT 
    v.codigo_vuelo,
    v.hora_salida,
    v.hora_llegada,
    a.nombre_aeropuerto,
    c.nombre_ciudad
FROM vuelo v
INNER JOIN aeropuerto a ON v.codigo_aeropuerto_origen = a.codigo_aeropuerto
INNER JOIN ciudad c ON a.codigo_ciudad = c.codigo_ciudad
WHERE v.codigo_vuelo = 1001;
GO