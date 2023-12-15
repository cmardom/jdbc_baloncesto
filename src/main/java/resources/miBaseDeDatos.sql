-- Creación de la base de datos 'miBaseDeDatos'
CREATE DATABASE miBaseDeDatos;

-- Seleccionar la base de datos creada
USE miBaseDeDatos;

-- Creación de la tabla 'cliente'
CREATE TABLE cliente (
                         identificador INT AUTO_INCREMENT PRIMARY KEY,
                         nombre_completo VARCHAR(100),
                         direccion VARCHAR(255),
                         telefono VARCHAR(20),
                         fecha_nacimiento DATE
);

-- Inserciones de datos ficticios
INSERT INTO cliente (nombre_completo, direccion, telefono, fecha_nacimiento) VALUES
                                                                                 ('Juan Pérez', 'Calle Falsa 123, Ciudad', '555-1234', '1980-01-01'),
                                                                                 ('Ana López', 'Av. Siempreviva 456, Ciudad', '555-5678', '1990-02-02'),
                                                                                 ('Carlos García', 'Paseo de la Reforma 789, Ciudad', '555-9012', '1985-03-03'),
                                                                                 ('María Rodríguez', 'Calle Nueva 234, Ciudad', '555-3456', '1995-04-04'),
                                                                                 ('José Sánchez', 'Av. Principal 567, Ciudad', '555-7890', '1975-05-05'),
                                                                                 ('Lucía Gómez', 'Calle Vieja 890, Ciudad', '555-1235', '1988-06-06'),
                                                                                 ('Miguel Ángel Fernández', 'Calle Larga 321, Ciudad', '555-6789', '1992-07-07'),
                                                                                 ('Sofía Martínez', 'Av. Corta 654, Ciudad', '555-2345', '1983-08-08'),
                                                                                 ('David Jiménez', 'Paseo Lento 987, Ciudad', '555-7891', '1990-09-09'),
                                                                                 ('Daniela Vázquez', 'Calle Rápida 345, Ciudad', '555-3457', '1987-10-10'),
                                                                                 ('Javier Hernández', 'Av. Ancha 678, Ciudad', '555-8910', '1982-11-11'),
                                                                                 ('Patricia López', 'Calle Estrecha 432, Ciudad', '555-4567', '1996-12-12'),
                                                                                 ('Manuel Torres', 'Paseo Alto 876, Ciudad', '555-6781', '1981-01-13'),
                                                                                 ('Sara Gutiérrez', 'Calle Baja 654, Ciudad', '555-5679', '1993-02-14'),
                                                                                 ('Fernando Álvarez', 'Av. Larga 543, Ciudad', '555-7892', '1978-03-15'),
                                                                                 ('Elena Ruiz', 'Paseo Corto 210, Ciudad', '555-9013', '1984-04-16'),
                                                                                 ('Diego Ortiz', 'Calle Ancha 109, Ciudad', '555-2346', '1997-05-17'),
                                                                                 ('Laura Ramírez', 'Av. Estrecha 098, Ciudad', '555-3458', '1979-06-18'),
                                                                                 ('Óscar Soto', 'Paseo Redondo 765, Ciudad', '555-6782', '1980-07-19'),
                                                                                 ('Carmen Morales', 'Calle Cuadrada 654, Ciudad', '555-4568', '1985-08-20');
