-------------------PROBAR OBJETO--------------------------
SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;

DECLARE 
V1 PRODUCTO;
BEGIN
V1:=PRODUCTO(100,'Manzana',10);
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO());
V1.MAYUS();
DBMS_OUTPUT.PUT_LINE(V1.VER_PRODUCTO);
END;
/
-----------------------------METODOS ESTATICOS-----------------------------
SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;

DECLARE 
V1 PRODUCTO;
BEGIN
V1:=PRODUCTO(100,'Manzana',10);
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO());
V1.MAYUS();
DBMS_OUTPUT.PUT_LINE(V1.VER_PRODUCTO);
PRODUCTO.AUDITORIA();
END;
/
SELECT * FROM AUDITORIA;

----------------------------METODOS CONSTRUCTORES--------------------------
SET SERVEROUTPUT ON FORMAT WRAPPED LINE 1000;

DECLARE 
V1 PRODUCTO;
BEGIN
V1:=PRODUCTO('Manzana');
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO());
V1.MAYUS();
DBMS_OUTPUT.PUT_LINE(V1.VER_PRODUCTO);
PRODUCTO.AUDITORIA();
END;
/

------------------------SOBRECARGA DE OBJETOS------------------------------

SET SERVEROUTPUT ON
DECLARE V1 PRODUCTO:=PRODUCTO(900,'TORNILLO',20);
BEGIN
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO());
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO(10));
END;

-------------------------------------HERENCIA------------------------
DECLARE 
V1 COMESTIBLE:=COMESTIBLE(900,'TORNILLO',20,SYSDATE());
BEGIN
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO());
DBMS_OUTPUT.PUT_LINE(V1.VER_PRECIO(10));
DBMS_OUTPUT.PUT_LINE(V1.VER_CADUCIDAD);
END;
/




































