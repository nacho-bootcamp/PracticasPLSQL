-------------------CREAR LAS ESPECIFICACIONES DE UN PAQUETE---------------------
SET SERVEROUTPUT ON

BEGIN
    pack1.v1 := 100;
    dbms_output.put_line(pack1.v1);
END;
/

--------------------AMBITO DE LAS VARIABLES EN UN PACKETE-----------------------
SET SERVEROUTPUT ON

BEGIN
    pack1.v1 := pack1.v1 + 10;
    dbms_output.put_line(pack1.v1);
END;
/

------------------------CREAR EL CUERPO DE UN PAQUETE---------------------------
SET SERVEROUTPUT ON

BEGIN
    pack1.convert('NACHO', 'L');
      pack1.convert('nacho', 'U');
END;
/
-----------------USAR FUNCIONES  DE UN PAQUETE EN COMANDOS---------------------
SET SERVEROUTPUT ON
DECLARE 
V1 VARCHAR2(100);
BEGIN

V1:=pack1.convert('NACHO', 'L');
     DBMS_OUTPUT.PUT_LINE(V1);
END;
/

SELECT FIRST_NAME,pack1.convert(FIRST_NAME,'U') AS "CONVERTIDOR" FROM EMPLOYEES;

--------------------------SOBRECARGA DE PROCEDIMIENTO---------------------------
BEGIN
DBMS_OUTPUT.PUT_LINE(PACK2.COUNT_EMPLOYEES('IT'));
END;
/
-------------------------------PAQUETE UTL_FILE-------------------------------
BEGIN
read_file;
END;
/






































