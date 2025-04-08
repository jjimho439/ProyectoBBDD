-- Insertar datos en la tabla `empresa`
INSERT INTO empresa (nombre, cif, email, telefono, direccion) 
VALUES 
('Tech Solutions S.L.', 'B12345678', 'contacto@techsolutions.com', '912345678', 'Calle Innovación 12, Madrid'),
('InnovaSoft S.A.', 'A87654321', 'info@innovasoft.com', '934567890', 'Avenida Tecnológica 45, Barcelona'),
('DesarrolloWeb S.L.', 'C11223344', 'admin@desarrolloweb.com', '956789012', 'Paseo del Software 23, Valencia'),
('CloudTech S.L.', 'D22334455', 'info@cloudtech.com', '914567321', 'Calle Nube 5, Sevilla'),
('DataCorp S.A.', 'E33445566', 'soporte@datacorp.com', '917654321', 'Avenida Datos 88, Bilbao'),
('AI Solutions S.L.', 'F44556677', 'contacto@aisolutions.com', '915432678', 'Paseo Inteligencia 34, Granada'),
('CyberNet S.A.', 'G55667788', 'cyber@cybernet.com', '932165498', 'Calle Seguridad 11, Valencia'),
('Innovate IT', 'H66778899', 'ventas@innovateit.com', '911112233', 'Ronda Creativa 21, Madrid'),
('RedSys S.L.', 'I77889900', 'contacto@redsys.com', '923456789', 'Plaza Roja 77, Barcelona'),
('CodeMasters S.A.', 'J88990011', 'info@codemasters.com', '945678123', 'Paseo del Código 15, Sevilla');

-- Insertar datos en la tabla `sede`
INSERT INTO sede (id_empresa, localidad, direccion)
VALUES 
(1, 'Madrid', 'Calle Desarrollo 5'),
(1, 'Madrid', 'Calle Innovación 10'),
(2, 'Barcelona', 'Avenida Innovación 99'),
(3, 'Valencia', 'Paseo Empresarial 34'),
(4, 'Sevilla', 'Calle Tecnológica 8'),
(5, 'Bilbao', 'Avenida de la Nube 22'),
(6, 'Granada', 'Ronda del Dato 14'),
(6, 'Granada', 'Calle Inteligencia Artificial 15'),
(7, 'Valencia', 'Plaza de Seguridad 77'),
(8, 'Madrid', 'Calle Creativa 45');

-- Insertar datos en la tabla `instituto`
INSERT INTO instituto (nombre, email, localidad, direccion)
VALUES 
('IES Los Naranjos', 'info@ieslosnaranjos.com', 'Sevilla', 'Calle Estudiantes 15'),
('IES Miguel de Cervantes', 'contacto@iesmcervantes.com', 'Madrid', 'Plaza del Saber 10'),
('IES San Isidro', 'info@iessanisidro.com', 'Valencia', 'Calle Educación 8'),
('IES Clara Campoamor', 'info@iesclaracampoamor.com', 'Barcelona', 'Avenida Aprendizaje 22'),
('IES Ramón y Cajal', 'contacto@iesrycajal.com', 'Granada', 'Calle Ciencia 99'),
('IES Francisco de Quevedo', 'info@iesfquevedo.com', 'Bilbao', 'Plaza Letras 13'),
('IES La Laguna', 'contacto@ieslalaguna.com', 'Málaga', 'Calle del Mar 88'),
('IES Torre del Oro', 'info@iestorredeloro.com', 'Sevilla', 'Avenida Torre 101'),
('IES La Alhambra', 'contacto@iesalhambra.com', 'Granada', 'Paseo Nazari 77'),
('IES Galileo Galilei', 'info@iesgalilei.com', 'Zaragoza', 'Calle Cosmos 44');

-- Insertar datos en la tabla `ciclo_formativo`
INSERT INTO ciclo_formativo (nombre, nivel)
VALUES 
('Desarrollo de Aplicaciones Web', 'Grado Superior'),
('Administración de Sistemas Informáticos en Red', 'Grado Superior'),
('Marketing y Publicidad', 'Grado Superior'),
('Gestión Administrativa', 'Grado Medio'),
('Mecatrónica Industrial', 'Grado Superior'),
('Automoción', 'Grado Superior'),
('Sistemas Microinformáticos y Redes', 'Grado Medio'),
('Comercio Internacional', 'Grado Superior'),
('Diseño de Moda', 'Grado Superior'),
('Educación Infantil', 'Grado Superior');

-- Insertar datos en la tabla `oferta_formativa`
INSERT INTO oferta_formativa (annio_implantacion, id_instituto, id_ciclo)
VALUES 
(2022, 1, 1),
(2023, 2, 2),
(2024, 3, 3),
(2022, 4, 4),
(2021, 5, 5),
(2020, 6, 6),
(2023, 7, 7),
(2024, 8, 8),
(2022, 9, 9),
(2021, 10, 10);

-- Insertar datos en la tabla `curso`
INSERT INTO curso (nombre, annio_academico, id_oferta)
VALUES 
('1º DAW', 2024, 1),
('2º DAW', 2025, 1),
('1º ASIR', 2024, 2),
('2º ASIR', 2025, 2),
('1º Marketing', 2024, 3),
('2º Marketing', 2025, 3),
('1º Administración', 2024, 4),
('2º Administración', 2025, 4),
('1º Mecatrónica', 2024, 5),
('2º Mecatrónica', 2025, 5);

-- Insertar datos en la tabla `persona`
INSERT INTO persona (nombre, apellidos, dni, telefono, fecha_nacimiento, direccion)
VALUES 
('Juan', 'Pérez García', '12345678A', '600123456', '1998-03-15', 'Calle Luna 12, Madrid'),
('Ana', 'López Martínez', '23456789B', '600234567', '1997-05-10', 'Avenida Sol 45, Barcelona'),
('Carlos', 'Gómez Sánchez', '34567890C', '600345678', '2000-07-20', 'Calle Tierra 23, Valencia'),
('Laura', 'Martín Rodríguez', '45678901D', '600456789', '1996-09-11', 'Calle Fuego 7, Sevilla'),
('Pedro', 'Díaz García', '56789012E', '600567890', '1995-12-03', 'Avenida Mar 21, Bilbao'),
('María', 'Fernández Pérez', '67890123F', '600678901', '1999-01-17', 'Calle Paz 8, Granada'),
('José', 'Ruiz Pérez', '78901234G', '600789012', '2001-04-25', 'Calle Nubes 14, Valencia'),
('Raquel', 'Jiménez Rodríguez', '89012345H', '600890123', '2000-06-30', 'Avenida Sol 55, Madrid'),
('Luis', 'Sánchez Gómez', '90123456I', '600901234', '1998-08-20', 'Calle Estrella 17, Sevilla'),
('Paula', 'García Sánchez', '01234567J', '600012345', '2001-10-12', 'Avenida Sur 5, Granada'),
('Marcos', 'Alonso Ruiz', '13579246A', '600135792', '1994-02-28', 'Calle Rojo 20, Valencia'),
('Elena', 'Moreno Jiménez', '24680357B', '600246803', '1997-03-02', 'Plaza Mayor 8, Málaga'),
('Sergio', 'Vega López', '35791468C', '600357914', '1996-06-22', 'Calle Ocaso 3, Bilbao'),
('Sandra', 'Torres García', '46802579D', '600468025', '2000-07-14', 'Avenida Vista 9, Madrid'),
('Fernando', 'Ramos Pérez', '57913680E', '600579136', '1995-01-12', 'Calle Primavera 2, Sevilla'),
('David', 'Álvarez Sánchez', '68024791F', '600680247', '1998-04-25', 'Calle Sol 12, Granada'),
('José Luis', 'Serrano Gómez', '79135802G', '600791358', '1999-05-11', 'Calle Sol 10, Madrid'),
('Lucía', 'Herrera Martín', '80246913H', '600802469', '2001-11-19', 'Calle Lago 5, Barcelona'),
('Javier', 'Pardo Ruiz', '91358024I', '600913580', '1996-12-18', 'Calle Viento 14, Sevilla'),
('Beatriz', 'Castro Sánchez', '02469135J', '600024691', '2000-03-05', 'Calle Lluvia 18, Valencia');

-- Insertar datos en la tabla `alumno`
INSERT INTO alumno (id_persona, id_curso)
VALUES 
(1, 1), 
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertar datos en la tabla `tutor_docente`
INSERT INTO tutor_docente (id_persona)
VALUES 
(11),
(12),
(13),
(14),
(15);

-- Insertar datos en la tabla `tutor_laboral`
INSERT INTO tutor_laboral (id_persona, id_empresa)
VALUES 
(16, 1),
(17, 2),
(18, 3),
(19, 4),
(20, 5);

-- Insertar datos en la tabla `convenio`
INSERT INTO convenio (id_alumno, id_tutorD, id_tutorL, fecha_firma)
VALUES 
(1, 11, 16, '2025-04-01'),
(2, 12, 17, '2025-04-01'),
(3, 13, 18, '2025-04-01'),
(4, 14, 19, '2025-04-01'),
(5, 15, 20, '2025-04-01'),
(6, 11, 16, '2025-04-02'),
(7, 12, 17, '2025-04-02'),
(8, 13, 18, '2025-04-02'),
(9, 14, 19, '2025-04-02'),
(10, 15, 20, '2025-04-02');

-- Insertar datos en la tabla `competencia`
INSERT INTO competencia (descripcion)
VALUES 
('Desarrollo de aplicaciones móviles'),
('Administración de redes de comunicación'),
('Técnicas de publicidad digital'),
('Gestión de documentos administrativos'),
('Mantenimiento de sistemas electrónicos'),
('Automatización industrial'),
('Redes de ordenadores'),
('Comercio internacional'),
('Diseño de vestuario'),
('Atención a la infancia');

-- Insertar datos en la tabla `actividad_formativa`
INSERT INTO actividad_formativa (nombre, id_competencia)
VALUES 
('Aplicaciones para móviles', 1),
('Redes locales', 2),
('Publicidad digital', 3),
('Gestión de documentos', 4),
('Mantenimiento de equipos', 5),
('Control de maquinaria', 6),
('Redes de comunicación', 7),
('Importación de productos', 8),
('Confección de ropa', 9),
('Atención a menores', 10);

-- Insertar datos en la tabla `evaluacion`
INSERT INTO evaluacion (id_alumno, id_actividad, comentario, nota, id_tutorL)
VALUES 
(1, 1, 'Excelente rendimiento', 9.5, 16),
(2, 2, 'Buena participación', 8.0, 17),
(3, 3, 'Buen desempeño en tareas', 7.5, 18),
(4, 4, 'Regular, con oportunidad de mejorar', 6.0, 19),
(5, 5, 'Excelente en todo aspecto', 10.0, 20),
(6, 6, 'Trabajo eficiente', 8.5, 16),
(7, 7, 'Buen trabajo en clase', 7.0, 17),
(8, 8, 'Necesita mejorar', 5.5, 18),
(9, 9, 'Muy buen rendimiento', 9.0, 19),
(10, 10, 'Cumple con los requisitos', 7.0, 20);

-- Insertar datos en la tabla `calendario`
INSERT INTO calendario (id_sede, fecha)
VALUES 
(1, '2025-04-01'),
(2, '2025-04-02'),
(3, '2025-04-03'),
(4, '2025-04-04'),
(5, '2025-04-05'),
(6, '2025-04-06'),
(7, '2025-04-07'),
(8, '2025-04-08'),
(9, '2025-04-09'),
(10, '2025-04-10');

-- Insertar datos en la tabla `jornada`
CALL insertar_jornada (1, 9, 13, 'Clases de desarrollo web');
CALL insertar_jornada(2, 10, 14, 'Redes de comunicación');
CALL insertar_jornada(3, 8, 12, 'Publicidad digital');
CALL insertar_jornada (4, 11, 15, 'Gestión administrativa');
CALL insertar_jornada (5, 9, 13, 'Mantenimiento industrial');
CALL insertar_jornada (6, 14, 18, 'Automatización de sistemas');
CALL insertar_jornada (7, 10, 14, 'Redes de comunicación');
CALL insertar_jornada (8, 8, 12, 'Comercio internacional');
CALL insertar_jornada (9, 9, 13, 'Diseño de moda');
CALL insertar_jornada(10, 10, 14, 'Atención infantil');
CALL insertar_jornada(1, 8, 12, 'Clase de matemáticas');

select * from jornada;
