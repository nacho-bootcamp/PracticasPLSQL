------------------------------JSON EN PL/SQL----------------------------------
SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;
 
DECLARE
C1 VARCHAR2(400);
BEGIN
SELECT
    prod1.datos.poblacion
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 2;

dbms_output.put_line(c1);

end;
/

---------------------------USAR FUNCIONES JSON EN PL/SQL------------------------

SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;
 
DECLARE
C1 VARCHAR2(400);
BEGIN
SELECT
    prod1.datos.poblacion
INTO c1
FROM
    productos1 prod1
WHERE
    codigo = 2;

dbms_output.put_line(c1);

SELECT JSON_VALUE(PROD1.DATOS,'$.pais') INTO C1 FROM PRODUCTOS1 PROD1 WHERE CODIGO=2;
dbms_output.put_line(c1);

--no soprta info de tipo escalar
SELECT JSON_VALUE(PROD1.DATOS,'$.direccion.calle') INTO C1 FROM PRODUCTOS1 PROD1 WHERE CODIGO=2;
dbms_output.put_line(c1);

--soporta info de tipo no escalar
SELECT JSON_query(PROD1.DATOS,'$.direccion') INTO C1 FROM PRODUCTOS1 PROD1 WHERE CODIGO=2;
dbms_output.put_line(c1);

-- se pone la columna concreta que querias (datos)
SELECT JSON_transform(datos,rename '$.poblacion'='pob') INTO C1 FROM PRODUCTOS1 PROD1 WHERE CODIGO=2;
dbms_output.put_line(c1);

end;
/

---------------------------------COMANDO PUT -----------------------------------

SET SERVEROUTPUT ON FORMAT WRAPPED LINE 100;
DECLARE 
JSON1 JSON_OBJECT_T;

BEGIN

--CONSTRUCTOR
JSON1:=JSON_OBJECT_T.PARSE('{"NOMBRE":"ALBERTO"}');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
--(FUNCION PL NO ES JSON)
-- PUT
--ESCALARES (DATOS SIMPLES)
JSON1.PUT('EDAD',29);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
JSON1.PUT('TELEFONO',99999);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--DOCUMENTO ANIDADO
--ASI NO SE HACE
JSON1.PUT('DIRECCION','{"CALLE":"PEZ","NUMERO":5,"CIUDAD":"MADRIRD"}');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ASI SI SE HACE
JSON1.PUT('DIRECCION',JSON_OBJECT_T('{"CALLE":"PEZ","NUMERO":5,"CIUDAD":"MADRIRD"}'));
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ARRAYS
JSON1.PUT('EXPERIENCIA',JSON_ARRAY_T('["EXCEL","WORD","LINUX","JAVA","CONSITI"]'));
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

END;
/

------------------------METODO PUT AÑADIR Y MODIFICAR JSON----------------------

SET SERVEROUTPUT ON FORMAT WRAPPED LINE 100;
DECLARE 
JSON1 JSON_OBJECT_T;
V1 VARCHAR2(400);

BEGIN

--CONSTRUCTOR
JSON1:=JSON_OBJECT_T.PARSE('{"NOMBRE":"ALBERTO"}');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
--(FUNCION PL NO ES JSON)
-- PUT
--ESCALARES (DATOS SIMPLES)
JSON1.PUT('EDAD',29);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
JSON1.PUT('TELEFONO',99999);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--DOCUMENTO ANIDADO
--ASI NO SE HACE
JSON1.PUT('DIRECCION','{"CALLE":"PEZ","NUMERO":5,"CIUDAD":"MADRIRD"}');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ASI SI SE HACE
JSON1.PUT('DIRECCION',JSON_OBJECT_T('{"CALLE":"PEZ","NUMERO":5,"CIUDAD":"MADRIRD"}'));
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ARRAYS
JSON1.PUT('EXPERIENCIA',JSON_ARRAY_T('["EXCEL","WORD","LINUX","JAVA","CONSITI"]'));
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ACTUALIZACION
JSON1.PUT('EDAD',45);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--RENOMBRAR CLAVE

JSON1.RENAME_KEY('NOMBRE','NOMBRE_COMPLETO');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--BORRAR UN ELEMENTO
JSON1.REMOVE('TELEFONO');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--SEREALIZACION
--RECUPERAR VALORES CONCRETOS

V1:=JSON1.GET_STRING('NOMBRE_COMPLETO');
DBMS_OUTPUT.PUT_LINE(V1);

V1:=JSON1.GET_NUMBER('NOMBRE_COMPLETO');
DBMS_OUTPUT.PUT_LINE(V1);

V1:=JSON1.GET_NUMBER('EDAD');
DBMS_OUTPUT.PUT_LINE(V1);

V1:=JSON1.GET_OBJECT('DIRECCION').GET_STRING('CALLE');
DBMS_OUTPUT.PUT_LINE(V1);

END;
/

--------------------TRABAJAR CON LA BASE DE DATOS-------------------------------

SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;
SELECT DATOS FROM PRODUCTOS1;

DECLARE
JSON1 JSON_OBJECT_T;
V1 VARCHAR2(4000);
RESULTADO VARCHAR2(4000);
BEGIN
SELECT DATOS INTO V1 FROM PRODUCTOS1 WHERE CODIGO=2;
DBMS_OUTPUT.PUT_LINE(V1);
JSON1:=JSON_OBJECT_T(V1);
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
JSON1.PUT('COL1','NUEVO_VALOR');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
RESULTADO:=JSON1.TO_STRING;
UPDATE PRODUCTOS1 SET DATOS=RESULTADO WHERE CODIGO=4;
END;
/

-----------------------------CREAR UN ARRAY JSON--------------------------------

--JSON_ARRAY_T
/*
APPEND PERMITE AÑADIR UN ELEMENTO AL ARRAY
APPEND_NULL
PUT
PUT_NULL
*/
SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;

DECLARE 
JSON1 JSON_ARRAY_T;
V1 VARCHAR2(4000);

BEGIN

JSON1:=JSON_ARRAY_T('["BMW","MERCEDES","CITROEN"]');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--NUMERO DE ELEMENTOS
DBMS_OUTPUT.PUT_LINE(JSON1.GET_SIZE);
END;
/

-----------------------RECUPERAR VALORES EN UN ARRAY JSON-----------------------

SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;

DECLARE 
JSON1 JSON_ARRAY_T;
V1 VARCHAR2(4000);

BEGIN

JSON1:=JSON_ARRAY_T('["BMW","MERCEDES","CITROEN"]');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--NUMERO DE ELEMENTOS
DBMS_OUTPUT.PUT_LINE(JSON1.GET_SIZE);

--RECUPERAR UN VALOR DEL ARRAY
DBMS_OUTPUT.PUT_LINE(JSON1.GET(0).TO_STRING);

--RECUPERAR TODOS LOS ELEMENTOS 
FOR X IN 0..JSON1.GET_SIZE-1 LOOP
DBMS_OUTPUT.PUT_LINE(JSON1.GET(X).TO_STRING);
END LOOP;

--ARRAY DE DOCUMENTOS
JSON1:=JSON_ARRAY_T('[
{"CIUDAD":"MADRID",
"CONCESIONARIO1":["BMW","MERCEDEZ","CITROEN"]
},
{"CIUDAD":"VALENCIA",
"CONSESIONARIO1":["HONDA","KIA","AUDI"]}
]');

--RECUPERAR EL TAMAÑO
DBMS_OUTPUT.PUT_LINE(JSON1.GET_SIZE);

--RECUPERAR UN VALOR
DBMS_OUTPUT.PUT_LINE(JSON1.GET(0).TO_STRING);

--RECUPERAR TODOS LOS ELEMENTOS 
FOR X IN 0..JSON1.GET_SIZE-1 LOOP
DBMS_OUTPUT.PUT_LINE(JSON1.GET(X).TO_STRING);
END LOOP;


--CREO NUEVO ARRAY
JSON1:=JSON_ARRAY_T('["BMW","MERCEDES","CITROEN"]');

--AÑADIR ELEMENTO
JSON1.APPEND('FORD');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--AGREGA UN NULO
JSON1.APPEND_NULL();
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);


--AGREGAR EN LA POSICION
JSON1.PUT(2,'RENAULT');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--ELIMINAR
JSON1.REMOVE(3);
JSON1.APPEND('FORD');
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);

--AÑADIR ARRAY
JSON1.PUT(3,JSON_ARRAY_T('["V1","V2","V3"]'));
DBMS_OUTPUT.PUT_LINE(JSON1.TO_STRING);
END;
/











































































