/*Estos bloques no se quedan guardados en la base de datos*/
SET SERVEROUTPUT ON
/*VARIABLE DE PL/SQL*/
DECLARE
    name     VARCHAR2(100);
    lastname VARCHAR2(100) := 'CARDOZO';
/*CONSTANTE NO CAMBIA SU VALOR*/
    x        CONSTANT NUMBER := 111;
/*NOT NULL NO NO PUEDE ESTAR VACIO IGUAL QUE LAS CONSTANTES Y SI
PUEDE CAMBIAR SU VALOR*/
    z        NUMBER NOT NULL := 12;
BEGIN
    name := 'IGNACIO';
    lastname := 'CARDOZO';
    dbms_output.put_line(name
                         || ' '
                         || lastname);
    dbms_output.put_line(100);
    dbms_output.put_line('IGNACIO ' || 'CARDOZO');
    dbms_output.put_line(x);
    dbms_output.put_line(z);
    z := 30;
    dbms_output.put_line(z);
END;
/*CRTOL+F7 SE FORMATEA TODO*/
/*   %TYPE TIPO DE*/

DECLARE
    x     NUMBER;
    z     x%TYPE;
    emple employees.salary%TYPE;
BEGIN
    emple := 100;
END;

/* OPERADORES MAS HABITUALES
+,-,/,*,**(EXPONENTE),||(CONCATENAR)
*/
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 5;
    z NUMBER := 10;
    a VARCHAR2(100) := 'EXAMPLE';
    d DATE := '10-01-1990';
BEGIN
    dbms_output.put_line(sysdate);
    dbms_output.put_line(d + 1);
END;

/*                 BLOQUES ANIDADOS*/

SET SERVEROUTPUT ON

BEGIN
    dbms_output.put_line('EN EL PRIMER BLOQUE');
    DECLARE
        x NUMBER := 10;
    BEGIN
        dbms_output.put_line(x);
    END;
END;

/*AMBITO DE VARIABLE EN BLOQUE ANIDADOS*/

SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 20; --GLOBAL
    z NUMBER := 30;
BEGIN
    dbms_output.put_line('X:= ' || x);
    DECLARE
        x NUMBER := 100; --LOCAL
        z NUMBER := 100;
        y NUMBER := 200;
    BEGIN
        dbms_output.put_line(x);
        dbms_output.put_line(z);
    END;

END;

/*USO DE SQL DENTRO DE PL/SQL*/

SET SERVEROUTPUT ON

DECLARE
    x     VARCHAR2(50);
    mayus VARCHAR2(100);
    fecha DATE;
    z     NUMBER := 109.80;
BEGIN
    x := 'ejemplo';
    dbms_output.put_line(substr(x, 1, 3));
    mayus := upper(x);
    dbms_output.put_line(mayus);
    fecha := sysdate;
    dbms_output.put_line(fecha);
    dbms_output.put_line(floor(z));
END;