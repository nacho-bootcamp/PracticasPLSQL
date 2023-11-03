--------------------PRACTICA CON EXCEPCIONES-----------------------------------
/*1- Crear una SELECT (no un cursor explícito) que devuelva el nombre de un 
empleado pasándole el EMPLOYEE_ID en el WHERE,   
• Comprobar en primer lugar que funciona pasando un empleado 
existente 
• Pasar un empleado inexistente y comprobar que genera un error 
• Crear una zona de EXCEPTION controlando el NO_DATA_FOUND 
para que pinte un mensaje como “Empleado inexistente”*/

SET SERVEROUTPUT ON

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id = 101000;

    dbms_output.put_line(empl.first_name);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('ERROR,EMPLEADO INEXISTENTE');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;
/

/*2- Modificar la SELECT para que devuelva más de un empleado, por ejemplo 
poniendo EMPLOYEE_ID> 100. Debe generar un error. Controlar la 
excepción para que genere un mensaje como “Demasiados empleados 
en la consulta” */

SET SERVEROUTPUT ON

DECLARE
    empl employees%rowtype;
BEGIN
    SELECT
        *
    INTO empl
    FROM
        employees
    WHERE
        employee_id > 100;

    dbms_output.put_line(empl.first_name);
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('ERROR,DEMASIADOS EMPLEADOS');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;
/

/*3- Modificar la consulta para que devuelva un error de división por CERO, 
por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos 
por 0. En este caso, en vez de controlar la excepción directamente, 
creamos una sección WHEN OTHERS y pintamos el error con SQLCODE 
y SQLERR */

DECLARE
    salario NUMBER;
BEGIN
    SELECT
        salary
    INTO salario
    FROM
        employees
    WHERE
        employee_id = 100;

    salario := salario / 0;
    dbms_output.put_line(salario);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe el empleado.');
    WHEN too_many_rows THEN
        dbms_output.put_line('Empleado duplicado.');
    WHEN OTHERS THEN
        dbms_output.put_line('CODIGO:' || sqlcode);
        dbms_output.put_line('MENSAJE:' || sqlerrm);
END;
/

/*4- El error -00001 es clave primaria duplicada.  
a. Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos 
a crear una excepción no -predefinida que haga lo mismo.  
b. Vamos a usar la tabla REGIONS para hacerlo más fácil  
c. Usamos PRAGMA EXCEPTION_INIT y creamos una excepción 
denominada “duplicado”.  
d. Cuando se genere ese error debemos pintar “Clave duplicada, 
intente otra”. */

SET SERVEROUTPUT ON

DECLARE
    duplicado EXCEPTION;
    PRAGMA exception_init ( duplicado, -00001 );
    region regions.region_id%TYPE;
BEGIN
    region := 1;
    INSERT INTO regions VALUES (
        region,
        'JUJUY'
    );

EXCEPTION
    WHEN duplicado THEN
        dbms_output.put_line('CLAVE DUPLICADA, INTENTA OTRA');
END;
/
/*------------------------Práctica  con EXCEPCIONES DE USUARIO --------------*/
/*1- Crear 
una 
Excepción 
CONTROL_REGIONES. 
personalizada 
denominada 
• Debe dispararse cuando al insertar o modificar una región 
queramos poner una clave superior a 200. Por ejemplo usando una 
variable con ese valor. 
• En ese caso debe generar un texto indicando algo así como 
“Codigo no permitido. Debe ser inferior a 200” 
• Recordemos que las excepciones personalizadas deben 
dispararse de forma manual con el RAISE. */

SET SERVEROUTPUT ON

DECLARE
    control_regiones EXCEPTION;
    num_region regions.region_id%TYPE;
    region     regions%rowtype;
BEGIN
    region.region_name := 'BRASIL';
    num_region := 201;
    IF num_region > 200 THEN
        RAISE control_regiones;
    ELSE
        INSERT INTO regions VALUES (
            num_region,
            region.region_name
        );

        COMMIT;
    END IF;

EXCEPTION
    WHEN control_regiones THEN
        dbms_output.put_line('Codigo no permitido. Debe ser inferior a 200');
    WHEN OTHERS THEN
        dbms_output.put_line('ERROR INDEFINIDO');
END;
/

---------------------Práctica  con RAISE_APPLICATION_ERROR ------------------
/*1. Modificar la practica anterior para disparar un error con RAISE_APPLICATION 
en vez de con PUT_LINE.  
a. Esto permite que la aplicación pueda capturar y gestionar el error que 
devuelve el PL/SQL */

SET SERVEROUTPUT ON

DECLARE
    num_region regions.region_id%TYPE;
    region     regions%rowtype;
BEGIN
    region.region_name := 'BRASIL';
    num_region := 201;
    IF num_region > 200 THEN
        raise_application_error(-20002, 'Codigo no permitido. Debe ser inferior a 200');
    ELSE
        INSERT INTO regions VALUES (
            num_region,
            region.region_name
        );

        COMMIT;
    END IF;

END;
/