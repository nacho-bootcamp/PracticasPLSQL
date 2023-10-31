-------------------------INTRODUCCION A PACKAGES--------------------------------

/* los paquetes en pl/sql estan compuestos por dos componente el SPEC y el
es el body

SPEC => VARIABLES DECLARADAS PROCEDIMIENTO PUBLICOS, SIEMPRE ES OBLIGATORIO

BODY => VARIABLES ,CODIGO,PROC,FUNC PROCEDIMIENTOS PRIVADOS
NO ES OBLIGATORIO
*/

-------------------CREAR LAS ESPECIFICACIONES DE UN PAQUETE---------------------
CREATE OR REPLACE PACKAGE pack1 IS
    v1 NUMBER;
    v2 VARCHAR2(100);
END;
/

--------------------AMBITO DE LAS VARIABLES EN UN PACKETE-----------------------
CREATE OR REPLACE PACKAGE pack1 IS
    v1 NUMBER := 10;
    v2 VARCHAR2(100);
END;
/
/*puedo crear variables globales en toda la app que perciba durante la sesion*/

------------------------CREAR EL CUERPO DE UN PAQUETE---------------------------
CREATE OR REPLACE PACKAGE pack1 
IS
    PROCEDURE convert (
        name            VARCHAR2,
        conversion_type CHAR
    );

END;
/

CREATE OR REPLACE PACKAGE BODY pack1 IS

    FUNCTION up (name VARCHAR2)
    RETURN VARCHAR2 
    IS
    BEGIN
        RETURN upper(name);
    END up;


    FUNCTION do (name VARCHAR2) 
    RETURN VARCHAR2 
    IS
    BEGIN
        RETURN lower(name);
    END do;

    PROCEDURE convert (name VARCHAR2,conversion_type CHAR)
    IS
    BEGIN
        IF conversion_type = 'U' THEN
            dbms_output.put_line(up(name));
        ELSIF conversion_type = 'L' THEN
            dbms_output.put_line(do(name));
        ELSE
            dbms_output.put_line('EL PARAMETRO DEBE SER U O L');
        END IF;
    END convert;

END pack1;