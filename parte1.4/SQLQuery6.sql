USE aeropuerto;
GO

SELECT 
    c.codigo_ciudad,
    c.nombre_ciudad,
    a.codigo_aeropuerto,
    a.nombre_aeropuerto
FROM ciudad c
INNER JOIN aeropuerto a ON c.codigo_ciudad = a.codigo_ciudad;
GO