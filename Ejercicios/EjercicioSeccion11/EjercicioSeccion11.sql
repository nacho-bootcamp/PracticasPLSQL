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
/
/*3- Crear un bloque por el cual se de formato a un número de cuenta
suministrado por completo, por ejmplo: 11111111111111111111
• Formateado a: 1111-1111-11-1111111111
• Debemos usar un parámetro de tipo IN-OUT*/
CREATE OR REPLACE PROCEDURE formateo_cuenta (
    numero IN OUT VARCHAR2
) IS

    guardar1 VARCHAR2(20);
    guardar2 VARCHAR2(20);
    guardar3 VARCHAR2(20);
    guardar4 VARCHAR2(20);
BEGIN
    guardar1 := substr(numero, 1, 4);
    guardar2 := substr(numero, 5, 4);
    guardar3 := substr(numero, 9, 2);
    guardar4 := substr(numero, 10);
    numero := guardar1
              || '-'
              || guardar2
              || '-'
              || guardar3
              || '-'
              || guardar4;

END;
/

-------------------------------Práctica de FUNCIONES----------------------------

/*1. Crear una función que tenga como parámetro un número de departamento y que 
devuelve la suma de los salarios de dicho departamento. La imprimimos por pantalla.
• Si el departamento no existe debemos generar una excepción
con dicho mensaje
• Si el departamento existe, pero no hay empleados dentro,
también debemos generar una excepción para indicarlo*/

CREATE OR REPLACE FUNCTION f1 (
    dep NUMBER
) RETURN NUMBER IS
    salario   NUMBER;
    depar     deparments.department_id%TYPE;
    num_emple NUMBER;
BEGIN
    SELECT
        department_id
    INTO depart
    FROM
        departments
    WHERE
        department_id = depar;

    SELECT
        COUNT(*)
    INTO num_emple
    FROM
        employees
    WHERE
        department_id = depar;

    IF dep > 0 THEN
        SELECT
            SUM(salary)
        INTO salario
        FROM
            employees
        WHERE
            department_id = dep
        GROUP BY
            department_id;

    ELSE
        raise_application_error(-20010, 'El departamento existe, pero no hay
empleados ' || dep);
    END IF;

    RETURN salario;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20730, 'No existe
el departamento ' || dep);
        end;
END;
/
/*2. Modificar el programa anterior para incluir un parámetro de tipo OUT por 
el que vaya el número de empleados afectados por la query. Debe ser 
visualizada en el programa que llama a la función. De esta forma vemos 
que se puede usar este tipo de parámetros también en una función */


CREATE OR REPLACE FUNCTION salarios_dept1(dep_id NUMBER, 
n_empleados OUT NUMBER) RETURN NUMBER 
IS 
sal NUMBER; 
BEGIN --COMPROBAR QUE EL DEPARTAMENTO EXISTE. SI NO 
EXISTE SE DISPARA LA EXCEPCIÓN 
SELECT DEPARTMENT_ID INTO DEPT FROM DEPARTMENTS 
WHERE DEPARTMENT_ID=DEP_ID; --SI EL DEPARTAMENTO EXISTE CALCULAR TOTALES 
SELECT sum(salary),count(salary) INTO SAL,n_empleados from 
employees where department_id=dep_id group by department_id; 
RETURN sal; 
END;
/
/*3. Crear una función llamada CREAR_REGION,
• A la función se le debe pasar como parámetro un nombre de 
región y debe devolver un número, que es el código de región 
que calculamos dentro de la función
• Se debe crear una nueva fila con el nombre de esa REGION
• El código de la región se debe calcular de forma automática. 
Para ello se debe averiguar cual es el código de región más 
alto que tenemos en la tabla en ese momento, le sumamos 1 y 
el resultado lo ponemos como el código para la nueva región 
que estamos creando.
• Si tenemos algún problema debemos generar un error
• La función debe devolver el número que ha asignado a la región*/

create or replace FUNCTION CREAR_REGION (nombre varchar2) 
RETURN NUMBER IS
regiones NUMBER;
NOM_REGION VARCHAR2(100);
BEGIN
--AVERIGUAR SI EXISTE LA REGIÓN. SI YA EXISTE DAMOS 
ERROR. SI NO EXISTE PASAMOS A EXCEPTION Y SEGUIMOS 
CON EL PROGRAMA
SELECT REGION_NAME INTO NOM_REGION FROM REGIONS 
WHERE REGION_NAME=UPPER(NOMBRE);
raise_application_error(-20321,'Esta región ya existe!');
EXCEPTION
-- SI LA REGION NO EXISTE LA INSERTAMOS. ES UN EJEMPLO 
DE COMO PODEMOS USAR LA EXCEPCION PARA HACER ALGO 
CORRECTO
WHEN NO_DATA_FOUND THEN
SELECT MAX(REGION_ID)+1 INTO REGIONES from REGIONS;
INSERT INTO REGIONS (region_id,region_name) VALUES 
(regiones,upper(nombre));
RETURN REGIONES;
END;
/






































