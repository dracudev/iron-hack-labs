# Entidad/Relación 2

## Instrucciones

Crea el modelo Entidad/Relación para los dos siguientes supuestos:

---

### Plataforma de cursos online

Una plataforma de formación en línea quiere gestionar los cursos que ofrece, los estudiantes que los toman y los profesores que los imparten. Además, se desea registrar la entrega de tareas y sus calificaciones.

- La plataforma ofrece cursos. Cada uno tiene:

  - Título
  - Descripción
  - Categoría
  - Código único

- Un profesor puede impartir varios cursos. Se guarda:

  - ID
  - Nombre
  - Correo
  - Especialidad

- Un estudiante puede inscribirse en varios cursos. Se registra:

  - ID
  - Nombre
  - Apellido
  - Correo
  - Fecha de registro

- Cada curso contiene varias tareas, con:

  - Título
  - Fecha de entrega
  - Puntaje máximo

- Los estudiantes pueden entregar tareas. Por cada entrega se guarda:
  - Fecha de envío
  - Archivo entregado
  - Nota obtenida

<img src="er-diagram-online-courses.svg" alt="Online Courses Diagram" width="600"/>

---

### Sistema de gestión de hospital

Un hospital desea gestionar los datos de sus pacientes, médicos, citas y tratamientos.

- Cada paciente tiene:

  - Número de historia clínica
  - Nombre
  - Fecha de nacimiento
  - Dirección
  - Teléfono

- Los médicos tienen:

  - Número de colegiado
  - Nombre
  - Especialidad
  - Turno (mañana/tarde)

- Los pacientes solicitan citas médicas. Cada cita tiene:

  - Fecha
  - Hora
  - Un médico asignado

- Tras una cita, se puede generar un tratamiento, que incluye:

  - Descripción
  - Medicamentos recetados
  - Duración

- Un médico puede atender muchos pacientes y un paciente puede ser atendido por varios médicos en diferentes citas.

<img src="er-diagram-hospital.svg" alt="Hospital Diagram" width="500"/>
