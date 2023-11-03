-------------------------PRACTICA SELECT INTO---------------------------------
/*1. PRÁCTICA 1
• Crear un bloque PL/SQL que devuelva al salario máximo del
departamento 100 y lo deje en una variable denominada salario_maximo
y la visualice
*/

SET SERVEROUTPUT ON

DECLARE
    salario_maximo employees.salary%TYPE;
BEGIN
    SELECT
        MAX(salary)
    INTO salario_maximo
    FROM
        employees
    WHERE
        department_id = 100;

    dbms_output.put_line(salario_maximo);
END;
/

/*2. PRÁCTICA2
• Visualizar el tipo de trabajo del empleado número 100*/

SET SERVEROUTPUT ON

DECLARE
    empleado employees%rowtype;
BEGIN
    SELECT
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line(empleado.first_name);
END;
/

/*3. PRÁCTICA 3
• Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por
ejemplo 10.}
• Visualizar el nombre de ese departamento y el número de empleados
que tiene, poniendo. Crear dos variables para albergar los valores.*/

SET SERVEROUTPUT ON

DECLARE
    departamento employees.department_id%TYPE := 10;
    nombredepart departments.department_name%TYPE;
    num_empleado NUMBER;
BEGIN
    SELECT
        department_name
    INTO nombredepart
    FROM
        departments
    WHERE
        department_id = departamento;

    SELECT
        COUNT(*)
    INTO num_empleado
    FROM
        employees
    WHERE
        department_id = departamento;

    dbms_output.put_line('EL DEPARTAMENTO '
                         || departamento
                         || ' TIENE '
                         || num_empleado
                         || ' EMPLEADOS');

END;
/

/*4. PRÁCTICA 4
• Mediante dos consultas recuperar el salario máximo y el salario mínimo
de la empresa e indicar su diferencia*/

SET SERVEROUTPUT ON

DECLARE
    maximo     NUMBER;
    minimo     NUMBER;
    diferencia NUMBER;
BEGIN
    SELECT
        MAX(salary),
        MIN(salary)
    INTO
        maximo,
        minimo
    FROM
        employees;

    diferencia := maximo - minimo;
    dbms_output.put_line('VALOR MAXIMO = '||MAXIMO);
    dbms_output.put_line('VALOR MINIMO = '||MINIMO);
    dbms_output.put_line('DIFERENCIA = '||diferencia);
END;
/

----------------------------PRACTICA INSERT, UPDATE,DELETE---------------------

/*1- Crear un bloque que inserte un nuevo departamento en la tabla
DEPARTMENTS. Para saber el DEPARTMENT_ID que debemos asignar al
nuevo departamento primero debemos averiguar el valor mayor que hay en la
tabla DEPARTMENTS y sumarle uno para la nueva clave.
• Location_id debe ser 1000
• Manager_id debe ser 100
• Department_name debe ser “INFORMATICA”
• NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma
forma que lo hacemos en SQL. Por tanto, para validar definitivamente un
cambio debemos usar COMMIT*/

SET SERVEROUTPUT ON

DECLARE

NUMERODEPART  departments.DEPARTMENT_ID%TYPE;
LOCACION departments.LOCATION_ID%TYPE;
NOMBRE DEPARTMENTS.MANAGER_ID%TYPE;

BEGIN

SELECT MAX(DEPARTMENT_ID) INTO NUMERODEPART FROM departments;
DBMS_OUTPUT.PUT_LINE(NUMERODEPART);

numerodepart:= numerodepart+1;
DBMS_OUTPUT.PUT_LINE(NUMERODEPART);

INSERT INTO departments VALUES(NUMERODEPART,'INFORMATICA',100,1000);
COMMIT;
END;
/



/*2- Crear un bloque PL/SQL que modifique la LOCATION_ID del nuevo
departamento a 1700. En este caso usemos el COMMIT dentro del bloque
PL/SQL*/

SET SERVEROUTPUT ON

DECLARE

NUMERODEPART  departments.DEPARTMENT_ID%TYPE;

BEGIN

SELECT MAX(DEPARTMENT_ID) INTO NUMERODEPART FROM departments;
DBMS_OUTPUT.PUT_LINE(NUMERODEPART);

UPDATE  DEPARTMENTS SET  LOCATION_ID=1700 WHERE department_id=numerodepart;
COMMIT;
END;
/

SELECT * FROM departments WHERE department_id=271;

/*3- Por último, hacer otro bloque PL/SQL que elimine ese departamento nuevo.*/

SET SERVEROUTPUT ON

DECLARE

NUMERODEPART  departments.DEPARTMENT_ID%TYPE;

BEGIN

SELECT MAX(DEPARTMENT_ID) INTO NUMERODEPART FROM departments;
DBMS_OUTPUT.PUT_LINE(NUMERODEPART);

DELETE FROM departments WHERE department_id=numerodepart;
COMMIT;
END;
/



































