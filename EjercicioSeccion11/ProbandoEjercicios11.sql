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