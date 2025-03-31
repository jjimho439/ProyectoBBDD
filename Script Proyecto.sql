drop database if exists FP_Dual;
create database FP_Dual;
use FP_Dual;

create table Persona(
	id int primary key auto_increment,
    nombre varchar(100),
    apellidos varchar(200),
    dni char(9),
    telefono char(9),
    fecha_nacimiento date,
    direccion varchar(255)
);