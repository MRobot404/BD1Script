--CREACION DE ESPECIFICACION DE PAQUETE
create or replace package los_inmuebles as
procedure detalles(v_idinmueble inmueble.idinmueble%type);
end los_inmuebles;

--CREACION DE BODY DE PAQUETE
create or replace package body los_inmuebles as
procedure detalles(v_idinmueble inmueble.idinmueble%type) is
v_in inmueble.nombre_inmueble%type;
v_descripcion inmueble.descripcion%type; 
v_capacidad inmueble.capacidad%type;
v_direccion inmueble.direccion%type;
v_url_imagen inmueble.url_imagen%type;
begin
select nombre_inmueble, descripcion, capacidad, direccion, url_imagen into v_in, v_descripcion, v_capacidad, v_direccion, v_url_imagen
from inmueble where idinmueble=v_idinmueble;
dbms_output.put_line('Inmueble ' || v_in);
dbms_output.put_line('Descripcion ' || v_descripcion);
dbms_output.put_line('Capacidad ' || v_capacidad);
dbms_output.put_line('Direccion ' || v_direccion);
dbms_output.put_line('Imagen ' || v_url_imagen);
end detalles;
end los_inmuebles; 

--PARA PROBAR
begin
los_inmuebles.detalles(1);
end;