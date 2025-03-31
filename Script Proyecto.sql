drop database if exists FP_Dual;
create database FP_Dual;
use FP_Dual;

create table empresa(
	id int primary key auto_increment,
    nombre varchar(100) not null unique,
    cif char(9) not null unique,
    email varchar(100) unique,
    telefono char(9) unique,
    direccion varchar(250)
);

create table sede(
	id int primary key auto_increment,
    id_empresa int,
    localidad varchar(150) not null,
    direccion varchar(250) not null,
    constraint fk_sede_empresa foreign key(id_empresa) references empresa(id) on delete cascade
);

create table instituto(
	id int primary key auto_increment,
    nombre varchar(200) not null unique,
    email varchar(100) unique,
    localidad varchar(150),
    direccion varchar(250)
);

create table ciclo_formativo(
	id int primary key auto_increment,
    nombre varchar(200) not null unique,
    nivel varchar(200) not null
);

create table oferta_formativa(
	id int primary key auto_increment,
    annio_implantacion year,
    id_instituto int,
    id_ciclo int,
    constraint fk_oferta_instituto foreign key (id_instituto) references instituto(id),
    constraint fk_oferta_ciclo foreign key (id_ciclo) references ciclo_formativo(id),
    constraint chk_oferta_annio check (annio_implantacion >= 2000)
);

create table curso(
	id int primary key auto_increment,
    nombre varchar(100) not null,
    annio_academico year not null,
    id_oferta int,
    constraint fk_curso_oferta foreign key (id_oferta) references oferta_formativa(id),
    constraint chk_curso_annio check (annio_academico >= 2000)
);

create table persona(
	id int primary key auto_increment,
    nombre varchar(100) not null,
    apellidos varchar(200) not null,
    dni char(9) not null unique,
    telefono char(9) unique,
    fecha_nacimiento date,
    direccion varchar(255)
);

create table alumno(
	id_persona int,
    id_curso int,
    constraint fk_alumno_persona foreign key (id_persona) references persona(id) on delete cascade,
    constraint fk_alumno_curso foreign key (id_curso) references curso(id) on delete set null
);

create table tutor_docente(
	id_persona int,
    constraint fk_tutorD_persona foreign key (id_persona) references persona(id) on delete cascade
);

create table tutor_laboral(
	id_persona int,
    id_empresa int,
    constraint fk_tutorL_persona foreign key (id_persona) references persona(id) on delete cascade,
    constraint fk_tutorL_empresa foreign key (id_empresa) references empresa(id) on delete set null
);

create table convenio(
	id int primary key auto_increment,
    id_alumno int not null,
    id_tutorD int not null,
    id_tutorL int not null,
    fecha_firma date not null,
    constraint fk_convenio_alumno foreign key (id_alumno) references alumno(id_persona) on delete cascade,
    constraint fk_convenio_tutorD foreign key (id_tutorD) references tutor_docente(id_persona) on delete cascade,
    constraint fk_convenio_tutorL foreign key (id_tutorL) references tutor_laboral(id_persona) on delete cascade
);

create table competencia(
	id int primary key auto_increment,
    descripcion varchar(250) not null
);

create table actividad_formativa(
	id int primary key auto_increment,
    nombre varchar(100) not null,
    id_competencia int not null,
    constraint fk_actividad_competencia foreign key (id_competencia) references competencia(id)
);

create table evaluacion(
	id int primary key auto_increment,
    id_alumno int not null,
    id_actividad int not null,
    comentario text,
    nota double(4,2),
    id_tutorL int,
    constraint fk_evaluacion_alumno foreign key (id_alumno) references alumno (id_persona) on delete cascade,
    constraint fk_evaluacion_actividad foreign key (id_actividad) references actividad_formativa (id) on delete cascade,
    constraint fk_evaluacion_tutorL foreign key (id_tutorL) references tutor_laboral(id_persona) on delete cascade,
    constraint chk_evaluacion_nota check (nota between 0 and 10)
);

create table calendario(
	id_sede int,
	fecha date primary key,
    constraint fk_calendario_sede foreign key (id_sede) references sede(id)
);

create table jornada(
	id int primary key auto_increment,
    id_alumno int,
    hora_inicio int not null,
    hora_fin int not null,
	descripcion varchar(255),
    fecha date,
    constraint fk_jornada_calendario foreign key (fecha) references calendario(fecha),
    constraint fk_jornada_alumno foreign key (id_alumno) references alumno (id_persona) on delete cascade,
    constraint chk_jornada_hora check (hora_fin > hora_inicio)
);

DELIMITER $$
CREATE PROCEDURE insertar_jornada (IN descripcion VARCHAR(255))
BEGIN
    DECLARE nueva_fecha DATE;
    -- Obtener la última fecha insertada en la tabla eventos
    SELECT MAX(fecha) INTO nueva_fecha FROM jornada;
    -- Si no hay fechas previas, empezar con una fecha de inicio, por ejemplo, '2025-01-01'
    IF nueva_fecha IS NULL THEN
        SET nueva_fecha = '2025-01-01';
    ELSE
        -- Sumar un día a la última fecha
        SET nueva_fecha = DATE_ADD(nueva_fecha, INTERVAL 1 DAY);
    END IF;
    -- Insertar la nueva fecha en la tabla calendario (si no existe)
    INSERT IGNORE INTO calendario (fecha) VALUES (nueva_fecha);
    -- Insertar el evento con la nueva fecha
    INSERT INTO jornada (descripcion, fecha) VALUES (descripcion, nueva_fecha);
END $$
DELIMITER ;

-- CALL insertar_jornada ('Jornada de prueba'); *Sentencia para insertar jornadas que se vaya auto incrementando con el calendario*
