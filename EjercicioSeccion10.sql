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
/

/*• 2- Vamos averiguar cuales son los JEFES (MANAGER_ID) de cada 
departamento. En la tabla DEPARTMENTS figura el MANAGER_ID de cada 
departamento, que a su vez es también un empleado. Hacemos un bloque con 
dos cursores. (Esto se puede hacer fácilmente con una sola SELECT pero vamos 
a hacerlo de esta manera para probar parámetros en cursores). 
o El primero de todos los empleados 
o El segundo de departamentos, buscando el MANAGER_ID con el 
parámetro que se le pasa. 
o Por cada fila del primero, abrimos el segundo cursor pasando el 
EMPLOYEE_ID 
o Si el empleado  es MANAGER_ID en algún departamento debemos 
pintar el Nombre del departamento y el nombre del MANAGER_ID 
diciendo que es el jefe. 
o Si el empleado no es MANAGER de ningún departamento debemos 
poner “No es jefe de nada” */

SET SERVEROUTPUT ON

DECLARE
    departamento departments%rowtype;
    jefe         departments.manager_id%TYPE;
    CURSOR c1 IS
    SELECT
        *
    FROM
        employees;

    CURSOR c2 (
        j departments.manager_id%TYPE
    ) IS
    SELECT
        *
    FROM
        departments
    WHERE
        manager_id = j;

BEGIN
    FOR empleado IN c1 LOOP
        OPEN c2(empleado.employee_id);
        FETCH c2 INTO departamento;
        IF c2%notfound THEN
            dbms_output.put_line(empleado.first_name || ' No es JEFE de 
NADA');
        ELSE
            dbms_output.put_line(empleado.first_name
                                 || 'ES JEFE DEL 
DEPARTAMENTO '
                                 || departamento.department_name);
        END IF;

        CLOSE c2;
    END LOOP;
END;