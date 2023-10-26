-----------------------Práctica de PROCEDIMIENTOS Y PARÁMETROS------------------
/*1- Crear un procedimiento llamado “visualizar” que visualice el nombre y
salario de todos los empleados.
*/

CREATE OR REPLACE PROCEDURE VISUALIZAR IS

CURSOR C1 IS SELECT FIRST_NAME,SALARY FROM EMPLOYEES;
NOMBRE EMPLOYEES.FIRST_NAME%TYPE;
SALARIO EMPLOYEES.SALARY%TYPE;
BEGIN
FOR I IN C1 LOOP
DBMS_OUTPUT.PUT_LINE(I.FIRST_NAME||'  '||I.SALARY);
END LOOP;
END;