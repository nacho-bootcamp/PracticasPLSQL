--------------------introduccion a triggers------------------------------------
/*LOS TRIGGERS LO PUEDO UTILIZAR PARA AUDITORIA,PARA CONTROL , SEGURIDAD
PARA CAMBIAR LA LOGICA DE NEGOCIO
*/

----------------------TRIGGERS DML TIPOS EVENTOS--------------------------------
/*
TIPOS                 EVENTOS                   FILAS AFECTADAS

BEFORE                INSERT                  STATEMENT (SE DISPARA UNA VEZ)


AFTER      ===>       UPDATE                   ROW(SE DISPARA DEPENDIENDO LA FUNCION)


INSTEAD OF             DELETE

*/

----------------------------CREAR TRIGGERS------------------------------------

CREATE OR REPLACE TRIGGER INS_EMPL
AFTER INSERT ON REGIONS
BEGIN
INSERT INTO LOG_TABLE VALUES('INSERCION EN LA TABLA REGIONS',USER);
END;
/
---------------------------CREAR TRIGGERS CON EVENTOS--------------------------

CREATE OR REPLACE TRIGGER TR1_REGION
BEFORE INSERT OR UPDATE OR DELETE
ON REGIONS
BEGIN
IF USER <> 'HR' THEN
RAISE_APPLICATION_ERROR(-20000,'SOLO HR PUEDE MODIFICAR EN REGION');
END IF;
END;