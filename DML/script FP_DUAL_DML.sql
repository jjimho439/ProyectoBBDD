INSERT INTO empresa (nombre, cif, email, telefono, direccion) VALUES
('Empresa Alpha', 'CIF001X1A', 'contacto@alpha.com', '911223344', 'Calle Falsa 123'),
('Empresa Beta', 'CIF002X2B', 'info@beta.com', '912334455', 'Av. Inventada 45'),
('Empresa Gamma', 'CIF003X3C', 'soporte@gamma.com', '913445566', 'Paseo de los Pruebas 88'),
('Empresa Delta', 'CIF004X4D', 'admin@delta.com', '914556677', 'Ronda Ficticia 56'),
('Empresa Epsilon', 'CIF005X5E', 'contacto@epsilon.com', '915667788', 'Calle Prueba 99'),
('Empresa Zeta', 'CIF006X6F', 'info@zeta.com', '916778899', 'Av. Datos 101');

INSERT INTO sede (id_empresa, localidad, direccion) VALUES
(1, 'Madrid', 'Calle Real 10'),
(2, 'Valencia', 'Av. Central 12'),
(3, 'Barcelona', 'Paseo Lógico 55'),
(4, 'Bilbao', 'Calle Norte 33'),
(5, 'Sevilla', 'Av. Sur 77'),
(6, 'Granada', 'Camino de Relleno 25');

INSERT INTO calendario (nombre, fecha_inicio, fecha_fin) VALUES
('Calendario 2025 A', '2025-01-10', '2025-12-15'),
('Calendario 2025 B', '2025-02-01', '2025-11-30'),
('Calendario 2025 C', '2025-03-05', '2025-12-10'),
('Calendario Extra', '2025-01-01', '2025-12-31');

INSERT INTO jornada (dia_semana, fecha, hora_inicio, hora_fin, id_calendario) VALUES
('Lunes', '2025-01-13', '08:00:00', '16:00:00', 1),
('Martes', '2025-01-20', '09:00:00', '15:00:00', 1),
('Miércoles', '2025-02-05', '10:00:00', '18:00:00', 2),
('Jueves', '2025-03-10', '08:30:00', '14:30:00', 3),
('Viernes', '2025-04-25', '09:00:00', '17:00:00', 4);

INSERT INTO instituto (nombre, email, localidad, direccion) VALUES
('IES Newton', 'newton@ies.com', 'Madrid', 'Calle Ciencia 1'),
('IES Curie', 'curie@ies.com', 'Barcelona', 'Av. Física 2'),
('IES Galileo', 'galileo@ies.com', 'Valencia', 'Ronda Estudio 3'),
('IES Tesla', 'tesla@ies.com', 'Bilbao', 'Plaza Innovación 4'),
('IES Faraday', 'faraday@ies.com', 'Sevilla', 'Calle Voltios 5');

INSERT INTO ciclo_formativo (nombre, nivel) VALUES
('Desarrollo de Aplicaciones Web', 'Grado Superior'),
('Administración de Sistemas', 'Grado Superior'),
('Gestión Administrativa', 'Grado Medio'),
('Marketing y Publicidad', 'Grado Superior');

INSERT INTO oferta_formativa (id_instituto, id_ciclo, annio_implantacion) VALUES
(1, 1, 2020),
(2, 2, 2018),
(3, 3, 2015),
(4, 4, 2021),
(5, 1, 2022);

INSERT INTO curso (nombre, annio_academico, id_instituto, id_ciclo) VALUES
('DAW 1º', 2023, 1, 1),
('ASIR 2º', 2024, 2, 2),
('GA 1º', 2022, 3, 3),
('MARK 2º', 2025, 4, 4),
('DAW 2º', 2024, 5, 1);

INSERT INTO persona (nombre, apellidos, telefono, fecha_nacimiento, dni, direccion) VALUES
('Laura', 'Morales Díaz', '600100100', '2004-04-10', '10000001A', 'Calle Luna 10'),
('Javier', 'Santos Ruiz', '600100101', '2003-11-23', '10000002B', 'Av. Sol 20'),
('Ana', 'García López', '600100102', '2005-01-15', '10000003C', 'Plaza Norte 5'),
('Pedro', 'Martínez Gómez', '600100103', '2002-07-09', '10000004D', 'Calle Sur 7'),
('Marta', 'Jiménez Ortega', '600100104', '2004-09-17', '10000005E', 'Ronda Este 12'),
('Samuel', 'Hernández Vidal', '600100105', '2003-03-05', '10000006F', 'Calle Oeste 4'),
('Isabel', 'Navarro Ferrer', '600100106', '2001-05-22', '10000007G', 'Av. Central 8'),
('Carlos', 'López Molina', '600100107', '2005-06-30', '10000008H', 'Calle Real 3'),
('Lucía', 'Fernández Peña', '600100108', '2002-12-12', '10000009I', 'Camino Largo 1'),
('Alberto', 'Serrano León', '600100109', '2004-10-25', '10000010J', 'Calle Nueva 14'),
('Nerea', 'Ramírez Pardo', '600100110', '1995-04-14', '10000011K', 'Av. Antigua 2'),
('Daniel', 'Torres Bravo', '600100111', '1990-09-03', '10000012L', 'Paseo Rápido 11'),
('Raquel', 'Gil Vargas', '600100112', '1988-12-19', '10000013M', 'Calle Lenta 15'),
('Hugo', 'Reyes Martín', '600100113', '1992-02-28', '10000014N', 'Av. Siempreviva 742'),
('Clara', 'Iglesias Pino', '600100114', '1985-11-06', '10000015O', 'Calle Oculta 9'),
('David', 'Moreno Ríos', '600100115', '1980-03-22', '10000016P', 'Plaza Central 99'),
('Elena', 'Castro Blanco', '600100116', '1987-07-18', '10000017Q', 'Callejón Recto 5'),
('Pablo', 'Ortega Navas', '600100117', '1991-01-01', '10000018R', 'Av. Circular 3'),
('Sandra', 'Vega Romero', '600100118', '1993-06-11', '10000019S', 'Calle Vieja 21'),
('Manuel', 'Suárez Domínguez', '600100119', '1989-08-27', '10000020T', 'Camino Nuevo 6');


INSERT INTO alumno (id_persona, id_curso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

INSERT INTO tutor_docente (id_persona) VALUES
(11),
(12),
(13),
(14),
(15);


INSERT INTO tutor_laboral (id_persona, id_empresa) VALUES
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);

INSERT INTO evaluacion (comentario, nota, id_tutor_laboral) VALUES
('Buen desempeño', 8, 16),
('Excelente actitud', 9, 17),
('Regular asistencia', 6, 18),
('Trabajo en equipo destacado', 9, 19),
('Cumple con los objetivos', 7, 20),
('Liderazgo notable', 10, 16),
('Debe mejorar puntualidad', 5, 20),
('Participación activa', 8, 18),
('Buen nivel técnico', 7, 17),
('Compromiso ejemplar', 9, 17);

-- Insert actividad_formativa con descripción
INSERT INTO actividad_formativa (nota, descripcion, id_evaluacion) VALUES
(7, 'Evaluación de la capacidad de organización y planificación de tareas.', 1),
(8, 'Desempeño en la elaboración de proyectos grupales.', 1),
(9, 'Capacidad para asumir roles de liderazgo en dinámicas de grupo.', 2),
(9, 'Actitud proactiva en la resolución de problemas en equipo.', 2),
(6, 'Asistencia irregular y falta de cumplimiento de plazos.', 3),
(7, 'Participación moderada en debates y exposiciones.', 3),
(9, 'Capacidad para generar soluciones innovadoras en contextos prácticos.', 4),
(8, 'Resolución eficiente de casos prácticos bajo presión.', 4),
(7, 'Cumplimiento de los objetivos académicos a un nivel aceptable.', 5),
(8, 'Demuestra un buen nivel de comprensión de los temas tratados.', 5),
(10, 'Excelente ejecución y adaptación a los diferentes roles asignados.', 6),
(9, 'Desempeño excepcional en pruebas de evaluación práctica.', 6),
(5, 'Puntualidad deficiente y falta de compromiso con las actividades.', 7),
(6, 'Ejecución aceptable de las actividades, pero falta de iniciativa.', 7),
(8, 'Aporte significativo a la colaboración entre compañeros de trabajo.', 8),
(7, 'Buen nivel de conocimiento, aunque requiere mejorar en algunos aspectos.', 8),
(7, 'Trabajo en equipo deficiente, falta de adaptación a las tareas grupales.', 9),
(6, 'Desempeño regular en la ejecución de las actividades asignadas.', 9),
(9, 'Trabajo en equipo sobresaliente con un enfoque profesional y responsable.', 10),
(10, 'Habilidad para aprender rápidamente en entornos dinámicos y cambiantes.', 10);

-- Insert competencia con descripción
INSERT INTO competencia (nota, descripcion, id_actividad) VALUES
(8, 'Evaluación de la capacidad de aplicar conocimientos prácticos en situaciones reales.', 1),
(9, 'Desarrollo de habilidades de comunicación efectiva en grupos de trabajo.', 1),
(9, 'Capacidad para implementar soluciones en entornos técnicos complejos.', 2),
(10, 'Ejemplo de desempeño excepcional en la resolución de problemas de alta dificultad.', 2),
(5, 'Requiere mejorar en la aplicación práctica de conceptos teóricos.', 3),
(6, 'Competencia aceptable en la aplicación de conocimientos, pero con áreas de mejora.', 3),
(7, 'Capacidad para adaptarse a nuevos entornos y requerimientos profesionales.', 4),
(6, 'Bajo rendimiento en tareas prácticas y escasa creatividad en las soluciones propuestas.', 4),
(8, 'Competencia destacada en el análisis y resolución de problemas de forma autónoma.', 5),
(9, 'Trabajo autónomo sobresaliente en situaciones de alta presión laboral.', 5),
(7, 'Dificultad para manejar múltiples tareas simultáneamente.', 6),
(6, 'Buena capacidad de adaptación, aunque puede mejorar en organización de tareas.', 6),
(10, 'Destreza notable en la resolución de casos prácticos complejos con eficacia y rapidez.', 7),
(9, 'Competencia avanzada en el uso de herramientas especializadas en el campo laboral.', 7),
(6, 'Requiere mejorar la resolución rápida de problemas y la toma de decisiones.', 8),
(7, 'Desempeño regular en las tareas asignadas, pero con potencial para crecer.', 8),
(8, 'Gran capacidad para trabajar de manera autónoma y demostrar iniciativa.', 9),
(9, 'Competencia avanzada en la toma de decisiones y ejecución de tareas complejas.', 9),
(9, 'Desempeño sobresaliente en la integración de conocimientos en el entorno laboral.', 10),
(10, 'Capacidad excepcional para aplicar teorías en contextos prácticos y dinámicos.', 10),
(8, 'Desempeño competitivo en la implementación de proyectos interdisciplinarios.', 11),
(7, 'Capacidad limitada para generar soluciones efectivas en tiempos de crisis.', 12),
(9, 'Alta capacidad en el desarrollo de nuevos productos o servicios de alta calidad.', 13),
(8, 'Eficiencia en la ejecución de tareas con gran volumen de trabajo.', 14),
(9, 'Desarrollo sobresaliente en el uso de tecnologías emergentes en el sector profesional.', 15),
(10, 'Actuación destacada en el liderazgo de proyectos complejos e innovadores.', 16),
(7, 'Competencia promedio, pero requiere mayor compromiso en áreas clave.', 17),
(8, 'Capacidad avanzada para analizar y resolver conflictos en entornos laborales.', 18),
(9, 'Habilidades excepcionales en la gestión de proyectos de alta envergadura.', 19),
(10, 'Desempeño sobresaliente y enfoque integral en la mejora continua de procesos.', 20);

INSERT INTO convenio (id_tutor_docente, id_tutor_laboral, fecha_firma) VALUES
(1, 1, '2024-11-10'),
(2, 2, '2024-11-11'),
(3, 3, '2024-11-12'),
(4, 4, '2024-11-13'),
(5, 5, '2024-11-14'),
(1, 2, '2024-11-15'),
(2, 3, '2024-11-16'),
(3, 4, '2024-11-17'),
(4, 5, '2024-11-18'),
(5, 1, '2024-11-19');

INSERT INTO practica (id_alumno, id_evaluacion, id_calendario, id_convenio) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 1, 4),
(5, 5, 2, 5),
(6, 6, 3, 6),
(7, 7, 1, 7),
(8, 8, 2, 8),
(9, 9, 3, 9),
(10, 10, 1, 10);

