CREATE DATABASE TestYtzhak;
USE TestYtzhak;

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE
);


CREATE TABLE Proveedor (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE
);


CREATE TABLE Bicicleta (
    bicicleta_id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    precio DECIMAL(10,2),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);


CREATE TABLE Repuesto (
    repuesto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10,2),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

CREATE TABLE Venta (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id)
);

CREATE TABLE Detalle_Venta (
    venta_id INT,
    bicicleta_id INT,
    cantidad INT,
    PRIMARY KEY (venta_id, bicicleta_id),
    FOREIGN KEY (venta_id) REFERENCES Venta(venta_id),
    FOREIGN KEY (bicicleta_id) REFERENCES Bicicleta(bicicleta_id)
);

CREATE TABLE Compra (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedor(proveedor_id)
);

CREATE TABLE Detalle_Compra (
    compra_id INT,
    repuesto_id INT,
    cantidad INT,
    PRIMARY KEY (compra_id, repuesto_id),
    FOREIGN KEY (compra_id) REFERENCES Compra(compra_id),
    FOREIGN KEY (repuesto_id) REFERENCES Repuesto(repuesto_id)
);

CREATE TABLE Inventario (
    bicicleta_id INT,
    cantidad INT,
    tipo VARCHAR(50),
    PRIMARY KEY (bicicleta_id, tipo),
    FOREIGN KEY (bicicleta_id) REFERENCES Bicicleta(bicicleta_id)
);

DESCRIBE Bicicleta;

DESCRIBE Cliente;

DESCRIBE Compra; 

DESCRIBE Detalle_Compra;

DESCRIBE Detalle_Venta;

DESCRIBE Inventario;

DESCRIBE Proveedor;

DESCRIBE Repuesto;

DESCRIBE Venta;
