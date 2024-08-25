CREATE DATABASE Alba_Sa
GO 
CREATE TABLE Proveedor (
    IDProveedor INT IDENTITY(1,1) PRIMARY KEY,
    NombreProveedor VARCHAR(100) NOT NULL,
    NombreCompañia VARCHAR(100) NOT NULL,
    CargoProveedor VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(100) UNIQUE
);

CREATE TABLE Categoria(
     IDCategoria INT IDENTITY (1,1) PRIMARY KEY,
     NombreCategoria varchar (100),
     DescripcionCategoria varchar (100),
     Estado BIT
);

CREATE TABLE Producto (
    IDProducto INT IDENTITY(1,1) PRIMARY KEY,
	IDCategoria INT,
    NombreProducto VARCHAR(100) NOT NULL,
    PrecioProducto DECIMAL(10, 2) NOT NULL,
	Cantidad INT,
    Estado BIT,
	FOREIGN KEY (IDCategoria) REFERENCES Categoria(IDCategoria)
);

CREATE TABLE Compra (
    IDCompra INT IDENTITY(1,1) PRIMARY KEY,
    IDProveedor INT,
	IDProducto INT,
    FechaCompra DATE,
    SubTotal DECIMAL(10,2),
    Total DECIMAL(10,2),
    FOREIGN KEY (IDProveedor) REFERENCES Proveedor(IDProveedor),
	FOREIGN KEY (IDProducto) REFERENCES Producto (IDProducto)
);

CREATE TABLE DetalleCompra (
    IDCompra INT,
    CantidadProducto INT,
	DescripcionProducto VARCHAR (100),
    PrecioUnidad DECIMAL(10,2),
    FOREIGN KEY (IDCompra) REFERENCES Compra(IDCompra)
);


CREATE TABLE Empleado (
    IDEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Cedula VARCHAR(20) UNIQUE,
    Cargo VARCHAR(50),
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(100) UNIQUE
);

CREATE TABLE Cliente (
    IDCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(100) UNIQUE
);

CREATE TABLE Factura (
	IDFactura INT IDENTITY(1,1) PRIMARY KEY,
    IDCliente INT,
    IDEmpleado INT,
    Fecha DATETIME,
    Subtotal DECIMAL(10,2),
    Total DECIMAL(10,2), 
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
);

CREATE TABLE DetalleFactura (
    IDFactura INT,
    IDProducto INT,
	NombreProducto VARCHAR(100),
    Cantidad INT,
    PrecioUnidad DECIMAL(10,2),
	UnidadMedida VARCHAR(100)
    FOREIGN KEY (IDFactura) REFERENCES Factura(IDFactura),
	FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);

CREATE TABLE Venta (
    IDVenta INT PRIMARY KEY,
	IDFactura INT,
    TotalVenta DECIMAL(10, 2),
    EstadoVenta VARCHAR(20),
    FOREIGN KEY (IDFactura) REFERENCES Factura(IDFactura)
);
CREATE TABLE USUARIO (
    UsuarioID INT IDENTITY(1,1) primary key,
	IDEmpleado INT,
    NombreUsuario varchar(100) unique not null,
    Password varchar(100) not null,
    Nombre varchar(100) not null,
    Apellido varchar(100) not null,
    Cargo varchar(100) not null,
	FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado)
); 
