USE aeropuerto;
GO

SELECT 
    UPPER(nombre) AS EN_MAYUSCULA,
    LOWER(apellidos) AS EN_MINUSCULA
FROM TablaY;
GO