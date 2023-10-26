-----------------------Práctica de PROCEDIMIENTOS Y PARÁMETROS------------------
/*1- Crear un procedimiento llamado “visualizar” que visualice el nombre y
salario de todos los empleados.
*/

CREATE OR REPLACE PROCEDURE visualizar IS

    CURSOR c1 IS
    SELECT
        first_name,
        salary
    FROM
        employees;

    nombre  employees.first_name%TYPE;
    salario employees.salary%TYPE;
BEGIN
    FOR i IN c1 LOOP
        dbms_output.put_line(i.first_name
                             || '  '
                             || i.salary);
    END LOOP;
END;
/
/*2- Modificar el programa anterior para incluir un parámetro que pase el
número de departamento para que visualice solo los empleados de ese
departamento
• Debe devolver el número de empleados en una variable de tipo OUT*/

CREATE OR REPLACE PROCEDURE visualizar (
    departamento NUMBER,
    numero       OUT NUMBER
) IS

    CURSOR c1 IS
    SELECT
        first_name,
        salary
    FROM
        employees
    WHERE
        department_id = departamento;

    nombre  employees.first_name%TYPE;
    salario employees.salary%TYPE;
BEGIN
    numero := 0;
    FOR i IN c1 LOOP
        dbms_output.put_line(i.first_name
                             || ' '
                             || i.salary);
        numero := numero + 1;
    END LOOP;

END;