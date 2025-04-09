drop database if exists fp_dual;
create database fp_dual;
use fp_dual;

create table empresa(
	id int primary key auto_increment,
    nombre varchar(100),
    cif char(9),
    email varchar(150),
    telefono char(9),
    direccion varchar(250)
);

create table sede(
	id int primary key auto_increment,
    id_empresa int,
    localidad varchar(100),
    direccion varchar(250),
    constraint fk_empresa_sede foreign key (id_empresa) references empresa(id)
);

create table calendario(
	id int primary key auto_increment,
    nombre varchar(100),
    fecha_inicio date,
    fecha_fin date
);

create table jornada(
	id int primary key auto_increment,
    dia_semana varchar(50),
    fecha date,
    hora_inicio time,
    hora_fin time,
    id_calendario int,
    constraint fk_calendario_jornada foreign key (id_calendario) references calendario(id)
);

create table instituto(
	id int primary key auto_increment,
    nombre varchar(100),
    email varchar(150),
    localidad varchar(100),
    direccion varchar(250)
);

create table ciclo_formativo(
	id int primary key auto_increment,
    nombre varchar(100),
    nivel varchar(50)
);

create table oferta_formativa(
	id_instituto int,
    id_ciclo int,
    annio_implantacion year,
    constraint fk_instituto_oferta foreign key (id_instituto) references instituto(id),
    constraint fk_ciclo_oferta foreign key (id_ciclo) references ciclo_formativo(id),
    constraint pk_oferta_formativa primary key(id_instituto, id_ciclo)
);

create table curso(
	id int primary key auto_increment,
    nombre varchar(100),
    annio_academico year,
    id_instituto int,
    id_ciclo int,
    constraint fk_oferta_curso foreign key (id_instituto, id_ciclo) references oferta_formativa(id_instituto, id_ciclo)
);

create table persona(
	id int primary key auto_increment,
    nombre varchar(100),
    apellidos varchar(250),
    telefono char(9),
    fecha_nacimiento date,
    dni char(9),
    direccion varchar(250)
);

create table alumno(
	id_persona int,
    id_curso int,
    constraint fk_persona_alumno foreign key(id_persona) references persona(id),
    constraint fk_curso_alumno foreign key (id_curso) references curso(id)
);

create table tutor_docente(
	id_persona int,
    constraint fk_persona_tutord foreign key (id_persona) references persona(id)
);

create table tutor_laboral(
	id_persona int,
    id_empresa int,
    constraint fk_persona_tutorl foreign key (id_persona) references persona(id),
    constraint fk_empresa_tutorl foreign key (id_empresa) references empresa(id)
);

create table evaluacion(
	id int primary key auto_increment,
    comentario text,
    nota int,
    id_tutor_laboral int,
    constraint fk_tutorl_evaluacion foreign key (id_tutor_laboral) references tutor_laboral(id_persona) 
);

create table actividad_formativa(
	id int primary key auto_increment,
    nota int,
    id_evaluacion int,
    constraint fk_evaluacion_actividad foreign key (id_evaluacion) references evaluacion(id)
);

create table competencia(
	id int primary key auto_increment,
    nota int,
    id_actividad int,
    constraint fk_actividad_competencia foreign key (id_actividad) references actividad_formativa(id)
);

create table convenio(
	id int primary key auto_increment,
    id_tutor_docente int,
    id_tutor_laboral int,
    fecha_firma date,
    constraint fk_tutorld_convenio foreign key (id_tutor_docente) references tutor_docente(id_persona),
    constraint fk_tutorl_convenio foreign key (id_tutor_laboral) references tutor_laboral(id_persona)
);

create table practica(
	id_alumno int,
    id_evaluacion int,
    id_calendario int,
    id_convenio int,
    constraint fk_alumno_practica foreign key (id_alumno) references alumno(id_persona),
    constraint fk_evaluacion_practica foreign key (id_evaluacion) references evaluacion(id),
    constraint fk_calendario_practica foreign key (id_calendario) references calendario(id),
    constraint fk_convenio_practica foreign key (id_convenio) references convenio(id),
    constraint pk_practica primary key (id_alumno, id_evaluacion, id_calendario, id_convenio)
);