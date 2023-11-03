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
/
-----------------USAR FUNCIONES  DE UN PAQUETE EN COMANDOS---------------------

CREATE OR REPLACE PACKAGE pack1 
IS
    FUNCTION convert (
        name            VARCHAR2,
        conversion_type CHAR
    ) RETURN VARCHAR2;

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

    FUNCTION convert (name VARCHAR2,conversion_type CHAR) RETURN VARCHAR2
    IS
    BEGIN
        IF conversion_type = 'U' THEN
            RETURN(up(name));
        ELSIF conversion_type = 'L' THEN
            RETURN(do(name));
        ELSE
            dbms_output.put_line('EL PARAMETRO DEBE SER U O L');
        END IF;
    END convert;

END pack1;
/

--------------------------PAQUETES PREDEFINIDOS POR ORACLE----------------------
/*
UTL_FILE => PERMITE TRABAJAR CON FICHEROS DE TEXTO EXTERNOS A LA BASES
UTL => GESTIONAR CORREOS
DBMS_ALERT => PARA PONER ALERTAS
DBMS_LOCK => PARA TRABAJAR CON BLOQUEOS
DBMS_SESSION => PARA PODER TRABAJAR,VER Y CONFIGURAR SESIONES DE USUARIOS HTTP
DBMS_APPLICATION_INFO =>
HTP => GENERAR PAGINAS WEB DE MANERA AUTOMATICA PLANIFICADOR
DBMS_SCHEDULER =>

DATABASE PL/SQL PACKAGES AND TYPES REFERENCE
*/

-------------------------------PAQUETE UTL_FILE-------------------------------

DESC UTL_FILE -- MUESTRA LA DESCRIPCION DEL UTL_FILE

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE READ_FILE IS

STRING VARCHAR2(32764);
VFILE UTL_FILE.FILE_TYPE;

BEGIN
--OPEN FILE
VFILE:=UTL_FILE.fopen('EXERCISES','F1.TXT','R');
LOOP
BEGIN
--READ LINE
UTL_FILE.GET_LINE(VFILE,STRING);
INSERT INTO F1 VALUES(STRING);
EXCEPTION
WHEN NO_DATA_FOUND THEN EXIT;
END;
END LOOP;
--CLOSE FILE
UTL_FILE.FCLOSE(VFILE);
END;
/





























