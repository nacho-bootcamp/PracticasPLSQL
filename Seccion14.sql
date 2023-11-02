------------------INTRODUCCION  A LOS OBJETOS-----------------------------------
/*ORACLE ES UNA BASE DE DATOS DE TIPO RELACIONAL Y POR LO TANTO NO ES UNA BASE 
DE DATOS DE TIPOS OBJETO
SIN EMBARGO INCORPORO FUNCIONALIDADES QUE PERMITEN TRABAJAR CON ALGUNAS DE LAS
CARACTERISTICAS DE LAS BASES DE DATOS ORINTADAS A OBJETO
*/

----------------------CREAR TIPOS DE OBJETOS-----------------------------------
CREATE OR REPLACE TYPE PRODUCTO AS OBJECT(

--ATRIBUTO
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
PRECIO NUMBER,

--METODOS
MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2,
MEMBER FUNCTION VER_PRECIO RETURN NUMBER,
MEMBER PROCEDURE CAMBIAR_PRECIO(PVP NUMBER),
MEMBER PROCEDURE MAYUS
);
/

DROP TYPE PRODUCTO;

-----------------------CREAR UN TIPO DE OBJETO CUERPO--------------------------
CREATE OR REPLACE TYPE BODY PRODUCTO AS 

MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2 AS
BEGIN
RETURN 'CODIGO => '||CODIGO||' NOMBRE =>'||NOMBRE||' PRECIO =>'||PRECIO;
END VER_PRODUCTO;

MEMBER FUNCTION VER_PRECIO RETURN NUMBER AS
BEGIN
RETURN PRECIO;
END VER_PRECIO;

MEMBER PROCEDURE CAMBIAR_PRECIO(PVP NUMBER)AS
BEGIN
PRECIO:=PRECIO;
END CAMBIAR_PRECIO;

MEMBER PROCEDURE MAYUS AS 
BEGIN
NOMBRE:=UPPER(NOMBRE);
END MAYUS;

END;
/

--------------------------------ARGUMENTO SELF---------------------------------

CREATE OR REPLACE TYPE PRODUCTO AS OBJECT(

--ATRIBUTO
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
PRECIO NUMBER,

--METODOS
MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2,
MEMBER FUNCTION VER_PRECIO RETURN NUMBER,
MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER),
MEMBER PROCEDURE MAYUS
);
/
------------------
CREATE OR REPLACE TYPE BODY PRODUCTO AS 

MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2 AS
BEGIN
RETURN 'CODIGO => '||CODIGO||' NOMBRE =>'||NOMBRE||' PRECIO =>'||PRECIO;
END VER_PRODUCTO;

MEMBER FUNCTION VER_PRECIO RETURN NUMBER AS
BEGIN
RETURN PRECIO;
END VER_PRECIO;

MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER)AS
BEGIN
SELF.PRECIO:=PRECIO;
END CAMBIAR_PRECIO;

MEMBER PROCEDURE MAYUS AS 
BEGIN
NOMBRE:=UPPER(NOMBRE);
END MAYUS;

END;
/

-----------------------------METODOS ESTATICOS-----------------------------

CREATE OR REPLACE TYPE PRODUCTO AS OBJECT(

--ATRIBUTO
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
PRECIO NUMBER,

--METODOS
MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2,
MEMBER FUNCTION VER_PRECIO RETURN NUMBER,
MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER),
MEMBER PROCEDURE MAYUS,
STATIC PROCEDURE AUDITORIA
);

CREATE OR REPLACE TYPE BODY PRODUCTO AS 

MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2 AS
BEGIN
RETURN 'CODIGO => '||CODIGO||' NOMBRE =>'||NOMBRE||' PRECIO =>'||PRECIO;
END VER_PRODUCTO;

MEMBER FUNCTION VER_PRECIO RETURN NUMBER AS
BEGIN
RETURN PRECIO;
END VER_PRECIO;

MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER)AS
BEGIN
SELF.PRECIO:=PRECIO;
END CAMBIAR_PRECIO;

MEMBER PROCEDURE MAYUS AS 
BEGIN
NOMBRE:=UPPER(NOMBRE);
END MAYUS;

STATIC PROCEDURE AUDITORIA
AS BEGIN
INSERT INTO AUDITORIA VALUES(USER,SYSDATE);
END AUDITORIA;
END;
/

----------------------------METODOS CONSTRUCTORES--------------------------

CREATE OR REPLACE TYPE PRODUCTO AS OBJECT(

--ATRIBUTO
CODIGO NUMBER,
NOMBRE VARCHAR2(100),
PRECIO NUMBER,

--METODOS
MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2,
MEMBER FUNCTION VER_PRECIO RETURN NUMBER,
MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER),
MEMBER PROCEDURE MAYUS,
STATIC PROCEDURE AUDITORIA,
CONSTRUCTOR FUNCTION PRODUCTO (N1 VARCHAR2) RETURN SELF AS RESULT
);


CREATE OR REPLACE TYPE BODY PRODUCTO AS 

MEMBER FUNCTION VER_PRODUCTO RETURN VARCHAR2 AS
BEGIN
RETURN 'CODIGO => '||CODIGO||' NOMBRE =>'||NOMBRE||' PRECIO =>'||PRECIO;
END VER_PRODUCTO;

MEMBER FUNCTION VER_PRECIO RETURN NUMBER AS
BEGIN
RETURN PRECIO;
END VER_PRECIO;

MEMBER PROCEDURE CAMBIAR_PRECIO(PRECIO NUMBER)AS
BEGIN
SELF.PRECIO:=PRECIO;
END CAMBIAR_PRECIO;

MEMBER PROCEDURE MAYUS AS 
BEGIN
NOMBRE:=UPPER(NOMBRE);
END MAYUS;

STATIC PROCEDURE AUDITORIA
AS BEGIN
INSERT INTO AUDITORIA VALUES(USER,SYSDATE);
END AUDITORIA;

CONSTRUCTOR FUNCTION PRODUCTO (N1 VARCHAR2) RETURN SELF AS RESULT
IS
BEGIN
SELF.NOMBRE:=N1;
SELF.PRECIO:=NULL;
SELF.CODIGO:=SEQ1.NEXTVAL;
RETURN;
END PRODUCTO;
END;
/

----------------------------Comprobar los objetos que tenemos-------------------

desc PRODUCTO;

DESC EMPLEADO;

SELECT * FROM USER_TYPES;
SELECT * FROM USER_SOURCE WHERE NAME='PRODUCTO';



























































