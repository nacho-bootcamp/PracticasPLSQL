 -----------------------------CURSORES-------------------------------------------
--EXPLICITO SE GENERAN DE FORMA MANUAL
--IMPLICITO SE GENERAN AUTOMATICAMNTE POR PARTE DE PL

--ATRIBUTOS IMPLICITOS

/*
SQL%ISOPEN --EXPLICITOS
SQL%FOUND
SQL%NOTFOUND
SQL%ROWCOUNT*/

--EL DELETE ,UPDATE E INSERT NO DAN ERROR 
BEGIN
UPDATE TEST SET C2='PPPP' WHERE C1=200;
DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT);
IF SQL%FOUND THEN
DBMS_OUTPUT.PUT_LINE('ENCONTRADO');
END IF;
IF SQL%NOTFOUND THEN
DBMS_OUTPUT.PUT_LINE('NO ENCONTRADO');
END IF;
END;
/

-----------------------------CREAR CURSOR---------------------------------------

SET SERVEROUTPUT ON

DECLARE
--MIENTRAS NO LO HABRAMOS ESTE CURSOR ESTA CERRADO"VACIO"
CURSOR C1 IS SELECT * FROM REGIONS;
VALOR REGIONS%ROWTYPE;

BEGIN
OPEN C1;
--LEEMOS EL CURSOR CON FECTH
FETCH C1 INTO VALOR;
DBMS_OUTPUT.PUT_LINE(VALOR.REGION_NAME);
CLOSE C1;
END;
/

--------------------RECORRER UN CURSOR CON EL BUCLE LOOP------------------

SET SERVEROUTPUT ON

DECLARE
CURSOR C1 IS SELECT * FROM REGIONS;
V1 REGIONS%ROWTYPE;
BEGIN
OPEN C1;
LOOP
FETCH C1 INTO V1;
EXIT WHEN C1%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(V1.REGION_NAME);
END LOOP;
CLOSE C1;
END;
/

------------------RECORRER UN CURSOR CON EL BUCLE FOR--------------------------
-- CUANDO UTILIZAMOS UN BUCLE FOR TODOS ESOS COMANDO DE OPEN Y CLOSE SON 
--IMPLICITO
SET SERVEROUTPUT ON
DECLARE 
CURSOR C1 IS SELECT * FROM REGIONS;
BEGIN
FOR I IN C1 LOOP
DBMS_OUTPUT.PUT_LINE(I.REGION_NAME);
END LOOP;
END;






