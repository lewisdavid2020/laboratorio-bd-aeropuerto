USE aeropuerto;
GO

SELECT 
    c.codigo_ciudad,
    c.nombre_ciudad
FROM ciudad c
LEFT JOIN aeropuerto a
ON c.codigo_ciudad = a.codigo_ciudad
WHERE a.codigo_ciudad IS NULL;
GO