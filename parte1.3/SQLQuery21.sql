USE aeropuerto;
GO

SELECT id, nombre, apellidos
FROM TablaY
WHERE nombre LIKE 'Per%';
GO