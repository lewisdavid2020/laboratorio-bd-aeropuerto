USE aeropuerto;
GO

SELECT id, nombre, apellidos
FROM TablaY
WHERE nombre LIKE '%ez';
GO