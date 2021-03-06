CREATE OR REPLACE PROCEDURE INSERT_CENTROS(PNOMBRE IN VARCHAR2, PPROVINCIA IN VARCHAR2)IS
  V CENTROS.ID%TYPE;
  E_CENTROS EXCEPTION;
BEGIN
  BEGIN
    SELECT ID INTO V FROM CENTROS WHERE NOMBRE = PNOMBRE;
    IF SQL%FOUND THEN
      RAISE E_CENTROS;
    END IF;
  EXCEPTION
    WHEN E_CENTROS THEN
      NULL;
  END;
  RAISE_APPLICATION_ERROR(-20000, 'ERROR AL A�ADIR EL CENTRO');
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    INSERT INTO CENTROS (NOMBRE, PROVINCIA) VALUES(PNOMBRE, PPROVINCIA);
    COMMIT;
END;