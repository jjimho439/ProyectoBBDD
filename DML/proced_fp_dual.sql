use fp_dual;
insert into calendario (nombre, fecha_inicio, fecha_fin) values 
	('FERIA_MAIRENA', '2025-04-23', '2025-04-27'),
    ('CRUZ_MAYO_VISO', '2025-05-07', '2025-05-11'),
    ('FERIA_SEVILLA', '2025-04-28', '2025-05-04');
    
    select id, fecha_inicio, fecha_fin from calendario;
    
-- Procedimiento para cargar X, J, V al calendario anterior
-- de forma automática en el rango de fechas establecidos y con X horas al día
DELIMITER $$

DROP PROCEDURE IF EXISTS rellenar_calendario$$
CREATE PROCEDURE rellenar_calendario()
BEGIN 

	-- Declaramos el cursor para recorrer tabla calendarios
	declare cal_fecha_inicio date;
    declare cal_fecha_fin date;
    declare cal_id int;
    declare fin int default 0;
    declare calendario cursor for select fecha_inicio, fecha_fin, id from calendario;
    declare continue handler for not found set fin = 1;
    
    open calendario;
    
    bucle_cal: LOOP
    
		fetch calendario into cal_fecha_inicio, cal_fecha_fin, cal_id;
		select cal_fecha_inicio, cal_fecha_fin, cal_id;
        while cal_fecha_inicio <= cal_fecha_fin DO
			if dayofweek(cal_fecha_inicio) IN (2,3,4,5,6) then
				insert into jornada 
					(dia_semana, fecha, hora_inicio, hora_fin, id_calendario)
				values (dia_semana(dayofweek(cal_fecha_inicio)), cal_fecha_inicio, '08:00', '22:00', cal_id);
			end if;
            SET cal_fecha_inicio = DATE_ADD(cal_fecha_inicio, INTERVAL 1 DAY);
		end while;
    
		if fin = 1 then
			leave bucle_cal;
		end if;
    END LOOP;
	
    close calendario;
    
END$$

drop function if exists dia_semana$$
create function dia_semana(num_dia int) returns varchar(25) deterministic
begin
	
    declare result varchar(25);
	set result = case(num_dia)
        when 2 then 'Lunes'
        when 3 then 'Martes'
        when 4 then 'Miercoles'
        when 5 then 'Jueves'
        when 6 then 'Viernes'
	end;
    
    return result;
end$$

DELIMITER ;

call rellenar_calendario();
select * from calendario;
select * from jornada;