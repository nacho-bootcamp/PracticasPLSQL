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
/**puedo crear variables globales en toda la app que perciba durante la sesion/