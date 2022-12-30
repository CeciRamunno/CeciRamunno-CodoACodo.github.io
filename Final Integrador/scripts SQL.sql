CREATE DATABASE GIMNASIO;
USE GIMNASIO;

CREATE TABLE socios(
id_socio INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(40) NOT NULL,
apellido VARCHAR(40) NOT NULL,
direccion VARCHAR(40) NOT NULL,
localidad VARCHAR(40) NOT NULL,
fecha_nacimiento DATE NOT NULL,
email VARCHAR(30) NOT NULL,
telefono VARCHAR(25) NOT NULL,
activo bool NOT NULL
);
ALTER TABLE socios RENAME COLUMN id_ocio TO id_socio;

INSERT INTO SOCIOS
(nombre, apellido, direccion, localidad, fecha_nacimiento, email, telefono, activo)
VALUES
('Juan', 'Perez', 'Urquiza 4651 10B', 'Rosario', '1985-02-22', 'jperez@micorreo.com.ar', '156123123', true),
('Maria', 'Gomez', 'Tucuman 36 A', 'Buenos Aires', '1983-06-02', 'mgomez@micorreo.com.ar', '164321321', true),
('Martin', 'Rodriguez', 'Belgrano 111 1', 'Bariloche', '1985-02-22', 'mrodriguez@micorreo.com.ar', '154987654', true),
('Valeria', 'Gutierrez', 'Wheelwright 67 5E', 'Villa Carlos Paz', '1995-11-01', 'vguti@micorreo.com.ar', '15369841', true),
('Carmen', 'Paz', 'Entre Ríos 146 6A', 'Mendoza', '1985-01-09', 'pazcar@micorreo.com.ar', '165314781', true);

select * from socios;