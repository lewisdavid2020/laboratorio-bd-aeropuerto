USE aeropuerto;
GO

SELECT 
    a.codigo_aeropuerto,
    a.nombre_aeropuerto,
    a.codigo_ciudad
FROM aeropuerto a
LEFT JOIN ciudad c ON a.codigo_ciudad = c.codigo_ciudad
WHERE c.codigo_ciudad IS NULL;
GO