insert into persona (nombre,apellido,fecha_nacimiento) values ('Alejandra','Juarez','02/03/2022');
insert into menu (Opcion_menu) values ('login');
insert into tipo_usuario (tipo_usuario) values('Administrador');
insert into rol (nombre_rol) values ('Empleado');
insert into rol_tipo_usuario (id_rol,id_tipo_usuario) values(6,16);
insert into cliente (idpersona,id_tipo_usuario,fecha_alta,usuario_cliente,contrasena) values(1,16,'02/05/2022','Juan','remember123');
insert into correo (idpersona,idcliente,email) values(1,1,'correogenerico@gmail.com');
insert into telefono (idpersona,idcliente,numero) values (1,1,'52304059');
insert into empleado (id_tipo_usuario,idpersona,fecha_ingreso,fecha_egreso,usuario,contrasena) values(1,1,'02/04/2000','17/11/2022','juancho','contrasena');
insert into tipo_documento (nacionalidad,pasaporte,licencia) values ('Guatemalteca','Pasaporte Ordinario','A');
insert into documento_persona (id_tipopersona,idPersona) values (2,1);
insert into estado(disponibilidad) values ('Disponible');
insert into estado(disponibilidad) values ('Reservado');
insert into categorias(nombre_categoria) values ('Apartamento');
insert into categorias(nombre_categoria) values ('Casa');
insert into categorias(nombre_categoria) values ('Casa 2 niveles');
insert into categorias(nombre_categoria) values ('local');
insert into categorias(nombre_categoria) values ('oficina');
insert into