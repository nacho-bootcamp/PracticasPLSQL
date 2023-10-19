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