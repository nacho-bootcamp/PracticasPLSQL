----------------------------CREAR TRIGGERS--------------------------------------
INSERT INTO REGIONS VALUES(1003,'REGIONS');

---------------------------CREAR TRIGGERS CON EVENTOS---------------------------
UPDATE HR.REGIONS SET REGION_NAME='XXXX'
WHERE REGION_NAME='WAKANDA';

-------------------------CONTROLAR EL TIPO DE EVENTO---------------------
UPDATE HR.REGIONS SET REGION_NAME='WAKANDA'
WHERE REGION_NAME='XXXX';

INSERT INTO HR.REGIONS VALUES(1050,'REGIONS6');

----------------------------CREAR TIPOS DE TRIGGERS ROW-------------------------

UPDATE REGIONS SET REGION_NAME=UPPER(REGION_NAME);

INSERT INTO REGIONS VALUES(1009,'area51');

