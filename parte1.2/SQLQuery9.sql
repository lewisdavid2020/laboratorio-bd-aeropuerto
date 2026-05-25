USE aeropuerto;
GO

SELECT CONCAT(DAY(fecha), '@', MONTH(fecha), '@', YEAR(fecha)) AS FECHA_RARA
FROM TablaY;
GO