CREATE OR REPLACE TYPE Profesor
AS OBJECT(
DNI NUMBER,
Nombre VARCHAR2(30),
Departamento REF Departamento);

CREATE OR REPLACE TYPE Departamento
AS OBJECT(
Nombre VARCHAR2(30),
Telefono ref Telefono);

CREATE OR REPLACE TYPE Alumno
AS OBJECT(
Nombre VARCHAR2(30),
MEMBER FUNCTION calcularMedia RETURN FLOAT,
Profesor ref Profesor,
Matricula ref Matricula,
Direccion ref Direccion,
Telefono ref Telefono
);

/*
CREATE TYPE BODY Alumno AS
MEMBER FUNCTION calcularMedia RETURN FLOAT IS
a NUMBER;
  a := Matricula.Nota;

;
*/

CREATE OR REPLACE TYPE Telefono
AS OBJECT(
Numero VARCHAR2(9)
);

CREATE OR REPLACE TYPE Asignatura
AS OBJECT(
Creditos NUMBER,
Nombre VARCHAR2(30)
);

CREATE OR REPLACE TYPE Contacto
AS OBJECT(
Nombre VARCHAR2(30),
Direccion ref Direccion,
Telefono ref Telefono);

CREATE OR REPLACE TYPE Direccion
AS OBJECT(
Calle VARCHAR2(30),
Portal VARCHAR2(30),
Ciudad VARCHAR(30));

CREATE OR REPLACE TYPE Matricula
AS OBJECT(
Nota FLOAT(3),
Alumno ref Alumno,
Asignatura ref Asugnatura
);


CREATE TABLE PERSONAS (
  Alumno ref Alumno,
  Profesor ref Profesor,
  Contacto ref Contacto
);

Create table DEPARTAMENTOS(
  Departamento Departamento
);

CREATE TABLE PROFESORESPARCIAL (
  Profesor Profesor
);

CREATE TABLE PROFESORESTOTAL (
  Profesor Profesor
);

CREATE TABLE ALUMNOSO (
  Alumno Alumno
);