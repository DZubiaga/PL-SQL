CREATE OR REPLACE TRIGGER CONTROL
AFTER INSERT OR UPDATE OR DELETE ON EMPLE
BEGIN
  IF INSERTING THEN 
    INSERT INTO CTRL_EMPLEADOS VALUES ('EMPLE', USER, SYSDATE, 'INSERT');
  ELSIF UPDATING THEN
    INSERT INTO CTRL_EMPLEADOS VALUES ('EMPLE', USER, SYSDATE, 'UPDATE');
  ELSIF DELETING THEN
    INSERT INTO CTRL_EMPLEADOS VALUES ('EMPLE', USER, SYSDATE, 'DELETE');
  END IF;
END;

CREATE TABLE CTRL_EMPLEADOS(
  TABLA VARCHAR(20),
  USUARIO VARCHAR(20),
  FECHA DATE,
  OPER VARCHAR(10)
);