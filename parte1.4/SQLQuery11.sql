USE aeropuerto;
GO

SELECT 
    c.codigo_ciudad,
    c.nombre_ciudad
FROM ciudad c
WHERE NOT EXISTS (
    SELECT *
    FROM aeropuerto a
    WHERE a.codigo_ciudad = c.codigo_ciudad
);
GO