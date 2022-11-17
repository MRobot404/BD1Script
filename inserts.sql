insert into persona (nombre,apellido,fecha_nacimiento) values ('Alejandra','Juarez','02/03/2022');
insert into menu (Opcion_menu) values ('login');
insert into tipo_usuario (tipo_usuario) values('Administrador');
insert into rol (nombre_rol) values ('Empleado');
insert into rol_tipo_usuario (id_rol,id_tipo_usuario) values(6,16);
insert into cliente (idpersona,id_tipo_usuario,fecha_alta,usuario_cliente,contrasena) values(1,16,'02/05/2022','Juan','remember123');
insert into correo (idpersona,idcliente,email) values(1,1,'correogenerico@gmail.com');
insert into telefono (idpersona,idcliente,numero) values (1,1,'52304059');