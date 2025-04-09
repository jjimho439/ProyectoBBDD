-- Muestra el nombre del tutor laboral con mayor número de observaciones puestas. Debe aparecer también el número de observaciones
select tl.id_persona AS tutor_laboral, count(e.id) as num_observaciones
from tutor_laboral tl
	join evaluacion e ON tl.id_persona = e.id_tutor_laboral
group by tl.id_persona
order by num_observaciones desc
limit 1;

-- Cuenta el número de convenios que tienen más de dos alumnos asociados
select count(*) AS conteo
from (
    select id_convenio
    from practica
    group by id_convenio
    having count(id_alumno) >= 2
)as subconsulta;

-- Muestra el número de alumnos asociados a cada empresa
select e.nombre as empresa, count(distinct p.id_alumno) as num_alumnos
from empresa e
	join tutor_laboral tl on e.id = tl.id_empresa
    join convenio c on c.id_tutor_laboral = tl.id_persona
	join practica p on c.id = p.id_convenio
group by e.nombre;

-- Muestra la información completa de los convenios: Id del convenio, nombre del alumno, nombre de los tutores laborales y docentes, fecha de inicio y fin y si está o no firmado.
select c.id as id_convenio, pn.nombre as nombre_alumno, pl.nombre as nombre_tutor_laboral, pd.nombre as nombre_tutor_dicente, cal.fecha_inicio, cal.fecha_fin, if(c.fecha_firma is not null, 'Firmado', 'No Firmado') as Firma
from convenio c
	join practica p on c.id = p.id_convenio
	join alumno a on a.id_persona = p.id_alumno
	join persona pn on a.id_persona = pn.id
	join tutor_laboral tl on c.id_tutor_laboral = tl.id_persona
	join persona pl on tl.id_persona = pl.id
	join tutor_docente td on c.id_tutor_docente = td.id_persona
	join persona pd on td.id_persona = pd.id
	join calendario cal on p.id_calendario = cal.id
order by id_convenio;

-- Muestra para cada alumno su nombre y sus observaciones de seguimiento
select pn.nombre as nombre_alumno, e.comentario as observacion
from persona pn
    join alumno a on pn.id = a.id_persona
	join practica p on a.id_persona = p.id_alumno
	join evaluacion e on p.id_evaluacion = e.id
order by pn.nombre;

-- Muestra la nota media de cada actividad formativa de los alumnos del curso 24/25 que han realizado sus prácticas en Sedes de Sevilla.
select af.descripcion as actividad_formativa, avg(af.nota) as nota_media
from actividad_formativa af
	join evaluacion e on af.id_evaluacion = e.id
	join practica p on e.id = p.id_evaluacion
	join alumno a on p.id_alumno = a.id_persona
	join curso c on a.id_curso = c.id
    join tutor_laboral tl on e.id_tutor_laboral = tl.id_persona
    join empresa emp on tl.id_empresa = emp.id
    join sede s on s.id_empresa = emp.id
where c.annio_academico = '2024/2025' and s.localidad = 'Sevilla'
group by af.descripcion;
    
-- Cuenta el número de concreciones por cada actividad formativa que existe en el sistema
select af.descripcion as actividad_formativa, count(c.id) as competencias
from actividad_formativa af
	join competencia c on af.id = c.id_actividad
group by af.descripcion;

-- Muestra el listado de alumnos que no tienen convenio de colaboración.
select per.id,per.nombre
from alumno a
    join persona per on per.id = a.id_persona
	left join practica p on a.id_persona = p.id_alumno
where p.id_convenio is null;

-- Muestra para los convenios firmados el número de alumnos que tienen asociados.
select c.id as id_convenio, count(distinct p.id_alumno) as num_alumnos
from convenio c
	join practica p on c.id = p.id_convenio
where c.fecha_firma is not null
group by c.id;

-- Muestra la información de los calendarios del convenio 1.
select cal.*
from calendario cal
	join practica p on cal.id = p.id_calendario
where p.id_convenio = 1;
