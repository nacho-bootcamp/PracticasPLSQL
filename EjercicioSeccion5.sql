/*                       PRACTICAS ORACLE PL/SQL*/

/*2_Crear dos variables de tipo numérico y visualizar su suma*/

SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 4;
    y NUMBER := 3;
BEGIN
    dbms_output.put_line(x + y);
END;


/*3_Modificar el ejemplo anterior y ponemos null como valor de una de las 
variables. ¿Qué resultado arroja? Volvemos a ponerla un valor numérico*/

DECLARE
    x NUMBER := 4;
    y NUMBER := 3;
BEGIN
    x := NULL;
    dbms_output.put_line(x + y);
END;

/*4_Añadir una constante al ejercicio. Sumamos las 2 variables y la 
constantes. Intentar modificar la constante. ¿Es posible?*/
/*NO SE PUEDE MODIFICAR UNA CONSTANTE*/

DECLARE
    a CONSTANT NUMBER := 4;
    b NUMBER := 3;
BEGIN
    a := 3;
    dbms_output.put_line(a + b);
END;

/*5_Crear un bloque anónimo que tenga una variable de tipo VARCHAR2 con 
nuestro nombre, otra numérica con la edad y una tercera con la fecha de 
nacimiento. Visualizarlas por separado y luego intentar concatenarlas. ¿es 
posible?*/

DECLARE
    name       VARCHAR2(100);
    edad       NUMBER;
    nacimiento DATE;
BEGIN
    name := 'IGNACIO';
    edad := 22;
    nacimiento := TO_DATE ('30-04-2001','DD-MM-YYYY');
    dbms_output.put_line('MI NOMBRE ES '
                         || name
                         || ' TENGO '
                         || edad ||' AÑOS' 
                         || ' Y NACI EL '
                         || nacimiento);

END;