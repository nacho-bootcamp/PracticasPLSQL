/*--------------------------PRACTICANDO COMANDO IF---------------------------*/
/*1. PRÁCTICA 1 
• Debemos hacer un bloque PL/SQL anónimo, donde declaramos una variable 
NUMBER y la ponemos algún valor. 
• Debe indicar si el número es PAR o IMPAR. Es decir debemos usar IF..... ELSE 
para hacer el ejercicio 
• Como pista, recuerda que hay una función en SQL denominada MOD, que 
permite averiguar el resto de una división.  
• Por ejemplo MOD(10,4) nos devuelve el resto de dividir 10 por 4. */
/*
SET SERVEROUTPUT ON

DECLARE
    numero NUMBER := 10;
BEGIN
    IF MOD(numero, 2) THEN
        dbms_output.put_line('EL NUMERO '
                             || numero
                             || ' ES PAR');
    ELSE
        dbms_output.put_line('EL NUMERO '
                             || numero
                             || ' ES IMPAR');
    END IF;
END;

*/



/*2. PRÁCTICA 2 
• Crear una variable CHAR(1) denominada TIPO_PRODUCTO. 
• Poner un valor entre "A" Y "E" 
• Visualizar el siguiente resultado según el tipo de producto 
o   'A'  --> Electronica 
o   'B'  -->  Informática 
o   'C'  --> Ropa 
o    'D' --> Música 
o    'E' --> Libros 
o Cualquier otro valor debe visualizar "El código es incorrecto"*/

/*SET SERVEROUTPUT ON

DECLARE
    tipo_producto CHAR(1) := upper('a');
BEGIN
    IF tipo_producto = 'A' THEN
        dbms_output.put_line('SOY TIPO DE ELECTRONICA');
    ELSIF tipo_producto = 'B' THEN
        dbms_output.put_line('SOY TIPO DE INFORMATICA');
    ELSIF tipo_producto = 'C' THEN
        dbms_output.put_line('SOY TIPO DE ROPA');
    ELSIF tipo_producto = 'D' THEN
        dbms_output.put_line('SOY DE MUSICA');
    ELSIF tipo_producto = 'E' THEN
        dbms_output.put_line('SOY DE LIBROS');
    ELSE
        dbms_output.put_line('SOY UN CODIGO ROTO');
    END IF;
END;*/

/*---------------------------PRACTICA COMANDO CASE---------------------------*/
/*• Vamos a crear una variable denominada "usuario", de tipo 
VARCHAR2(40) 
• Vamos a poner dentro el nombre del usuario con el que nos hemos 
conectado. Para saberlo, usamos la función USER de Oracle que 
devuelve el nombre del usuario con el que estamos conectados 
(Recuerda que en Oracle no hace falta poner paréntesis si una función no 
tiene argumentos) 
usuario:=user
•Luego hacermos un CASE para que nos pinte un mensaje del estilo: 
o Si el usuario es SYS ponemos el mensaje "Eres 
superadministrador" 
o Si el usuario es SYSTEM ponemos el mensaje "Eres un 
administrador normal" 
o Si el usuario es HR ponemos el mensaje "Eres de Recursos 
humanos" 
o  Cualquier otro usuario ponemos "usuario no autorizado */

/*SET SERVEROUTPUT ON
DECLARE
    usuario VARCHAR2(40);
BEGIN
    usuario := USER;
    CASE usuario
        WHEN 'SYS' THEN
            dbms_output.put_line('ERES SUPERADMINISTRADOR');
        WHEN 'SYSTEM' THEN
            dbms_output.put_line('ERES UN ADMINISTRADOR NORMAL');
        WHEN 'HR' THEN
            dbms_output.put_line('ERES DE RECURSOS HUMANOS');
        ELSE
            dbms_output.put_line('USUARIO NO AUTORIZADO');
    END CASE;
END;*/

//------------------------PRACTICAS BUCLES-------------------------------------
/*1. Práctica 1 
• Vamos a crear la tabla de multiplicar del 1 al 10, con los tres tipos de 
bucles: LOOP, WHILE y FOR*/
//------------------------------LOOP--------------------------------------------
/*SET SERVEROUTPUT ON

DECLARE
    i         NUMBER := 0;
    j         NUMBER;
    resultado NUMBER;
BEGIN
    << parent >> LOOP
        i := i + 1;
        j := 0;
        << child >> LOOP
            EXIT parent WHEN i > 10;
            j := j + 1;
            resultado := i * j;
            dbms_output.put_line(i
                                 || 'X'
                                 || j
                                 || ' = '
                                 || resultado);
            EXIT child WHEN j = 10;
        END LOOP child;

    END LOOP parent;
END;*/

//---------------------------------WHILE---------------------------------------

/*SET SERVEROUTPUT ON

DECLARE
    x NUMBER;
    z NUMBER;
    RESULTADO NUMBER;
BEGIN
    x := 1;
    z := 1;
    WHILE x < 11 LOOP
    dbms_output.put_line('TABLA DEL ' ||X);
        WHILE z < 11 LOOP
        RESULTADO:=X*Z;
            dbms_output.put_line(X||' X ' || Z ||' = ' ||RESULTADO);
            z := z + 1;
        END LOOP;
        z := 0;
        x := x + 1;
    END LOOP;

END;*/

//-----------------------------BUCLE FOR --------------------------------------

SET SERVEROUTPUT ON

DECLARE
    x         NUMBER;
    z         NUMBER;
    resultado NUMBER;
BEGIN
    FOR x IN 1..10 LOOP
        dbms_output.put_line('TABLA DEL ' || x);
        FOR z IN 1..10 LOOP
            resultado := x * z;
            dbms_output.put_line(x
                                 || ' X '
                                 || z
                                 || ' = '
                                 || resultado);

        END LOOP;

    END LOOP;
END;

/*2. Práctica 2-  
• Crear una variable llamada TEXTO de tipo VARCHAR2(100). 
• Poner alguna frase 
• Mediante un bucle, escribir la frase al revés, Usamos el bucle WHILE */

SET SERVEROUTPUT ON

DECLARE
    frase          VARCHAR2(100);
    limite         NUMBER;
    frase_al_reves VARCHAR2(100);
BEGIN
    frase := 'JUJUY';
    limite := length(frase);
    WHILE limite > 0 LOOP
        frase_al_reves := frase_al_reves
                          || substr(frase, limite, 1);
        limite := limite - 1;
    END LOOP;

    dbms_output.put_line(frase_al_reves);
END;

/*3. Práctica 3 
• Usando la práctica anterior, si en el texto aparece el carácter "x" debe 
salir del bucle. Es igual en mayúsculas o minúsculas. 
• Debemos usar la cláusula EXIT. 
*/
SET SERVEROUTPUT ON

DECLARE
    frase          VARCHAR2(100);
    limite         NUMBER;
    frase_al_reves VARCHAR2(100);
BEGIN
    frase := 'TEXTO';
    limite := length(frase);
    WHILE limite > 0 LOOP
        frase_al_reves := frase_al_reves
                          || substr(frase, limite, 1);
        EXIT WHEN upper((substr(frase, limite, 1))) = 'X';
        limite := limite - 1;
    END LOOP;

    dbms_output.put_line(frase_al_reves);
END;

/*4. Práctica 4 
• Debemos crear una variable llamada NOMBRE 
• Debemos pintar tantos asteriscos como letras tenga el nombre. 
Usamos un bucle FOR 
• Por ejemplo  Alberto → ******* 
• O por ejemplo Pedro → ******/

SET SERVEROUTPUT ON

DECLARE
    nombre     VARCHAR2(10);
    limite     NUMBER;
    asteriscos VARCHAR2(10);
BEGIN
    nombre := 'NACHO';
    limite := length(nombre);
    FOR nombre IN 1..limite LOOP
        asteriscos := asteriscos || '*';
    END LOOP;

    dbms_output.put_line(nombre
                         || '==>'
                         || asteriscos);
END;

/*5. Práctica 5 
• Creamos dos variables numéricas, "inicio y fin" 
• Las inicializamos con algún valor: 
o Debemos sacar los números que sean múltiplos de 4 de ese rango */

SET SERVEROUTPUT ON

DECLARE
    inicio NUMBER;
    final  NUMBER;
BEGIN
    inicio := 10;
    final := 100;
    FOR i IN inicio..final LOOP
        IF MOD(i, 4) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;

END;