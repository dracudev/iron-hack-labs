-- 1. Mostrar todos los libros de la categoría 'Infantil', ordenados por título
SELECT titulo, categoria
FROM Libro
WHERE categoria = 'Infantil'
ORDER BY titulo;

-- 2. Mostrar los socios que se inscribieron en el año 2023
SELECT nombre_completo, fecha_inscripcion
FROM Socio
WHERE fecha_inscripcion >= '2023-01-01' AND fecha_inscripcion <= '2023-12-31';

-- 3. Mostrar los títulos de libros que han sido prestados alguna vez
SELECT titulo
FROM Libro
WHERE codigo IN (
  SELECT libro_codigo
  FROM Prestamo_Libro
);

-- 4. Mostrar el nombre del socio y el título del libro que fue devuelto más recientemente
SELECT Socio.nombre_completo, Libro.titulo, Prestamo_Libro.fecha_devolucion_real
FROM Socio, Prestamo, Prestamo_Libro, Libro
WHERE Socio.numero_socio = Prestamo.socio_id
  AND Prestamo.id = Prestamo_Libro.prestamo_id
  AND Libro.codigo = Prestamo_Libro.libro_codigo
  AND Prestamo_Libro.fecha_devolucion_real = (
    SELECT MAX(fecha_devolucion_real)
    FROM Prestamo_Libro
    WHERE fecha_devolucion_real IS NOT NULL
  );

-- 5. Mostrar los socios que tienen libros sin devolver
SELECT DISTINCT Socio.nombre_completo
FROM Socio, Prestamo, Prestamo_Libro
WHERE Socio.numero_socio = Prestamo.socio_id
  AND Prestamo.id = Prestamo_Libro.prestamo_id
  AND Prestamo_Libro.fecha_devolucion_real IS NULL;

-- 6. Contar cuántos préstamos hay por cada categoría de libro
SELECT categoria, (
  SELECT COUNT(*)
  FROM Prestamo_Libro
  WHERE Prestamo_Libro.libro_codigo = Libro.codigo
) AS cantidad_prestamos
FROM Libro;

-- 7. Mostrar los préstamos vencidos (no devueltos y fecha límite pasada)
SELECT Prestamo.id, Prestamo.fecha_limite
FROM Prestamo, Prestamo_Libro
WHERE Prestamo.id = Prestamo_Libro.prestamo_id
  AND Prestamo.fecha_limite < CURDATE()
  AND Prestamo_Libro.fecha_devolucion_real IS NULL;

-- 8. Calcular el total de multas acumuladas por cada socio
SELECT Socio.nombre_completo, (
  SELECT SUM(Multa.monto)
  FROM Multa, Prestamo
  WHERE Multa.prestamo_id = Prestamo.id
    AND Prestamo.socio_id = Socio.numero_socio
) AS total_multas
FROM Socio;

-- 9. Mostrar los títulos de libros con más de 5 préstamos
SELECT titulo
FROM Libro
WHERE (
  SELECT COUNT(*)
  FROM Prestamo_Libro
  WHERE Prestamo_Libro.libro_codigo = Libro.codigo
) > 5;

-- 10. Mostrar los socios con alguna multa mayor a 10€ y la descripción
SELECT Socio.nombre_completo, Multa.monto, Multa.descripcion
FROM Socio, Prestamo, Multa
WHERE Socio.numero_socio = Prestamo.socio_id
  AND Prestamo.id = Multa.prestamo_id
  AND Multa.monto > 10;
