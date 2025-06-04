# Taller Mecánico - Modelo Entidad/Relación y Consultas SQL

## Instrucciones

Un taller mecánico desea gestionar los vehículos de sus clientes, los servicios realizados, los mecánicos que los atienden y los repuestos utilizados en cada servicio.

---

## Requisitos del sistema

### Entidades

- **Cliente**: nombre, correo, teléfono  
  > Cada cliente puede registrar varios vehículos en el taller.

- **Vehículo**: marca, modelo, año, patente  
  > Cada vehículo pertenece a un cliente.

- **Servicio**: fecha, detalle, costo_total  
  > Cada servicio se realiza a un vehículo. Un vehículo puede recibir varios servicios a lo largo del tiempo.

- **Mecánico**: nombre, especialidad  
  > Un servicio puede ser realizado por uno o varios mecánicos.

- **Repuesto**: nombre, marca, precio_unitario  
  > En cada servicio se pueden usar varios repuestos, registrando cuántas unidades se usaron.

### Relaciones

- Registrar la **cantidad utilizada** de cada repuesto en cada servicio.

---

## Tareas

### 1. Diseña el modelo Entidad/Relación (E/R)

Representa gráficamente con entidades, relaciones y atributos todas las entidades y relaciones del sistema, considerando:
- Clientes y vehículos
- Vehículos y servicios
- Servicios y mecánicos
- Servicios y repuestos usados

---

### 2. Implementa la base de datos en PhpMyAdmin

- Crea las tablas correspondientes
- Define claves primarias y foráneas
- Inserta al menos **3 datos de ejemplo** en cada tabla

---

### 3. Realiza las siguientes consultas SQL

1. **Lista los vehículos con sus datos y el nombre de su cliente.**

2. **Muestra todos los servicios realizados a un vehículo específico (por patente).**

3. **Obtén el total gastado por cada cliente en servicios.**

4. **Muestra los servicios donde se hayan usado más de 3 repuestos distintos.**

5. **Lista todos los mecánicos que han trabajado en servicios realizados en 2024.**

6. **Calcula el costo total de repuestos utilizados en un servicio determinado.**

7. **Muestra todos los repuestos utilizados en más de 5 servicios distintos.**

8. **Lista los vehículos que no han recibido ningún servicio aún.**

9. **Muestra los clientes que tienen más de un vehículo registrado.**

10. **Muestra la cantidad total de repuestos usados por cada mecánico**  
    (considerando todos los servicios en los que participó).

---
