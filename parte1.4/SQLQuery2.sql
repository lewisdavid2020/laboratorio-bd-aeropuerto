USE aeropuerto;
GO

SELECT 
    a.codigo_aeropuerto,
    a.nombre_aeropuerto,
    a.codigo_ciudad,
    c.nombre_ciudad
FROM aeropuerto a
INNER JOIN ciudad c ON a.codigo_ciudad = c.codigo_ciudad;
GO