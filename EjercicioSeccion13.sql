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
 
 























