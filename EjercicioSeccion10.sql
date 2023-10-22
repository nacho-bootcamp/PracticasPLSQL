-----------------------------PRÁCTICAS CON CURSORES ---------------------------
/*• 1-Hacer un programa que tenga un cursor que vaya visualizando los salarios de 
los empleados. Si en el cursor aparece el jefe (Steven King) se debe generar un 
RAISE_APPLICATION_ERROR indicando que el sueldo del jefe no se puede 
ver. */
SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

BEGIN
    FOR i IN c1 LOOP
        IF
            i.first_name = 'Steven'
            AND i.last_name = 'King'
        THEN
            raise_application_error(-20300, 'El salario del jefe no puede ser visto');
        ELSE
            dbms_output.put_line(i.first_name
                                 || ' '
                                 || i.last_name
                                 || ': '
                                 || i.salary
                                 || 'DLS');
        END IF;
    END LOOP;
END;