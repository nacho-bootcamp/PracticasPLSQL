---------------------------Práctica de TRIGGERS--------------------------------

/*1. Crear un TRIGGER BEFORE DELETE sobre la tabla EMPLOYEES que 
impida borrar un registro si su JOB_ID es algo relacionado con CLERK*/

CREATE OR REPLACE TRIGGER JOB_ID BEFORE
 DELETE ON  EMPLOYEES FOR EACH ROW
 BEGIN
 IF 
 :OLD.JOB_ID LIKE('%CLERK')
 THEN
 RAISE_APPLICATION_ERROR(-20320,'NADA');
 END IF;
 END;
 /
 
---PROBANDO
DELETE from employees where job_id LIKE ('%CLERK');
ALTER TRIGGER JOB_ID DISABLE;
 
 /*2. Crear una tabla denominada AUDITORIA con las siguientes columnas:*/ 

CREATE TABLE AUDITORIA (
USUARIO VARCHAR(50),
FECHA DATE,
SALARIO_ANTIGUO NUMBER,
SALARIO_NUEVO NUMBER);

/*3. Crear un TRIGGER BEFORE INSERT de tipo STATEMENT, de forma que 
cada vez que se haga un INSERT en la tabla REGIONS guarde una fila 
en la tabla AUDITORIA con el usuario y la fecha en la que se ha hecho el 
INSERT*/


CREATE TRIGGER AUDITORIA BEFORE INSERT ON REGIONS
BEGIN
INSERT INTO AUDITORIA (usuario, fecha)
VALUES (user,sysdate);
END;

----------PROBAR
INSERT INTO REGIONS VALUES (20,'Prueba');
SELECT USER FROM DUAL;
select * from auditoria;



























