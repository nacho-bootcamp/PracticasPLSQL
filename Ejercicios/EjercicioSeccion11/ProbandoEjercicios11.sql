/*1- Crear un procedimiento llamado “visualizar” que visualice el nombre y
salario de todos los empleados.
*/
SET SERVEROUTPUT ON

BEGIN
    visualizar;
END;
/
/*2- Modificar el programa anterior para incluir un parámetro que pase el
número de departamento para que visualice solo los empleados de ese
departamento
• Debe devolver el número de empleados en una variable de tipo OUT*/

set SERVEROUTPUT ON

DECLARE
    x NUMBER;
BEGIN
    x := 10;
    visualizar(70, x);
    dbms_output.put_line('El número de empleados es:' || x);
END;
/
-------------------------------Práctica de FUNCIONES----------------------------

/*1. Crear una función que tenga como parámetro un número de departamento y que 
devuelve la suma de los salarios de dicho departamento. La imprimimos por pantalla.
• Si el departamento no existe debemos generar una excepción
con dicho mensaje
• Si el departamento existe, pero no hay empleados dentro,
también debemos generar una excepción para indicarlo*/
--Probando
SET SERVEROUTPUT ON

DECLARE
    sal  NUMBER;
    dept NUMBER := 100;
BEGIN
    sal := salarios_dept(dept);
    dbms_output.put_line('El salario total del departamento '
                         || dept
                         || ' es: '
                         || sal);
END;
/ 
/*2. Modificar el programa anterior para incluir un parámetro de tipo OUT por 
el que vaya el número de empleados afectados por la query. Debe ser 
visualizada en el programa que llama a la función. De esta forma vemos 
que se puede usar este tipo de parámetros también en una función */

set serveroutput on

DECLARE
    total_sal NUMBER;
    num_emple NUMBER;
    dept      NUMBER := 110;
BEGIN
    total_sal := salarios_dept1(dept, num_emple);
    dbms_output.put_line('El salario total del departamento '
                         || dept
                         || ' es: '
                         || total_sal);
    dbms_output.put_line('El número total de empleados recabados 
es : ' || num_emple);
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

DECLARE
N_REGION NUMBER;
BEGIN
N_REGION:=crear_region('NORMANDIA');
DBMS_OUTPUT.PUT_LINE('EL NUMERO ASIGNADO 
ES:'||N_REGION);
END;
/