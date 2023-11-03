-----------------------SINTAXIS DE EXCEPCIONES-------------------------------
-- EXITEN 2 TIPOS DE EXCEPCIONES 
--ORACLE Y USUARIO

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empl.first_name);
EXCEPTION
    WHEN ex1 THEN
        NULL;
    WHEN ex2 THEN
        NULL;
    WHEN OTHERS THEN
        NULL;
END;
/
---------------------EXCEPCIONES PREDEFINIDAS---------------------------------

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empl.first_name);
EXCEPTION
/*
NO_DATA_FOUND  
TO_MANY_ROWS DEVUELVE MAS DE UNA COLUMNA
ZERO_DIVIDE
DUP_VAL_ON_INDEX PK O UNIQUE REPETIDA
*/
    WHEN no_data_found THEN
        dbms_output.put_line('ERROR,EMPLEADO INEXISTENTE');
    WHEN too_many_row THEN
        dbms_output.put_line('ERROR,DEMASIADOS EMPLEADO');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;
/

------------------------EXCEEPCIONES NO PREDIFINIDAS------------------------
SET SERVEROUTPUT ON

DECLARE
    mi_excep EXCEPTION;
    PRAGMA exception_init ( mi_excep, -937 );
    v1 NUMBER;
    v2 NUMBER;
BEGIN
    SELECT
        employe_id,
        SUM(salary)
    INTO
        v1,
        v2
    FROM
        employees;

    dbms_output.put_line(v1);
EXCEPTION
    WHEN mi_excep THEN
        dbms_output.put_line('FUNCION DE GRUPO INCORRECTA');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;
/

--------------------------SQLCODE Y SQLERRM------------------------------------
SET SERVEROUTPUT  ON

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees;

    dbms_output.put_line(empl.salary);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode); -- DEVUELVE EL CODIGO DEL ERROR
        dbms_output.put_line(sqlerrm); -- DEVUELVE EL MENSAJE DEL ERROR
END;
/
---------------------------CONTROL SQL CON EXCEPCIONES--------------------------

SET SERVEROUTPUT ON

DECLARE
    reg         regions%rowtype;
    reg_control regions.region_id%TYPE;
BEGIN
    reg.region_id := 100;
    reg.region_name := 'AFRICA';
    SELECT
        region_id
    INTO reg_control
    FROM
        regions
    WHERE
        region_id = reg.region_id;

    dbms_output.put_line('LA REGION YA EXISTE');
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO regions VALUES (
            reg.region_id,
            reg.region_name
        );

        COMMIT;
END;
/
-----------------------EXCEPCIONES PERSONALIZADAS -----------------------------
SET SERVEROUTPUT ON

DECLARE
    reg_max EXCEPTION;
    regn NUMBER;
    regt VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'OCEANIA';
    IF regn > 100 THEN
        RAISE reg_max;
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN reg_max THEN
        dbms_output.put_line('LA REGION NO PUEDE SER MAYOR DE 100');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;
/
---------------------------AMBITO DE LAS EXCEPCIONES---------------------------

SET SERVEROUTPUT ON

DECLARE
    regn NUMBER;
    regt VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'OCEANIA';
    DECLARE
        reg_max EXCEPTION;
    BEGIN
        IF regn > 100 THEN
            RAISE reg_max;
        ELSE
            INSERT INTO regions VALUES (
                regn,
                regt
            );

            COMMIT;
        END IF;
    EXCEPTION
        WHEN reg_max THEN
            dbms_output.put_line('LA REGION NO PUEDE SER MAYOR DE 100');
    END;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;
/

--------------------COMANDO RAISE_APPLICATION_ERROR-----------------------------
SET SERVEROUTPUT ON

DECLARE
    regn NUMBER;
    regt VARCHAR2(200);
BEGIN
    regn := 101;
    regt := 'ASIA';
    IF regn > 100 THEN
--EL CODIGO DEBE ESTAR ENTRE -20000 Y -20999
        raise_application_error(-20001, 'LA ID NO PUEDE SER MAYOR DE 100');
    ELSE
        INSERT INTO regions VALUES (
            regn,
            regt
        );

        COMMIT;
    END IF;

END;