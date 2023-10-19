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