# Sistema de Gestión de Biblioteca Pública

## Enunciado

Una biblioteca pública desea implementar un sistema para llevar el control de los **libros**, los **socios** que los toman prestados y los **préstamos** realizados. También se desea controlar las **devoluciones** y las posibles **multas por retrasos**.

## Requisitos

### Libros

- La biblioteca tiene muchos libros.
- De cada libro se debe registrar:
  - Código único
  - Título
  - Autor
  - Editorial
  - Año de publicación
  - Categoría (ej: novela, infantil, técnica, etc.)

### Socios

- Los socios están registrados en el sistema.
- De cada socio se guarda:
  - Número de socio (único)
  - Nombre completo
  - Dirección
  - Correo electrónico
  - Fecha de inscripción

### Préstamos

- Un socio puede realizar uno o varios préstamos.
- Cada préstamo implica:
  - Uno o varios libros prestados
  - Fecha del préstamo
  - Fecha límite de devolución

### Devoluciones

- Se registra la **fecha real de devolución** para cada libro prestado.

### Multas

- Si la devolución se realiza fuera de la fecha límite, se genera una multa.
- Cada multa incluye:
  - Monto
  - Descripción
  - Fecha de emisión

## Tarea

Crea el **modelo Entidad/Relación** para este sistema y posteriormente **implementa la base de datos en PhpMyAdmin**.

<img src="er-diagram-library.svg" alt="Library Diagram" width="500"/>
