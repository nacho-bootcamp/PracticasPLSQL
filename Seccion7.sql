-----------------------------SELECT---------------------------------------------
SET SERVEROUTPUT ON

DECLARE
    salario NUMBER;
    nombre  employees.first_name%TYPE;
BEGIN
    SELECT --solo puede devolver una fila
        salary,
        first_name
    INTO
        salario,
        nombre
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(salario
                         || ' Y '
                         || nombre);
END;
/
----------------------------%ROWTYPE------------------------------------------
SET SERVEROUTPUT ON

DECLARE
    salario   NUMBER;
    nombre    employees.first_name%TYPE;
    empleados employees%rowtype;
BEGIN
    SELECT --solo puede devolver una fila
        *
    INTO empleados
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleados.salary
                         || ' Y '
                         || empleados.first_name);
END;
/
-------------------------------INSERT------------------------------------------
SET SERVEROUTPUT ON

DECLARE
    col1 test.c1%TYPE;
BEGIN
    col1 := 20;
    INSERT INTO test VALUES (
        col1,
        'BBBB'
    );

    COMMIT;
END;
/
-------------------------------UPDATE------------------------------------

SET SERVEROUTPUT ON

DECLARE
    t test.c1%TYPE;
BEGIN
    t := 1;
    UPDATE test
    SET
        c2 = 'CCCCC'
    WHERE
        c1 = t;

    COMMIT;
END;
/
-------------------------------DELETE----------------------------------------
SET SERVEROUTPUT ON

DECLARE
    t test.c1%TYPE;
BEGIN
    t := 1;
    DELETE FROM test
    WHERE
        c1 = t;

    COMMIT;
END;
/

SELECT * FROM test;