 SET SERVEROUTPUT ON
BEGIN
PR1;
END;
/

EXECUTE pr1;

--------------------------PARAMETRO DE TIPO IN ---------------------------------
set serveroutput on
begin
calc_tax(10,70);
end;
/

--------------------------PARAMETRO DE TIPO OUT ---------------------------------
set serveroutput on
DECLARE
A NUMBER;
B NUMBER;
R NUMBER;
begin
A:=120;
B:=10;
R:=0;
calc_tax_OUT(A,B,R);
DBMS_OUTPUT.PUT_LINE('R= '||R);
end;
/

--------------------------PARAMETRO DE TIPO IN OUT------------------------------
SET SERVEROUTPUT ON
DECLARE 
A NUMBER;
B NUMBER;
BEGIN
A:=120;
B:=10;

CALC_TAX_IN_OUT(A,B);
DBMS_OUTPUT.PUT_LINE('B= '||B);
END;
