-- datos JSON

CREATE TABLE productos1 (
    codigo INT,
    nombre VARCHAR2(200),
    daos   json
);

DESC PRODUCTOS1;

INSERT INTO productos1 VALUES (
    1,
    'CAMISA DE MESSI',
    '
{
"PAIS":"ARG",
"CIUDAD":"ROSARIOS",
"POBLACION":1000000
}
'
);

--ACCEDER AL CONTENIDO CON NOTACION POR PUNTO

SELECT
    datos
FROM
    productos1;

SELECT
    prod1.datos.pais
FROM
    productos1 prod1;

INSERT INTO productos1 VALUES (
    2,
    'ejemplo1',
    '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 1000000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             }
  }
'
);

SELECT
    prod1.datos.direccion
FROM
    productos1 prod1;

SELECT
    prod1.datos.direccion.puerta
FROM
    productos1 prod1;

INSERT INTO productos1 VALUES (
    3,
    'ejemplo3',
    '
  {
    "pais": "Francia",
    "ciudad": "Paris",
    "poblacion": 1500000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             },
    "telefonos": [
        "111-111111",
        "222-222222"
    ]
  }
'
);

SELECT
    datos
FROM
    productos1;

SELECT
    prod1.datos.telefonos
FROM
    productos1 prod1;

SELECT
    prod1.datos.telefonos[0]
FROM
    productos1 prod1;

/*
IS JSON
IS NOT JSON
*/

CREATE TABLE ejemplo (
    codigo  INT,
    fichero CLOB
);

INSERT INTO ejemplo VALUES (
    1,
    '{"COL1":"PRUEBA"}'
);

INSERT INTO ejemplo VALUES (
    2,
    'ESTO ES UNA PRUEBA'
);

INSERT INTO ejemplo VALUES (
    3,
    '<DOC><COL1>PRUEBA</COL1></DOC>'
);

SELECT
    *
FROM
    ejemplo
WHERE
    fichero IS JSON;

SELECT
    *
FROM
    ejemplo
WHERE
    fichero IS NOT JSON;



/*

   JSON_EXISTS(campo_json,expresion_json,on_error);
   */

DROP TABLE productos1;

CREATE TABLE productos1 (
    codigo INT,
    nombre VARCHAR2(200),
    datos  json
);

INSERT INTO productos1 VALUES (
    1,
    'ejemplo1',
    '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 1000000
  }
'
);

INSERT INTO productos1 VALUES (
    2,
    'ejemplo1',
    '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 1000000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             }
  }
'
);

INSERT INTO productos1 VALUES (
    3,
    'ejemplo3',
    '
  {
    "pais": "Francia",
    "ciudad": "Paris",
    "poblacion": 1500000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 5,
             "puerta": "c"
             },
    "telefonos": [
        "111-111111",
        "222-222222"
    ]
  }
'
);

INSERT INTO productos1 VALUES (
    4,
    'ejemplo4',
    '
  {
    "pais": "Italia",
    "ciudad": "Roma",
    "poblacion": 1400000,
    "direccion":{
             "calle": "xcxxxxx",
             "piso": 4,
             "puerta": ""
             },
    "telefonos": [
        "111-111111AA",
        "222-222222BB"
    ]
  }
'
);

INSERT INTO productos1 VALUES (
    5,
    'ejemplo5',
    '
  {
    "pais": "Inglaterra",
    "ciudad": "Londres",
    "poblacion": 10009000
  }
'
);

SELECT
    JSON_VALUE(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.pais' RETURNING VARCHAR(100))
FROM
    productos1 prod1;
-- Si no son escalare no funciona
SELECT
    JSON_VALUE(prod1.datos, '$.direccion')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.telefonos')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion.calle')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;

SELECT
    prod1.datos.pais
FROM
    productos1 prod1;

/*
JSON_VALUE(CAMPO_JSON,EXPRESION_JSON) no podemos recuperar subdocumentos 
*/
SELECT
    datos
FROM
    productos1;

SELECT
    JSON_VALUE(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.direccion.calle')
FROM
    productos1 prod1;

SELECT
    JSON_VALUE(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;
/*

JSON QUERY si recuperamos subdocumentos y array
*/
SELECT
    datos
FROM
    productos1;

SELECT
    JSON_QUERY(prod1.datos, '$.pais')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.direccion.calle')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos[0]')
FROM
    productos1 prod1;

SELECT
    JSON_QUERY(prod1.datos, '$.telefonos')
FROM
    productos1 prod1;

/*
JSON_TABLE
*/

SELECT
    j_pais
FROM
    productos1 prod1,
    JSON_TABLE ( prod1.datos, '$'
            COLUMNS (
                j_pais PATH '$.pais'
            )
        );

SELECT
    j_pais,
    j_ciudad
FROM
    productos1 prod1,
    JSON_TABLE ( prod1.datos, '$'
            COLUMNS (
                j_pais PATH '$.pais',
                j_ciudad PATH '$.ciudad'
            )
        );

CREATE VIEW datos_json AS
    SELECT
        j_pais,
        j_ciudad,
        j_direc
    FROM
        productos1 prod1,
        JSON_TABLE ( prod1.datos, '$'
                COLUMNS (
                    j_pais PATH '$.pais',
                    j_ciudad PATH '$.ciudad',
                    j_direc PATH '$.direccion.calle'
                )
            );

SELECT
    *
FROM
    datos_json;

/*

   MODIFICAR JSON
   
   - Antes de la 19c- Había que modificar todo el campo completo
   - En la 19c aparece JSON_MERGEPATCH para actualizar trozos
   - En la 21c aparece JSON_TRANSFORM que es un poco más potente
   
   */


SELECT
    datos
FROM
    productos1;
   
   -- Modificar uno existente
UPDATE productos1
SET
    datos = '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 2000000
  }'
WHERE
    codigo = 1;
  
  
  -- Añadir un elemento
UPDATE productos1
SET
    datos = '
  {
    "pais": "Argentina",
    "ciudad": "Buenos aires",
    "poblacion": 2100000,
    "estado": true
  }'
WHERE
    codigo = 1;
  
  -- JSON_MERGEPATCH
UPDATE productos1
SET
    datos = json_mergepatch(datos, '{
            "estado": false
      }')
WHERE
    codigo = 1;

UPDATE productos1
SET
    datos = json_mergepatch(datos, '{
            "estado": true,
            "c1": 10
      }')
WHERE
    codigo = 1;

/*
OPERACIONES CON JSON_TRANSFORM

SET ==> ACTUALIZA UN ELEMENETO, SI EL ELEMENTO NO EXISTE ,LO CREA
INSERT ==> INSERTA UN ELEMENTO QUE NO EXISTE 
APPEND ==> AÑADE UN ELEMENTO AL FINAL DE UN ARRAY
REMOVE ==> BORRAR UN ELEMENTO , INCLUIDO DENTRO DE UN ARRAY
RENAME  ==> RENOMBRAR UN ELEMENTO
REPLACE ==> COMO EL SET PERO SI EL ELEMENTO NO EXISTE,NO LO CREA
KEEP ==> ELIMINA TODO LOS ELEMENTOS SALVO LOS QUE ESTAN EN LA LISTA
*/

UPDATE productos1
SET
    datos = JSON_TRANSFORM(datos, SET '$.POBLACION' = 190000)
WHERE
    codigo = 1;

SELECT
    datos
FROM
    productos1;

SELECT
    JSON_TRANSFORM(datos, SET '$.poblacion1' = 1000)
FROM
    productos1
WHERE
    codigo = 1;
--da error por que solo sirve para insertar si no exite no lo crea
SELECT
    JSON_TRANSFORM(datos, INSERT '$.tipo' = 'tipo1')
FROM
    productos1
WHERE
    codigo = 1;

SELECT
    JSON_TRANSFORM(datos, APPEND '$.telefono' = '999999')
FROM
    productos1
WHERE
    codigo = 3;

SELECT
    JSON_TRANSFORM(datos, INSERT '$.telefono[0]' = '21999999')
FROM
    productos1
WHERE
    codigo = 3;

SELECT
    JSON_TRANSFORM(datos, REPLACE '$.poblacion1' = 1000)
FROM
    productos1
WHERE
    codigo = 1;

SELECT
    JSON_TRANSFORM(datos, REMOVE '$.poblacion')
FROM
    productos1
WHERE
    codigo = 3;
select json_transform(datos, keep'$.direccion.calle'=1000) from productos1 where codigo=3;
select json_transform(datos,set'$.poblacion'=1000,
                      insert'$.direccion.codigo'=90901,
                      rename'$.direccion.calle'='via'
)from productos1 where codigo=3;
/
































