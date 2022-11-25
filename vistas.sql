create or replace view v_cliente as (
select p.apellido, p.nombre, c.usuario, c.contrasena
from cliente c, persona p
where c.idpersona=p.idpersona);


create or replace view v_empleado as (
select p.apellido, p.nombre, e.usuario, e.contrasena
from empleado e, persona p
where e.idpersona=p.idpersona);

create or replace view v_zona as (
select g.idzonageografica, d.departamento, z.zona, m.municipio, a.aldea_caserio, c.nom_colonias
from zona_geografica g, departamento d, zona z, municipio m, aldeas_caserio a, colonia c
where
d.id_departamento=m.id_departamento
and c.id_zona=z.id_zona
and a.id_municipio=m.id_municipio
and g.id_aldea=a.id_aldea
and g.id_colonias=c.id_colonias);

create or replace view v_inmuebles as (
select i.idinmueble, i.nombre_inmueble, i.descripcion, i.capacidad, i.direccion, i.url_imagen, c.nombre_categoria, e.disponibilidad, d.departamento
from inmueble i, categorias c, estado e, departamento d
where
i.idestado_inmueble=e.idestado_inmueble
and i.idcategoria=c.idcategoria
and i.id_departamento=d.id_departamento);

select * from v_inmuebles;


create or replace view v_telefono as (
select c.email, p.nombre, p.apellido, p.fecha_nacimiento, t.numero
from correo c, persona p, telefono t
where c.idpersona=p.idpersona);

select * from v_telefono;
