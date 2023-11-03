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
    nacimiento := TO_DATE ( '30-04-2001', 'DD-MM-YYYY' );
    dbms_output.put_line('MI NOMBRE ES '
                         || name
                         || ' TENGO '
                         || edad
                         || ' AÑOS'
                         || ' Y NACI EL '
                         || nacimiento);

END;

/*                Práctica adicional Variables y Constantes                 */

/* 
_El impuesto será del 21%. Le debemos poner en una constante.
_Creamos una variable de tipo number (5,2) para poner el precio del 
producto.
_Creamos otra variable para el resultado. Le decimos que es del 
mismo tipo (type) que la anterior.
_Hacemos el cálculo y visualizamos el resultado.
*/

DECLARE
    impuesto       CONSTANT NUMBER := 21;
    precioproducto NUMBER(5.2);
    resultado      precioproducto%TYPE;
BEGIN
    precioproducto := 65.8;
    resultado := precioproducto * impuesto / 100;
    dbms_output.put_line(resultado);
END;
/*                    Prácticas Bloques anidados                      */

/*1_ Indicar que valores visualiza X en los 3 casos de 
DBMS_OUTPUT.PUT_LINE(x) en este ejemplo*/
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
    DECLARE
        x NUMBER := 20;
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;

/*10,20,10*/

/*.2_ ¿Es este bloque correcto? Si no es así ¿por qué falla?*/
BEGIN
    dbms_output.put_line(x);
    DECLARE
        x NUMBER := 20;
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;
/*ESTA FALLANDO PORQUE LA VARIABLE ESTA DECLARADA EN EL BLOQUE HIJO Y NO PUEDE
SER UTILIZADA EN EL BLOQUE PADRE
*/

/*3_  ¿Es este bloque correcto? Si es así ¿qué valores visualiza X?*/

SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;
// 10,10,10

/*                     Prácticas funciones SQL en PL/SQL   */

/*1_  Visualizar iniciales de un nombre
• Crea un bloque PL/SQL con tres variables VARCHAR2: 
o Nombre
o apellido1
o apellido2
• Debes visualizar las iniciales separadas por puntos.
• Además siempre en mayúscula
• Por ejemplo alberto pérez García debería aparecer--> A.P.G*/

SET SERVEROUTPUT ON

DECLARE

NOMBRE VARCHAR2(20);
APELLIDO1 VARCHAR2(20);
APELLIDO2 VARCHAR2(20);
RESULTADO VARCHAR(10);

BEGIN

NOMBRE:='ignacio';
APELLIDO1:='cardozo';
APELLIDO2:='jerez';

RESULTADO :=SUBSTR(NOMBRE,1,1) ||'.'||SUBSTR(APELLIDO1,1,1)||'.'||SUBSTR(APELLIDO2,1,1);

DBMS_OUTPUT.PUT_LINE(UPPER(RESULTADO));

END;

/*2_Averiguar el nombre del día que naciste, por ejemplo "Martes"
• PISTA (Función TO_CHAR)*/

SET SERVEROUTPUT ON

DECLARE

FECHA DATE;
RESULTADO VARCHAR2(10);

BEGIN

FECHA:='30-04-2001';
resultado:=TO_CHAR(FECHA,'DAY');

DBMS_OUTPUT.PUT_LINE(UPPER(RESULTADO));

END;



















