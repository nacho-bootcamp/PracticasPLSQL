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



























