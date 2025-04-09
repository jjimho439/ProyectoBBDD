drop database if exists fp_dual;
create database fp_dual;
use fp_dual;

create table empresa(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    cif char(9) not null unique,
    email varchar(150) not null,
    telefono char(9) not null,
    direccion varchar(250) not null
);

create table sede(
    id int primary key auto_increment,
    id_empresa int not null,
    localidad varchar(100) not null,
    direccion varchar(250) not null,
    constraint fk_empresa_sede foreign key (id_empresa) references empresa(id)
);

create table calendario(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    fecha_inicio date not null,
    fecha_fin date not null
);

create table jornada(
    id int primary key auto_increment,
    dia_semana varchar(50) not null,
    fecha date not null,
    hora_inicio time not null,
    hora_fin time not null,
    id_calendario int not null,
    constraint fk_calendario_jornada foreign key (id_calendario) references calendario(id)
);

create table instituto(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    email varchar(150) not null unique,
    localidad varchar(100) not null,
    direccion varchar(250) not null
);

create table ciclo_formativo(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    nivel varchar(50) not null
);

create table oferta_formativa(
    id_instituto int not null,
    id_ciclo int not null,
    annio_implantacion year not null,
    constraint fk_instituto_oferta foreign key (id_instituto) references instituto(id),
    constraint fk_ciclo_oferta foreign key (id_ciclo) references ciclo_formativo(id),
    constraint pk_oferta_formativa primary key(id_instituto, id_ciclo)
);

create table curso(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    annio_academico varchar(15) not null,
    id_instituto int not null,
    id_ciclo int not null,
    constraint fk_oferta_curso foreign key (id_instituto, id_ciclo) references oferta_formativa(id_instituto, id_ciclo)
);

create table persona(
    id int primary key auto_increment,
    nombre varchar(100) not null,
    apellidos varchar(250) not null,
    telefono char(9) not null,
    fecha_nacimiento date not null,
    dni char(9) not null unique,
    direccion varchar(250) not null
);

create table alumno(
    id_persona int primary key,
    id_curso int not null,
    constraint fk_persona_alumno foreign key(id_persona) references persona(id),
    constraint fk_curso_alumno foreign key (id_curso) references curso(id)
);

create table tutor_docente(
    id_persona int primary key,
    constraint fk_persona_tutord foreign key (id_persona) references persona(id)
);

create table tutor_laboral(
    id_persona int primary key,
    id_empresa int not null,
    constraint fk_persona_tutorl foreign key (id_persona) references persona(id),
    constraint fk_empresa_tutorl foreign key (id_empresa) references empresa(id)
);

create table evaluacion(
    id int primary key auto_increment,
    comentario text not null,
    nota int not null,
    id_tutor_laboral int not null,
    constraint fk_tutorl_evaluacion foreign key (id_tutor_laboral) references tutor_laboral(id_persona),
    constraint chk_nota_eva check (nota between 0 and 10)
);

create table actividad_formativa(
    id int primary key auto_increment,
    nota int not null,
    descripcion varchar(200),
    id_evaluacion int not null,
    constraint fk_evaluacion_actividad foreign key (id_evaluacion) references evaluacion(id),
    constraint chk_nota_act check (nota between 0 and 10)
);

create table competencia(
    id int primary key auto_increment,
    nota int not null,
    descripcion varchar(200),
    id_actividad int not null,
    constraint fk_actividad_competencia foreign key (id_actividad) references actividad_formativa(id),
    constraint chk_nota_comp check (nota between 0 and 10)
);

create table convenio(
    id int primary key auto_increment,
    id_tutor_docente int not null,
    id_tutor_laboral int not null,
    fecha_firma date not null,
    constraint fk_tutorld_convenio foreign key (id_tutor_docente) references tutor_docente(id_persona),
    constraint fk_tutorl_convenio foreign key (id_tutor_laboral) references tutor_laboral(id_persona)
);

create table practica(
    id_alumno int not null,
    id_evaluacion int not null,
    id_calendario int not null,
    id_convenio int not null,
    constraint fk_alumno_practica foreign key (id_alumno) references alumno(id_persona),
    constraint fk_evaluacion_practica foreign key (id_evaluacion) references evaluacion(id),
    constraint fk_calendario_practica foreign key (id_calendario) references calendario(id),
    constraint fk_convenio_practica foreign key (id_convenio) references convenio(id),
    constraint pk_practica primary key (id_alumno, id_evaluacion, id_calendario, id_convenio)
);
