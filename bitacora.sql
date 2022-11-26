T_PERSONA_BITACORA
INSERT
    create or replace  TRIGGER 
    TGR_BITACORA_AFTER_INSERT_PERSONA AFTER 
    INSERT ON TBL_PERSONA REFERENCING NEW AS NEW 
    OLD AS OLD FOR EACH ROW
    BEGIN  
        INSERT INTO TBL_BITACORA (ID_TRANSACCION,
        BIT_TABLA_PRINCIPAL,TRN_USUARIO,TRN_FECHA_HORA, TRN_LOG)
        VALUES(
        SEC_TBL_BITACORA.NEXTVAL,
        'TBL_PERSONA',
        SYS_CONTEXT ('USERENV', 'OS_USER'),
        SYSDATE,
        'SE HA INGRESADO UN NUEVO REGISTRO CON LOS SIGUIENTES VALORES:'||
        ' ID_TIPO_DOCUMENTO= '||TO_CHAR (:NEW.id_tipo_documento)||
        ', PRIMER_NOMBRE= '|| TO_CHAR (:NEW.primer_nombre)||' , SEGUNDO_NOMBRE= '||
        TO_CHAR (:NEW.segundo_nombre)||', TERCER_NOMBRE= '||
        TO_CHAR (:NEW.tercer_nombre)||', PRIMERO_APELLIDO= '||
        TO_CHAR (:NEW.primero_apellido)||', SEGUNDO_APELLIDO= '||
        TO_CHAR (:NEW.segundo_apellido)||', DOCUMENTO= '||TO_CHAR (:NEW.documento)||
        ', NIT= '||TO_CHAR (:NEW.nit)||', FECHA_NACIMIENTO= '||
        TO_CHAR (:NEW.fecha_nacimiento)||', SEXO= '||TO_CHAR (:NEW.sexo)||
        ', TELEFONO= '||TO_CHAR (:NEW.telefono)||', EMAIL= '||TO_CHAR (:NEW.email)||
        ', RAZON_SOCIAL= '||TO_CHAR (:NEW.razon_social)||', DIRECCION= '||TO_CHAR (:NEW.direccion)||'.'
       );
    END;
    /
    
DELETE

create or replace  TRIGGER TGR_BITACORA_AFTER_DELETE_PERSONA
AFTER DELETE ON TBL_PERSONA REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
BEGIN  
    INSERT INTO TBL_BITACORA (ID_TRANSACCION,BIT_TABLA_PRINCIPAL,TRN_USUARIO,TRN_FECHA_HORA, TRN_LOG)
    VALUES(
    SEC_TBL_BITACORA.NEXTVAL,
    'TBL_PERSONA',
    SYS_CONTEXT ('USERENV', 'OS_USER'),
    SYSDATE,
     'SE BORRARON LOS DATOS DEL REGISTRO CON ID = '|| TO_CHAR (:OLD.ID_PERSONA)||' 
    VALORES ATERIORES= '||'ID_TIPO_DOCUMENTO ='''|| TO_CHAR (:OLD.id_tipo_documento)||''', PRIMER_NOMBRE= '''||TO_CHAR (:OLD.primer_nombre)||''', SEGUNDO_NOMBRE= '''||
     TO_CHAR (:OLD.segundo_nombre)||''', TERCER_NOMBRE= '''||TO_CHAR (:OLD.tercer_nombre)||''', PRIMERO_APELLIDO= '''|| TO_CHAR (:OLD.primero_apellido)||''', SEGUNDO_APELLIDO= '''||
     TO_CHAR (:OLD.segundo_apellido)||''', DOCUMENTO= '''||TO_CHAR (:OLD.documento)||''', NIT= '''||TO_CHAR (:OLD.nit)||''', FECHA_NACIMIENTO= '''|| TO_CHAR (:OLD.fecha_nacimiento)||
     ''', SEXO= '''|| TO_CHAR (:OLD.sexo)||''', TELEFONO= '''|| TO_CHAR (:OLD.telefono)||''', EMAIL= '''||TO_CHAR (:OLD.email)||''', RAZON_SOCIAL= '''|| TO_CHAR (:OLD.razon_social)||
     ''', DIRECCION= '''|| TO_CHAR (:OLD.direccion)
   );
END;
/

UPDATE

create or replace  TRIGGER TGR_BITACORA_AFTER_UPDATE_PERSONA
AFTER UPDATE ON TBL_PERSONA REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW
BEGIN  
    INSERT INTO TBL_BITACORA (ID_TRANSACCION,BIT_TABLA_PRINCIPAL,TRN_USUARIO,TRN_FECHA_HORA, TRN_LOG)
    VALUES(
    SEC_TBL_BITACORA.NEXTVAL,
    'TBL_PERSONA',
    SYS_CONTEXT ('USERENV', 'OS_USER'),
   SYSDATE,
    'SE ACTUALIZARON LOS DATOS DEL REGISTRO CON ID = '|| TO_CHAR (:OLD.ID_PERSONA)||' 
    VALORES ATERIORES= '||'ID_TIPO_DOCUMENTO ='''|| TO_CHAR (:OLD.id_tipo_documento)||''', PRIMER_NOMBRE= '''||TO_CHAR (:OLD.primer_nombre)||''', SEGUNDO_NOMBRE= '''||
     TO_CHAR (:OLD.segundo_nombre)||''', TERCER_NOMBRE= '''||TO_CHAR (:OLD.tercer_nombre)||''', PRIMERO_APELLIDO= '''|| TO_CHAR (:OLD.primero_apellido)||''', SEGUNDO_APELLIDO= '''||
     TO_CHAR (:OLD.segundo_apellido)||''', DOCUMENTO= '''||TO_CHAR (:OLD.documento)||''', NIT= '''||TO_CHAR (:OLD.nit)||''', FECHA_NACIMIENTO= '''|| TO_CHAR (:OLD.fecha_nacimiento)||
     ''', SEXO= '''|| TO_CHAR (:OLD.sexo)||''', TELEFONO= '''|| TO_CHAR (:OLD.telefono)||''', EMAIL= '''||TO_CHAR (:OLD.email)||''', RAZON_SOCIAL= '''|| TO_CHAR (:OLD.razon_social)||
     ''', DIRECCION= '''|| TO_CHAR (:OLD.direccion)||
     
     
     'A VALORES NUEVOS= ID_TIPO_DOCUMENTO ='''|| TO_CHAR (:NEW.id_tipo_documento)||''', PRIMER_NOMBRE='''||TO_CHAR (:NEW.primer_nombre)||''', SEGUNDO_NOMBRE'''||
     TO_CHAR (:NEW.segundo_nombre)||''', TERCER_NOMBRE='''||TO_CHAR (:NEW.tercer_nombre)||''', PRIMERO_APELLIDO'''|| TO_CHAR (:NEW.primero_apellido)||''', SEGUNDO_APELLIDO'''|| TO_CHAR (:NEW.segundo_apellido)||
     ''', DOCUMENTO='''||TO_CHAR (:NEW.documento)||''', NIT='''||TO_CHAR (:NEW.nit)||''', FECHA_NACIMIENTO='''|| 'TO_DATE('||TO_CHAR (:NEW.fecha_nacimiento)||''',YYYY-MM-DD HH24:MI:SS'')'||
     ''', SEXO='''|| TO_CHAR (:NEW.sexo)||''', TELEFONO='''|| TO_CHAR (:NEW.telefono)||''', EMAIL='''||TO_CHAR (:NEW.email)||''', RAZON_SOCIAL='''|| TO_CHAR (:NEW.razon_social)||
     ''', DIRECCION='''|| TO_CHAR (:NEW.direccion)
     );
END;