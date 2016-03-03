CREATE OR REPLACE PROCEDURE VER_TRABAJADOR IS
  CURSOR TRA_CURSOR IS
    SELECT APELLIDO1, FECHANAC
    FROM TRABAJADORES
    ORDER BY APELLIDO1;
    REG_TRABAJADOR TRA_CURSOR%ROWTYPE;
BEGIN
  OPEN TRA_CURSOR;
  LOOP
    FETCH TRA_CURSOR INTO REG_TRABAJADOR;
    DBMS_OUTPUT.PUT_LINE('EL TRABAJADOR DE APELLIDO ' || REG_TRABAJADOR.APELLIDO1 || ' NACIDO EL ' || REG_TRABAJADOR.FECHANAC);
    EXIT WHEN TRA_CURSOR%NOTFOUND;
  END LOOP;
  CLOSE TRA_CURSOR;
END;