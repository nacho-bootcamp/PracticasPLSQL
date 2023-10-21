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
    UPDATE test
    SET
        c2 = 'PPPP'
    WHERE
        c1 = 200;

    dbms_output.put_line(SQL%rowcount);
    IF SQL%found THEN
        dbms_output.put_line('ENCONTRADO');
    END IF;
    IF SQL%notfound THEN
        dbms_output.put_line('NO ENCONTRADO');
    END IF;
END;
/

-----------------------------CREAR CURSOR---------------------------------------

SET SERVEROUTPUT ON

DECLARE
--MIENTRAS NO LO HABRAMOS ESTE CURSOR ESTA CERRADO"VACIO"
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    valor regions%rowtype;
BEGIN
    OPEN c1;
--LEEMOS EL CURSOR CON FECTH
    FETCH c1 INTO valor;
    dbms_output.put_line(valor.region_name);
    CLOSE c1;
END;
/

--------------------RECORRER UN CURSOR CON EL BUCLE LOOP------------------

SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

    v1 regions%rowtype;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v1;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(v1.region_name);
    END LOOP;

    CLOSE c1;
END;
/

------------------RECORRER UN CURSOR CON EL BUCLE FOR--------------------------
-- CUANDO UTILIZAMOS UN BUCLE FOR TODOS ESOS COMANDO DE OPEN Y CLOSE SON 
--IMPLICITO
SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 IS
    SELECT
        *
    FROM
        regions;

BEGIN
    FOR i IN c1 LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;
/
-------------------------BUCLES FOR CON SUBQUERIES------------------------------

BEGIN
    FOR i IN (
        SELECT
            *
        FROM
            regions
    ) LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;
/

--------------------------CURSORES CON PARAMETRO------------------------------ 
SET SERVEROUTPUT ON

DECLARE
    CURSOR c1 (
        sal NUMBER
    ) IS
    SELECT
        *
    FROM
        employees
    WHERE
        salary > sal;

    empl employees%rowtype;
BEGIN
    OPEN c1(8000);
    LOOP
        FETCH c1 INTO empl;
        EXIT WHEN c1%notfound;
        dbms_output.put_line(empl.first_name
                             || ' '
                             || empl.salary);
    END LOOP;

    dbms_output.put_line('HE ENCONTRADO '
                         || c1%rowcount
                         || ' EMPLEADOS');
END;