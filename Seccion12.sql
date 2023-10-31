-------------------------INTRODUCCION A PACKAGES--------------------------------

/* los paquetes en pl/sql estan compuestos por dos componente el SPEC y el
es el body

SPEC => VARIABLES DECLARADAS PROCEDIMIENTO PUBLICOS, SIEMPRE ES OBLIGATORIO

BODY => VARIABLES ,CODIGO,PROC,FUNC PROCEDIMIENTOS PRIVADOS
NO ES OBLIGATORIO
*/

-------------------CREAR LAS ESPECIFICACIONES DE UN PAQUETE---------------------
CREATE OR REPLACE PACKAGE PACK1
IS
V1 NUMBER;
V2 VARCHAR2(100);
END;
/