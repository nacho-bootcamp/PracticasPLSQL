--------------------COLECCIONES Y TIPOS COMPUESTOS-----------------------------
/*SON COMPUESTO QUE PUEDEN ALBERGAR MULTIPLES VALORES, A DIFERENCIA DE LOS 
ESCALARES QUE QUE SOLO PUEDEN TENER 1.

SON DE TIPO:
RECORDS: ES UN OBJETO QUE TIENE,UNA FILA CON DISTINTOS TIPOS DE DATOS.
COLLECTIONS: MIENTRAS QUE LAS COOLECCIONES NOS PERMITEN GUARDAR VALORES DEL
MISMO TIPO.

ARRAY ASOCIATIVOS(INDEX BY)
NESTED TABLES
VARRAYS

EJEMPLO:
*/
SET SERVEROUTPUT ON

DECLARE
    TYPE empleado IS RECORD (
            nombre  VARCHAR2(100),
            salario NUMBER,
            fecha   employees.hire_date%TYPE,
            datos   employees%rowtype
    );
    emple1 empleado;
BEGIN
    SELECT
        *
    INTO emple1.datos
    FROM
        employees
    WHERE
        employee_id = 100;

    emple1.nombre := emple1.datos.first_name
                     || ' '
                     || emple1.datos.last_name;

    emple1.salario := emple1.datos.salary * 0.80;
    emple1.fecha := emple1.datos.hire_date;
    dbms_output.put_line(emple1.nombre);
    dbms_output.put_line(emple1.salario);
    dbms_output.put_line(emple1.fecha);
    dbms_output.put_line(emple1.datos.first_name);
END;
/
----------------------INSERT Y UPDATE CON PL/SQL RECORDS------------------------

CREATE TABLE regiones22
    AS
        SELECT
            *
        FROM
            regions
        WHERE
            region_id = 0;

DECLARE
    reg1 regions%rowtype;
BEGIN
    SELECT
        *
    INTO reg1
    FROM
        regions
    WHERE
        region_id = 1;

    INSERT INTO regiones22 VALUES reg1;

END;
/

DECLARE
    reg1 regions%rowtype;
BEGIN
    reg1.region_id := 1;
    reg1.region_name := 'AUTRALIA';
    UPDATE regiones22
    SET
        row = reg1
    WHERE
        region_id = 1;

END;
/

----------------------------COLLECTION METODOS--------------------------------------
/*METODOS DE ARRAYS
EXISTS(N): DETECTAR SI EXISTE UN ELEMENTO
COUNT:NUMERO DE ELEMENTO
FIRST:DEVUELVE EL INDICE MAS PEQUEÑO
LAST:DEVUELVE EL INDICE MAS ALTO
PRIOR(N):DEVUELVE EL INDICE ANTERIOR A N
NEXT(N):DEVUELVE EL INDICE POSTERIOR A N
DELETE:BORRA TODO
DELETE(N):BORRA EL INDICE N
DELETE(M,N):BORRA DE LOS INDICE M A N
*/
-------------------------TRABAJAR CON ARRAY ASOCIATIVOS-------------------------
SET SERVEROUTPUT ON
DECLARE 
TYPE DEPARTAMENTOS IS TABLE OF
DEPARTMENTS.DEPARTMENT_NAME%TYPE
INDEX BY PLS_INTEGER;

TYPE EMPLEADOS IS TABLE OF
EMPLOYEES%ROWTYPE
INDEX BY PLS_INTEGER;

DEPTS DEPARTAMENTOS;
EMPLES EMPLEADOS;
BEGIN
--TIPOS SIMPLE
DEPTS(1):='INFORMATICA';
DEPTS(2):='RRHH';
DBMS_OUTPUT.PUT_LINE(DEPTS(1));
DBMS_OUTPUT.PUT_LINE(DEPTS(2));
DBMS_OUTPUT.PUT_LINE(DEPTS.LAST);
DBMS_OUTPUT.PUT_LINE(DEPTS.FIRST);
IF DEPTS.EXISTS(3) THEN
DBMS_OUTPUT.PUT_LINE(DEPTS(3));
ELSE 
DBMS_OUTPUT.PUT_LINE('ESE VALOR NO EXISTE');
END IF;

--TIPO COMPUESTO
SELECT * INTO EMPLES(1) FROM EMPLOYEES WHERE EMPLOYEE_ID=100;
DBMS_OUTPUT.PUT_LINE(EMPLES(1).FIRST_NAME);
DBMS_OUTPUT.PUT_LINE(EMPLES(1).LAST_NAME);
END;
/

----------------------SELECT MULTIPLES CON ARRAY ASOCIATIVOS---------------

SET SERVEROUTPUT ON

DECLARE 
TYPE DEPARTAMENTOS IS TABLE OF
DEPARTMENTS%ROWTYPE
INDEX BY PLS_INTEGER;

DEPTS DEPARTAMENTOS;

BEGIN
FOR I IN 1..10 LOOP
SELECT * INTO DEPTS(I) FROM departments WHERE DEPARTMENT_ID=I*10;
END LOOP;
FOR I IN DEPTS.FIRST..DEPTS.LAST LOOP
DBMS_OUTPUT.PUT_LINE(DEPTS(I).DEPARTMENT_NAME);
END LOOP;
END;




























