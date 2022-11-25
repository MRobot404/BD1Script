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


