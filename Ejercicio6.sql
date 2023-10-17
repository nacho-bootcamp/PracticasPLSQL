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
usuario:=user*/

SET SERVEROUTPUT ON

DECLARE
USUARIO VARCHAR2(40);

BEGIN
USUARIO:='USUARIO'

CASE USUARIO
WHEN



END;





































