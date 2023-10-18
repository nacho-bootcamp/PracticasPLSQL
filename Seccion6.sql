/*COMANDO IF*/
SET SERVEROUTPUT ON

/*DECLARE
    x NUMBER := 20;
BEGIN
    IF x = 10 THEN
        dbms_output.put_line('X:=10');
    ELSE
        dbms_output.put_line('X:=OTHER VALUE');
    END IF;
END;

SET SERVEROUTPUT ON

DECLARE
    sales NUMBER := 25000;
    bonus NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 150;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line('SALES = '
                         || sales
                         || ',BONUS = '
                         || bonus
                         || '.');

END;*/

/*------------------------COMANDO CASE -----------------------------*/
/*DECLARE
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    CASE v1
        WHEN 'A' THEN
            dbms_output.put_line('EXCELLENT');
        WHEN 'B' THEN
            dbms_output.put_line('VERY GOOD');
        WHEN 'C' THEN
            dbms_output.put_line('GOOD');
        WHEN 'D' THEN
            dbms_output.put_line('FAIR');
        WHEN 'E' THEN
            dbms_output.put_line('POOR');
        ELSE
            dbms_output.put_line('NO SUCH VALUE');
    END CASE;

END;
*/
/*------------------------SEARCHED CASE ---------------------------*/
/*DECLARE
    bonus NUMBER;
BEGIN
    bonus := 100;
    CASE
        WHEN bonus > 500 THEN
            dbms_output.put_line('EXCELLENT');
        WHEN
            bonus <= 500
            AND bonus > 250
        THEN
            dbms_output.put_line('VERY GOOD');
        WHEN
            bonus <= 250
            AND bonus > 100
        THEN
            dbms_output.put_line('GOOD');
        ELSE
            dbms_output.put_line('POOR');
    END CASE;

END;*/
//-------------------------BUCLE LOOP -------------------------------------

/*DECLARE
    x NUMBER := 1;
BEGIN
    LOOP
        dbms_output.put_line(x);
        x := x + 1;
      (IF x = 11 THEN
            EXIT;
        END IF;)SEGUNDA FORMA DE CERRAR UN LOOP
        EXIT WHEN x = 11; PRIMERA FORMA DE CERRAR UN LOOP
    END LOOP;
END;*/



//--------------------------BUCLE ANIDADOS------------------------------------
/*DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;
BEGIN
    << parent >> LOOP
--PRINT PARENT
        i := i + 1;
        j := 100;
        dbms_output.put_line('PARENT: ' || i);
        << child >> LOOP
--PRINT CHILD
            EXIT parent WHEN ( i > 3 );
            dbms_output.put_line('CHILD: ' || j);
            j := j + 1;
            EXIT child WHEN ( j > 105 );
        END LOOP child;

    END LOOP parent;

    dbms_output.put_line('FIN');
END;*/

//---------------------COMANDO CONTINUE --------------------------------------
/*DECLARE
    x NUMBER := 0;
BEGIN
    LOOP -- CON CONTINUE SALTAMOS AQUI
        dbms_output.put_line('LOOP: X= ' || to_char(x));
        x := x + 1;
       ( IF x < 3 THEN
            CONTINUE;
        END IF;) SEGUNDA FORMA DE USAR CONTINUE 
        CONTINUE WHEN x < 3; PRIMERA FORMA DE USAR 
        dbms_output.put_line('DESPUES DE CONTINUE: X=' || to_char(x));
        EXIT WHEN x = 5;
    END LOOP;

    dbms_output.put_line('DESPUES DEL LOOP: X= ' || to_char(x));
END;*/

//--------------------BUCLE FOR ----------------------------------------

/*BEGIN
FOR I IN 5..15 LOOP
DBMS_OUTPUT.PUT_LINE(I);
EXIT WHEN I=10;
END LOOP;
END;*/

//----------------------------WHILE-------------------------------------------
/*DECLARE
    done BOOLEAN := FALSE;
    x    NUMBER := 0;
BEGIN
    WHILE x < 10 LOOP
        dbms_output.put_line(x);
        x := x + 1;
        EXIT WHEN x = 5;
    END LOOP;

    WHILE done LOOP
        dbms_output.put_line('NO IMPRIMIO ESTO.');
        done := TRUE;
    END LOOP;
    WHILE NOT done LOOP
        dbms_output.put_line('PASE POR AQUI');
        done := TRUE;
    END LOOP;

END;*/

//------------------------------COMANDO GOTO-----------------------------------

/*DECLARE
    p VARCHAR2(30);
    n PLS_INTEGER := 5;
BEGIN
    FOR j IN 2..round(sqrt(n)) LOOP
        IF n MOD j = 0 THEN
            p := 'NO ES UNA NUMERO PRIMO';
            GOTO print_now;
        END IF;
    END LOOP;

    p := 'ES UN NUMERO PRIMO';
    << print_now >> dbms_output.put_line(to_char(n)
                                         || p);
END;*/