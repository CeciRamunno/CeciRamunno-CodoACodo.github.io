CREATE DATABASE ACTIVIDAD_OBLIGATORIA;

CREATE TABLE DATOS_PERSONA(
id INT(11) PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL,
apellido VARCHAR(40) NOT NULL,
edad TINYINT(2) NOT NULL,
fecha TIMESTAMP NOT NULL,
provincia VARCHAR(30) NOT NULL);

INSERT INTO DATOS_PERSONA
(nombre, apellido, edad, fecha, provincia)
VALUES
('Juan', 'Gomez', '15', '1999-05-18 00:15:00', 'Santa Fe'),
('Maria', 'Gutierrez', '64', '1975-05-18 00:15:00', 'Corrientes'),
('Juana', 'Maldonado', '23', '2000-01-11 00:15:00', 'Entre Ríos'),
('Gonzalo', 'Garcia', '29', '1990-11-14 00:15:00', 'Tierra del Fuego'),
('Marcelo', 'Suarez', '86', '1980-04-21 00:15:00', 'Mendoza');

SELECT * FROM DATOS_PERSONA