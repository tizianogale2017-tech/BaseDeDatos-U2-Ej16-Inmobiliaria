-- Base de Datos I - Unidad 4 - Ej16: Inmobiliaria
-- Script portable (SQLite / MySQL). En SQLite activar antes: PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS PAGO;
DROP TABLE IF EXISTS CONTRATO;
DROP TABLE IF EXISTS PROPIEDAD;
DROP TABLE IF EXISTS EMPLEADO;
DROP TABLE IF EXISTS INQUILINO;
DROP TABLE IF EXISTS PROPIETARIO;

CREATE TABLE PROPIETARIO (
    id_propietario INT PRIMARY KEY,
    documento_prop INT,
    nombre_prop VARCHAR(50),
    apellido_prop VARCHAR(50),
    telefono_prop VARCHAR(50),
    email_prop VARCHAR(100) UNIQUE
);

CREATE TABLE INQUILINO (
    id_inquilino INT PRIMARY KEY,
    documento_inq INT,
    nombre_inq VARCHAR(50),
    apellido_inq VARCHAR(50),
    telefono_inq VARCHAR(50),
    email_inq VARCHAR(100) UNIQUE
);

CREATE TABLE EMPLEADO (
    id_empleado INT PRIMARY KEY,
    legajo_empleado VARCHAR(50),
    nombre_empleado VARCHAR(50),
    apellido_empleado VARCHAR(100),
    telefono_empleado VARCHAR(100),
    email_empleado VARCHAR(50) UNIQUE,
    porcentaje_comision DECIMAL(12,2)
);

CREATE TABLE PROPIEDAD (
    id_propiedad INT PRIMARY KEY,
    id_propietario INT,
    codigo_catastral VARCHAR(50) UNIQUE,
    direccion VARCHAR(50),
    ciudad VARCHAR(100),
    tipo_propiedad VARCHAR(50),
    superficie_m2 VARCHAR(100),
    cantidad_ambientes INT,
    precio_tasacion DECIMAL(12,2),
    FOREIGN KEY (id_propietario) REFERENCES PROPIETARIO(id_propietario)
);

CREATE TABLE CONTRATO (
    id_contrato INT PRIMARY KEY,
    id_propiedad INT,
    id_inquilino INT,
    id_empleado INT,
    numero_contrato VARCHAR(100),
    tipo_operacion VARCHAR(50),
    fecha_inicio DATE,
    fecha_fin DATE,
    canon_mensual DECIMAL(12,2),
    deposito_garantia DECIMAL(12,2),
    estado_contrato VARCHAR(100),
    FOREIGN KEY (id_propiedad) REFERENCES PROPIEDAD(id_propiedad),
    FOREIGN KEY (id_inquilino) REFERENCES INQUILINO(id_inquilino),
    FOREIGN KEY (id_empleado) REFERENCES EMPLEADO(id_empleado)
);

CREATE TABLE PAGO (
    id_pago INT PRIMARY KEY,
    id_contrato INT,
    numero_recibo VARCHAR(100),
    periodo_abonado VARCHAR(50),
    fecha_pago DATE,
    monto_abonado DECIMAL(12,2),
    medio_pago VARCHAR(50),
    recargo_mora DECIMAL(12,2),
    FOREIGN KEY (id_contrato) REFERENCES CONTRATO(id_contrato)
);

-- Datos de PROPIETARIO
INSERT INTO PROPIETARIO (id_propietario, documento_prop, nombre_prop, apellido_prop, telefono_prop) VALUES (1, 20111222, 'Raúl', 'Benítez', '261-4111001');
INSERT INTO PROPIETARIO (id_propietario, documento_prop, nombre_prop, apellido_prop, telefono_prop) VALUES (2, 27333444, 'Gustavo', 'Domínguez', '261-4111003');
INSERT INTO PROPIETARIO (id_propietario, documento_prop, nombre_prop, apellido_prop, telefono_prop) VALUES (3, 20444555, 'Mirta', 'Escobar', '261-4111004');
INSERT INTO PROPIETARIO (id_propietario, documento_prop, nombre_prop, apellido_prop, telefono_prop) VALUES (4, 27555666, 'Oscar', 'Fuentes', '261-4111005');

-- Datos de INQUILINO
INSERT INTO INQUILINO (id_inquilino, documento_inq, nombre_inq, apellido_inq, telefono_inq) VALUES (1, 38111000, 'Julia', 'Acosta', '261-4222001');
INSERT INTO INQUILINO (id_inquilino, documento_inq, nombre_inq, apellido_inq, telefono_inq) VALUES (2, 39222000, 'Kevin', 'Barrios', '261-4222002');
INSERT INTO INQUILINO (id_inquilino, documento_inq, nombre_inq, apellido_inq, telefono_inq) VALUES (3, 41444000, 'Matías', 'Díaz', '261-4222004');
INSERT INTO INQUILINO (id_inquilino, documento_inq, nombre_inq, apellido_inq, telefono_inq) VALUES (4, 42555000, 'Noelia', 'Estévez', '261-4222005');

-- Datos de EMPLEADO
INSERT INTO EMPLEADO (id_empleado, legajo_empleado, nombre_empleado, porcentaje_comision, email_empleado) VALUES (1, 'AG-01', 'Paula', 3.5, 'paula@inmo.com');
INSERT INTO EMPLEADO (id_empleado, legajo_empleado, nombre_empleado, porcentaje_comision, email_empleado) VALUES (2, 'AG-02', 'Sergio', 3.0, 'sergio@inmo.com');
INSERT INTO EMPLEADO (id_empleado, legajo_empleado, nombre_empleado, porcentaje_comision, email_empleado) VALUES (3, 'AG-04', 'Ulises', 3.0, 'ulises@inmo.com');
INSERT INTO EMPLEADO (id_empleado, legajo_empleado, nombre_empleado, porcentaje_comision, email_empleado) VALUES (4, 'AG-05', 'Vanesa', 3.5, 'vanesa@inmo.com');

-- Datos de PROPIEDAD
INSERT INTO PROPIEDAD (id_propiedad, id_propietario, codigo_catastral, direccion, tipo_propiedad) VALUES (1, 1, '13-01-001', 'San Martín 123', 'Departamento');
INSERT INTO PROPIEDAD (id_propiedad, id_propietario, codigo_catastral, direccion, tipo_propiedad) VALUES (2, 1, '13-01-002', 'Belgrano 456', 'Casa');
INSERT INTO PROPIEDAD (id_propiedad, id_propietario, codigo_catastral, direccion, tipo_propiedad) VALUES (3, 2, '13-03-021', 'Godoy Cruz 321', 'Local');
INSERT INTO PROPIEDAD (id_propiedad, id_propietario, codigo_catastral, direccion, tipo_propiedad) VALUES (4, 4, '13-04-033', 'Colón 654', 'Casa');

-- Datos de CONTRATO
INSERT INTO CONTRATO (id_contrato, id_propiedad, id_inquilino, id_empleado, tipo_operacion) VALUES (1, 1, 1, 1, 'Alquiler permanente');
INSERT INTO CONTRATO (id_contrato, id_propiedad, id_inquilino, id_empleado, tipo_operacion) VALUES (2, 2, 2, 2, 'Alquiler temporario');
INSERT INTO CONTRATO (id_contrato, id_propiedad, id_inquilino, id_empleado, tipo_operacion) VALUES (3, 3, 3, 1, 'Alquiler permanente');
INSERT INTO CONTRATO (id_contrato, id_propiedad, id_inquilino, id_empleado, tipo_operacion) VALUES (4, 4, 4, 2, 'Venta');

-- Datos de PAGO
INSERT INTO PAGO (id_pago, id_contrato, periodo_abonado, monto_abonado, medio_pago) VALUES (1, 1, '2026-08', 250000, 'Transferencia');
INSERT INTO PAGO (id_pago, id_contrato, periodo_abonado, monto_abonado, medio_pago) VALUES (2, 1, '2026-09', 250000, 'Transferencia');
INSERT INTO PAGO (id_pago, id_contrato, periodo_abonado, monto_abonado, medio_pago) VALUES (3, 2, '2026-09', 180000, 'Efectivo');
INSERT INTO PAGO (id_pago, id_contrato, periodo_abonado, monto_abonado, medio_pago) VALUES (4, 3, '2026-09', 220000, 'Transferencia');
