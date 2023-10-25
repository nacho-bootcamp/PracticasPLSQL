---------------------PROCEDIMIENTOS Y FUNCIONES--------------------------------

/*
1- CREACION EL ONJETO
   CODIGO FUENTE
   CODIGO PSEUDO-COMPILADO

2- INVOCAR EN CUALQUIER MOMENTO (SQL)

NOS PERMITE CREAR PROGRAMAS PL/SQL QUE GUARDAMOS DENTRO DE LA BASE DE DATOS Y
QUE LUEGO PODEMOS REUTILIZAR
*/

-----------------------------CREAR UN PROCEDIMIENTO----------------------------
--LOS BLOQUES ANONIMOS CUNADO LOS LANZO SE EJECUTAN PERO LOS PROCEDIMIENTOS NO
--CUANDO CREO UN PROCEDIMIENTO SE GUARDA EN LA BASE DE DATOS.
SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE PR1
IS
X NUMBER:=10;
BEGIN
DBMS_OUTPUT.PUT_LINE(X);
END;
/
----------------VER CODIGO FUENTES DE PROCEDIMIENTOS Y FUNCIONES----------------
--USER_OBJECTS

SELECT * FROM USER_OBJECTS WHERE OBJECT_TYPE='PROCEDURE'; 

SELECT OBJECT_TYPE,COUNT(*) FROM USER_OBJECTS GROUP BY OBJECT_TYPE;

SELECT * FROM USER_SOURCE WHERE NAME='PR1';

--------------------------PARAMETRO DE TIPO IN ---------------------------------
CREATE OR REPLACE PROCEDURE CALC_TAX
(EMPL IN EMPLOYEES.EMPLOYEE_ID%TYPE,
T1 IN NUMBER)
IS
TAX NUMBER:=0;
SAL NUMBER:=0;
BEGIN
 IF T1 < 0 OR T1 > 60 THEN
 RAISE_APPLICATION_ERROR(-20000,'EL PORCENTAJE DEBE ESTAR ENTRE 0 Y 60');
 END IF;
SELECT SALARY INTO SAL FROM EMPLOYEES WHERE EMPLOYEE_ID=EMPL;
TAX:=SAL*T1/100;
DBMS_OUTPUT.PUT_LINE('SALARY: '||SAL);
DBMS_OUTPUT.PUT_LINE('TAX: '||TAX);
EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('NO EXISTE EL EMPLEADO');
END;
/







































