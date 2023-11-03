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