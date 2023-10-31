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