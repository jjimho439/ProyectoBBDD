drop database if exists FP_Dual;
create database FP_Dual;
use FP_Dual;

create table empresa(
	id int primary key auto_increment,
    nombre varchar(100),
    cif char(9),
    email varchar(100),
    telefono char(9),
    direccion varchar(250)
);

create table sede(
	id int primary key auto_increment,
    id_empresa int,
    localidad varchar(150),
    direccion varchar(250),
    constraint fk_sede_empresa foreign key(id_empresa) references empresa(id)
);

create table instituto(
	id int primary key auto_increment,
    nombre varchar(200),
    email varchar(100),
    localidad varchar(150),
    direccion varchar(250)
);

create table ciclo_formativo(
	id int primary key auto_increment,
    nombre varchar(200),
    nivel varchar(200)
);

create table oferta_formativa(
	id int primary key auto_increment,
    annio_implantacion year,
    id_instituto int,
    id_ciclo int,
    constraint fk_oferta_instituto foreign key (id_instituto) references instituto(id),
    constraint fk_oferta_ciclo foreign key (id_ciclo) references ciclo_formativo(id)
);

create table curso(
	id int primary key auto_increment,
    nombre varchar(100),
    annio_academico year,
    id_oferta int,
    constraint fk_curso_oferta foreign key (id_oferta) references oferta_formativa(id)
);

create table persona(
	id int primary key auto_increment,
    nombre varchar(100),
    apellidos varchar(200),
    dni char(9),
    telefono char(9),
    fecha_nacimiento date,
    direccion varchar(255)
);

create table alumno(
	id_persona int,
    constraint fk_alumno_persona foreign key (id_persona) references persona(id)
);

create table tutor_docente(
	id_persona int,
    constraint fk_tutorD_persona foreign key (id_persona) references persona(id)
);

create table tutor_laboral(
	id_persona int,
    constraint fk_tutorL_persona foreign key (id_persona) references persona(id)
);

create table convenio(
	id int primary key auto_increment,
    id_alumno int,
    id_tutorD int,
    id_tutorL int,
    fecha_firma date,
    constraint fk_convenio_alumno foreign key (id_alumno) references alumno(id_persona),
    constraint fk_convenio_tutorD foreign key (id_tutorD) references tutor_docente(id_persona),
    constraint fk_convenio_tutorL foreign key (id_tutorL) references tutor_laboral(id_persona)
);