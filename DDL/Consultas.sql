-- Muestra el nombre del tutor laboral con mayor número de observaciones puestas. Debe aparecer también el número de observaciones
SELECT tl.id_persona AS tutor_laboral, COUNT(e.id) AS num_observaciones
	FROM tutor_laboral tl
	JOIN evaluacion e ON tl.id_persona = e.id_tutor_laboral
	GROUP BY tl.id_persona
	ORDER BY num_observaciones DESC
	LIMIT 1;

-- Cuenta el número de convenios que tienen más de dos alumnos asociados
SELECT COUNT(DISTINCT p.id_convenio)
	FROM practica p
	GROUP BY p.id_convenio
	HAVING COUNT(DISTINCT p.id_alumno) >= 2;

-- Muestra el número de alumnos asociados a cada empresa
SELECT e.nombre AS empresa, COUNT(DISTINCT p.id_alumno) AS num_alumnos
	FROM empresa e
	JOIN tutor_laboral tl ON e.id = tl.id_empresa
	JOIN practica p ON tl.id_persona = p.id_convenio
	GROUP BY e.nombre;

-- Muestra la información completa de los convenios: Nombre del convenio, nombre del alumno, nombre de los tutores laborales y docentes, fecha de inicio y fin y si está o no firmado.
SELECT c.id AS convenio_id, a.nombre AS nombre_alumno, 
       td.nombre AS nombre_tutor_docente, tl.nombre AS nombre_tutor_laboral, 
       c.fecha_firma, cal.fecha_inicio, cal.fecha_fin, c.fecha_firma IS NOT NULL AS firmado
	FROM convenio c
	JOIN tutor_docente td ON c.id_tutor_docente = td.id_persona
	JOIN tutor_laboral tl ON c.id_tutor_laboral = tl.id_persona
	JOIN practica p ON c.id = p.id_convenio
	JOIN alumno a ON p.id_alumno = a.id_persona
	JOIN calendario cal ON p.id_calendario = cal.id
	ORDER BY convenio_id;

-- Muestra para cada alumno su nombre y sus observaciones de seguimiento
SELECT a.nombre AS nombre_alumno, e.comentario AS observacion
	FROM alumno a
	JOIN practica p ON a.id_persona = p.id_alumno
	JOIN evaluacion e ON p.id_evaluacion = e.id
	ORDER BY a.nombre;

-- Muestra la nota media de cada actividad formativa de los alumnos del curso 24/25 que han realizado sus prácticas en Sedes de Sevilla.
SELECT af.descripcion AS actividad_formativa, AVG(af.nota) AS nota_media
	FROM actividad_formativa af
	JOIN evaluacion e ON af.id_evaluacion = e.id
	JOIN practica p ON e.id = p.id_evaluacion
	JOIN alumno a ON p.id_alumno = a.id_persona
	JOIN curso c ON a.id_curso = c.id
	JOIN sede s ON c.id_instituto = s.id_empresa
	WHERE c.annio_academico = '24/25' AND s.localidad = 'Sevilla'
	GROUP BY af.descripcion;
-- Cuenta el número de concreciones por cada actividad formativa que existe en el sistema
SELECT af.descripcion AS actividad_formativa, COUNT(c.id) AS num_concreciones
	FROM actividad_formativa af
	JOIN competencia c ON af.id = c.id_actividad
	GROUP BY af.descripcion;

-- Muestra el listado de alumnos que no tienen convenio de colaboración.
SELECT a.nombre
	FROM alumno a
	LEFT JOIN practica p ON a.id_persona = p.id_alumno
	WHERE p.id_convenio IS NULL;

-- Muestra para los convenios firmados el número de alumnos que tienen asociados.
SELECT c.id AS convenio_id, COUNT(DISTINCT p.id_alumno) AS num_alumnos
	FROM convenio c
	JOIN practica p ON c.id = p.id_convenio
	WHERE c.fecha_firma IS NOT NULL
	GROUP BY c.id;

-- Muestra la información de los calendarios del convenio 1.
SELECT cal.*
	FROM calendario cal
	JOIN practica p ON cal.id = p.id_calendario
	WHERE p.id_convenio = 1;
