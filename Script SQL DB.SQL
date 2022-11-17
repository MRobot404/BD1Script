
create table CORREO (
   IDCORREO             INTEGER               not null,
   IDPERSONA            INTEGER,
   IDCLIENTE            INTEGER,
   EMAIL                VARCHAR2(50)          not null,
   constraint PK_CORREO primary key (IDCORREO)
);



alter table CORREO
   add constraint FK_CORREO_CLIENTE_C_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE);

alter table CORREO
   add constraint FK_CORREO_PERSONA_C_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);


create table TIPO_DOCUMENTO (
   ID_TIPOPERSONA       INTEGER               not null,
   NACIONALIDAD         VARCHAR2(100),
   PASAPORTE            VARCHAR2(100),
   LICENCIA             VARCHAR2(100),
   constraint PK_TIPO_DOCUMENTO primary key (ID_TIPOPERSONA)
);


create table PERSONA (
   IDPERSONA            INTEGER               not null,
   NOMBRE               VARCHAR2(50)          not null, 
   APELLIDO             VARCHAR2(50)          not null,
   FECHA_NACIMIENTO     DATE,
   constraint PK_PERSONA primary key (IDPERSONA)
);


create table EMPLEADO (
   ID_EMPLEADO          INTEGER               not null,
   ID_TIPO_USUARIO      INTEGER,
   IDPERSONA            INTEGER,
   FECHA_INGRESO        DATE,
   FECHA_EGRESO         DATE,
   USUARIO_EMPLEADO     VARCHAR2(30),
   CONTRASENA           VARCHAR2(30),
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);






alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);

alter table EMPLEADO
   add constraint FK_EMPLEADO_RELATIONS_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);



create table DOCUMENTO_PERSONA (
   ID_DOCUMENTO_PERSONA INTEGER               not null,
   ID_TIPOPERSONA       INTEGER,
   IDPERSONA            INTEGER,
   constraint PK_DOCUMENTO_PERSONA primary key (ID_DOCUMENTO_PERSONA)
);



alter table DOCUMENTO_PERSONA
   add constraint FK_DOCUMENT_RELATIONS_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);

alter table DOCUMENTO_PERSONA
   add constraint FK_DOCUMENT_RELATIONS_TIPO_DOC foreign key (ID_TIPOPERSONA)
      references TIPO_DOCUMENTO (ID_TIPOPERSONA);



create table TELEFONO (
   IDTELEFONO           INTEGER               not null,
   IDCLIENTE            INTEGER,
   IDPERSONA            INTEGER,
   NUMERO               CHAR(10)              not null,
   constraint PK_TELEFONO primary key (IDTELEFONO)
);





alter table TELEFONO
   add constraint FK_TELEFONO_CLIENTE_T_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE);

alter table TELEFONO
   add constraint FK_TELEFONO_TELEFONO__PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);


create table TIPO_USUARIO (
   ID_TIPO_USUARIO      INTEGER               not null,
   TIPO_USUARIO         VARCHAR2(30),
   constraint PK_TIPO_USUARIO primary key (ID_TIPO_USUARIO)
);


create table ROL_TIPO_USUARIO (
   ID_ROL_TIPO_USUARIO  INTEGER               not null,
   ID_ROL               INTEGER,
   ID_TIPO_USUARIO      INTEGER,
   constraint PK_ROL_TIPO_USUARIO primary key (ID_ROL_TIPO_USUARIO)
);




alter table ROL_TIPO_USUARIO
   add constraint FK_ROL_TIPO_RELATIONS_ROL foreign key (ID_ROL)
      references ROL (ID_ROL);

alter table ROL_TIPO_USUARIO
   add constraint FK_ROL_TIPO_RELATIONS_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

create table ROL (
   ID_ROL               INTEGER               not null,
   NOMBRE_ROL           VARCHAR2(30),
   constraint PK_ROL primary key (ID_ROL)
);

create table MENU (
   ID_MENU              INTEGER               not null,
   OPCION_MENU          VARCHAR2(30),
   constraint PK_MENU primary key (ID_MENU)
);

create table CLIENTE (
   IDCLIENTE            INTEGER               not null,
   IDPERSONA            INTEGER,
   ID_TIPO_USUARIO      INTEGER,
   FECHA_ALTA           DATE,
   USUARIO              VARCHAR2(30),
   CONTRASENA           VARCHAR2(30),
   constraint PK_CLIENTE primary key (IDCLIENTE)
);




alter table CLIENTE
   add constraint FK_CLIENTE_PERSONA_C_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_TIPO_USU foreign key (ID_TIPO_USUARIO)
      references TIPO_USUARIO (ID_TIPO_USUARIO);

create table RENTA (
   IDRENTA              INTEGER               not null,
   IDCLIENTE            INTEGER,
   IDESTADO_INMUEBLE    INTEGER,
   IDINMUEBLE           INTEGER,
   FECHA_RENTA          DATE                  not null,
   TIEMPO_RENTA_RESERVA DATE                  not null,
   VALOR                FLOAT(10)             not null,
   FECHA_INICIO         DATE,
   FECHA_FIN            DATE,
   FECHA_CANCELACION    DATE,
   constraint PK_RENTA primary key (IDRENTA)
);



alter table RENTA
   add constraint FK_RENTA_CLIENTE_R_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE);

alter table RENTA
   add constraint FK_RENTA_INMUEBLE__INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);

alter table RENTA
   add constraint FK_RENTA_RELATIONS_ESTADO foreign key (IDESTADO_INMUEBLE)
      references ESTADO (IDESTADO_INMUEBLE);

create table RESERVA (
   IDRESERVA            INTEGER               not null,
   IDESTADO_INMUEBLE    INTEGER,
   IDINMUEBLE           INTEGER,
   IDCLIENTE            INTEGER,
   FECHA_               DATE                  not null,
   TIEMPO_RESERVA       DATE                  not null,
   TIEMPO_RENTA_REST    DATE,
   FECHA_CANCELA        DATE,
   constraint PK_RESERVA primary key (IDRESERVA)
);




alter table RESERVA
   add constraint FK_RESERVA_CLIENTE_R_CLIENTE foreign key (IDCLIENTE)
      references CLIENTE (IDCLIENTE);

alter table RESERVA
   add constraint FK_RESERVA_INMUEBLE__INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);

alter table RESERVA
   add constraint FK_RESERVA_RELATIONS_ESTADO foreign key (IDESTADO_INMUEBLE)
      references ESTADO (IDESTADO_INMUEBLE);

create table RESERVA_PAGO (
   ID_RESERVA_PAGO      INTEGER               not null,
   IDRESERVA            INTEGER,
   constraint PK_RESERVA_PAGO primary key (ID_RESERVA_PAGO)
);




alter table RESERVA_PAGO
   add constraint FK_RESERVA__RELATIONS_RESERVA foreign key (IDRESERVA)
      references RESERVA (IDRESERVA);


create table RENTA_PAGO (
   ID_RENTAPAGO         INTEGER               not null,
   IDPAGO               INTEGER,
   IDRENTA              INTEGER,
   constraint PK_RENTA_PAGO primary key (ID_RENTAPAGO)
);




alter table RENTA_PAGO
   add constraint FK_RENTA_PA_RELATIONS_RENTA foreign key (IDRENTA)
      references RENTA (IDRENTA);

alter table RENTA_PAGO
   add constraint FK_RENTA_PA_RELATIONS_PAGO foreign key (IDPAGO)
      references PAGO (IDPAGO);



create table PAGO (
   IDPAGO               INTEGER               not null,
   ID_RESERVA_PAGO      INTEGER,
   constraint PK_PAGO primary key (IDPAGO)
);



alter table PAGO
   add constraint FK_PAGO_RELATIONS_RESERVA_ foreign key (ID_RESERVA_PAGO)
      references RESERVA_PAGO (ID_RESERVA_PAGO);


create table INMUEBLE (
   IDINMUEBLE           INTEGER               not null,
   IDESTADO_INMUEBLE    INTEGER,
   IDCATEGORIA          INTEGER,
   CAT_IDCATEGORIA      INTEGER,
   EST_IDESTADO_INMUEBLE INTEGER,
   NOMBRE_INMUEBLE      VARCHAR2(50)          not null,
   DESCRIPCION          VARCHAR2(50),
   CAPACIDAD            NUMBER,
   DIRECCION            VARCHAR2(50),
   URL_IMAGEN           VARCHAR2(100),
   constraint PK_INMUEBLE primary key (IDINMUEBLE)
);



alter table INMUEBLE
   add constraint FK_INMUEBLE_CATEGORIA_CATEGORI foreign key (IDCATEGORIA)
      references CATEGORIAS (IDCATEGORIA);

alter table INMUEBLE
   add constraint FK_INMUEBLE_ESTADO_IN_ESTADO foreign key (EST_IDESTADO_INMUEBLE)
      references ESTADO (IDESTADO_INMUEBLE);

alter table INMUEBLE
   add constraint FK_INMUEBLE_INMUEBLE__ESTADO foreign key (IDESTADO_INMUEBLE)
      references ESTADO (IDESTADO_INMUEBLE);

alter table INMUEBLE
   add constraint FK_INMUEBLE_RELATIONS_CATEGORI foreign key (CAT_IDCATEGORIA)
      references CATEGORIAS (IDCATEGORIA);



create table CATEGORIAS (
   IDCATEGORIA          INTEGER               not null,
   IDESTADO_INMUEBLE    INTEGER,
   IDINMUEBLE           INTEGER,
   NOMBRE_CATEGORIA     VARCHAR2(50)          not null,
   constraint PK_CATEGORIAS primary key (IDCATEGORIA)
);




alter table CATEGORIAS
   add constraint FK_CATEGORI_RELATIONS_INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);

alter table CATEGORIAS
   add constraint FK_CATEGORI_RELATIONS_ESTADO foreign key (IDESTADO_INMUEBLE)
      references ESTADO (IDESTADO_INMUEBLE);


create table ESTADO (
   IDESTADO_INMUEBLE    INTEGER               not null,
   IDINMUEBLE           INTEGER,
   DISPONIBILIDAD       SMALLINT              not null,
   constraint PK_ESTADO primary key (IDESTADO_INMUEBLE)
);




alter table ESTADO
   add constraint FK_ESTADO_ESTADO_IN_INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);



create table DEPARTAMENTO (
   ID_DEPARTAMENTO      INTEGER               not null,
   IDINMUEBLE           INTEGER,
   DEPARTAMENTO         VARCHAR2(50),
   constraint PK_DEPARTAMENTO primary key (ID_DEPARTAMENTO)
);


alter table DEPARTAMENTO
   add constraint FK_DEPARTAM_RELATIONS_INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);




create table ZONA (
   ID_ZONA              INTEGER               not null,
   ID_MUNICIPIO         INTEGER,
   ZONA                 VARCHAR2(50),
   constraint PK_ZONA primary key (ID_ZONA)
);




alter table ZONA
   add constraint FK_ZONA_RELATIONS_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO);


create table ZONA_GEOGRAFICA (
   IDZONAGEOGRAFICA     INTEGER               not null,
   IDINMUEBLE           INTEGER,
   ID_COLONIAS          INTEGER,
   ID_MUNICIPIO         INTEGER,
   ID_ALDEA             INTEGER,
   constraint PK_ZONA_GEOGRAFICA primary key (IDZONAGEOGRAFICA)
);


alter table ZONA_GEOGRAFICA
   add constraint FK_ZONA_GEO_RELATIONS_INMUEBLE foreign key (IDINMUEBLE)
      references INMUEBLE (IDINMUEBLE);

alter table ZONA_GEOGRAFICA
   add constraint FK_ZONA_GEO_RELATIONS_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO);

alter table ZONA_GEOGRAFICA
   add constraint FK_ZONA_GEO_RELATIONS_ALDEAS_C foreign key (ID_ALDEA)
      references ALDEAS_CASERIO (ID_ALDEA);

alter table ZONA_GEOGRAFICA
   add constraint FK_ZONA_GEO_RELATIONS_COLONIA foreign key (ID_COLONIAS)
      references COLONIA (ID_COLONIAS);

create table MUNICIPIO (
   ID_MUNICIPIO         INTEGER               not null,
   ID_DEPARTAMENTO      INTEGER,
   MUNICIPIO            CHAR(10),
   constraint PK_MUNICIPIO primary key (ID_MUNICIPIO)
);




alter table MUNICIPIO
   add constraint FK_MUNICIPI_RELATIONS_DEPARTAM foreign key (ID_DEPARTAMENTO)
      references DEPARTAMENTO (ID_DEPARTAMENTO);


create table ALDEAS_CASERIO (
   ID_ALDEA             INTEGER               not null,
   ID_MUNICIPIO         INTEGER,
   ALDEA_CASERIO        VARCHAR2(50),
   constraint PK_ALDEAS_CASERIO primary key (ID_ALDEA)
);




alter table ALDEAS_CASERIO
   add constraint FK_ALDEAS_C_RELATIONS_MUNICIPI foreign key (ID_MUNICIPIO)
      references MUNICIPIO (ID_MUNICIPIO);




create table COLONIA (
   ID_COLONIAS          INTEGER               not null,
   ID_ZONA              INTEGER,
   NOM_COLONIAS         VARCHAR2(30),
   constraint PK_COLONIA primary key (ID_COLONIAS)
);


alter table COLONIA
   add constraint FK_COLONIA_RELATIONS_ZONA foreign key (ID_ZONA)
      references ZONA (ID_ZONA);
