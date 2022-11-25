create or replace procedure p_empleadosRecientes as
begin
insert into empleadosRecientes
select usuario, contrasena
from empleado
where (extract(year from current_date)-extract(year from fecha_ingreso))>2015;
end;

create or replace procedure p_empleadosAntiguos as
begin
insert into empleadosAntiguos
select usuario, contrasena
from empleado
where (extract(year from current_date)-extract(year from fecha_ingreso))<2015;
end;