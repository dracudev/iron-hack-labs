-- 1. Lista los vehículos con sus datos y el nombre de su cliente.
SELECT Vehiculo.marca, Vehiculo.modelo, Vehiculo.anio, Vehiculo.patente, Cliente.nombre
FROM Vehiculo
JOIN Cliente ON Vehiculo.cliente_id = Cliente.id;

-- 2. Muestra todos los servicios realizados a un vehículo específico (por patente).
SELECT Servicio.fecha, Servicio.detalle, Servicio.costo_total
FROM Servicio
JOIN Vehiculo ON Servicio.vehiculo_id = Vehiculo.id
WHERE Vehiculo.patente = 'ABC123';

-- 3. Obtén el total gastado por cada cliente en servicios.
SELECT Cliente.nombre, SUM(Servicio.costo_total) AS total_gastado
FROM Cliente
JOIN Vehiculo ON Cliente.id = Vehiculo.cliente_id
JOIN Servicio ON Vehiculo.id = Servicio.vehiculo_id
GROUP BY Cliente.id;

-- 4. Muestra los servicios donde se hayan usado más de 3 repuestos distintos.
SELECT Servicio.id, Servicio.fecha
FROM Servicio
JOIN Servicio_Repuesto ON Servicio.id = Servicio_Repuesto.servicio_id
GROUP BY Servicio.id
HAVING COUNT(Servicio_Repuesto.repuesto_id) > 3;

-- 5. Lista todos los mecánicos que han trabajado en servicios realizados en 2024.
SELECT DISTINCT Mecanico.nombre
FROM Mecanico
JOIN Servicio_Mecanico ON Mecanico.id = Servicio_Mecanico.mecanico_id
JOIN Servicio ON Servicio.id = Servicio_Mecanico.servicio_id
WHERE Servicio.fecha >= '2024-01-01' AND Servicio.fecha <= '2024-12-31';

-- 6. Calcula el costo total de repuestos utilizados en un servicio determinado.
SELECT SUM(Repuesto.precio_unitario * Servicio_Repuesto.cantidad_utilizada) AS costo_total_repuestos
FROM Servicio_Repuesto
JOIN Repuesto ON Servicio_Repuesto.repuesto_id = Repuesto.id
WHERE Servicio_Repuesto.servicio_id = 1;

-- 7. Muestra todos los repuestos utilizados en más de 5 servicios distintos.
SELECT Repuesto.nombre
FROM Repuesto
JOIN Servicio_Repuesto ON Repuesto.id = Servicio_Repuesto.repuesto_id
GROUP BY Repuesto.id
HAVING COUNT(DISTINCT Servicio_Repuesto.servicio_id) > 5;

-- 8. Lista los vehículos que no han recibido ningún servicio aún.
SELECT Vehiculo.marca, Vehiculo.modelo, Vehiculo.patente
FROM Vehiculo
LEFT JOIN Servicio ON Vehiculo.id = Servicio.vehiculo_id
WHERE Servicio.id IS NULL;

-- 9. Muestra los clientes que tienen más de un vehículo registrado.
SELECT Cliente.nombre
FROM Cliente
JOIN Vehiculo ON Cliente.id = Vehiculo.cliente_id
GROUP BY Cliente.id
HAVING COUNT(Vehiculo.id) > 1;

-- 10. Muestra la cantidad total de repuestos usados por cada mecánico
SELECT Mecanico.nombre, SUM(Servicio_Repuesto.cantidad_utilizada) AS total_repuestos
FROM Mecanico
JOIN Servicio_Mecanico ON Mecanico.id = Servicio_Mecanico.mecanico_id
JOIN Servicio_Repuesto ON Servicio_Mecanico.servicio_id = Servicio_Repuesto.servicio_id
GROUP BY Mecanico.id;
