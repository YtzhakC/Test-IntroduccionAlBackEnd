CREATE DATABASE TestYtzhak;
USE TestYtzhak;

CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE
);


CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    correo VARCHAR(100) UNIQUE
);


CREATE TABLE Bicicletas (
    bicicleta_id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(50),
    marca VARCHAR(50),
    precio DECIMAL(10,2),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);


CREATE TABLE Repuestos (
    repuesto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10,2),
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

CREATE TABLE Detalle_Venta (
    venta_id INT,
    bicicleta_id INT,
    cantidad INT,
    PRIMARY KEY (venta_id, bicicleta_id),
    FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    FOREIGN KEY (bicicleta_id) REFERENCES Bicicletas(bicicleta_id)
);

CREATE TABLE Compras (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    fecha DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE Detalle_Compra (
    compra_id INT,
    repuesto_id INT,
    cantidad INT,
    PRIMARY KEY (compra_id, repuesto_id),
    FOREIGN KEY (compra_id) REFERENCES Compras(compra_id),
    FOREIGN KEY (repuesto_id) REFERENCES Repuestos(repuesto_id)
);

CREATE TABLE Inventario (
    bicicleta_id INT,
    cantidad INT,
    tipo VARCHAR(50),
    PRIMARY KEY (bicicleta_id, tipo),
    FOREIGN KEY (bicicleta_id) REFERENCES Bicicletas(bicicleta_id)
);

DESCRIBE Bicicletas;

DESCRIBE Clientes ;

DESCRIBE Compras; 

DESCRIBE Detalle_Compra;

DESCRIBE Detalle_Venta;

DESCRIBE Inventario;

DESCRIBE Proveedores;

DESCRIBE Repuestos;

DESCRIBE Ventas;
