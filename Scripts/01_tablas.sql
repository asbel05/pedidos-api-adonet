CREATE DATABASE PedidosDb;
GO
USE PedidosDb;
GO

CREATE TABLE Producto (
ProductoId BIGINT IDENTITY(1,1) PRIMARY KEY,
Nombre VARCHAR(80) NOT NULL,
Precio DECIMAL(18,2) NOT NULL,
Stock INT NOT NULL,

CHECK (Precio >= 0),
CHECK (Stock >=0)
);

CREATE TABLE Pedido (
PedidoId BIGINT IDENTITY(1,1) PRIMARY KEY,
ClienteId BIGINT NOT NULL,
NombreCliente VARCHAR(100) NOT NULL,
Fecha DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
Total DECIMAL(18,2) NOT NULL,

CHECK (ClienteId > 0),
CHECK (Total >= 0)
);

CREATE TABLE DetallePedido (
PedidoId BIGINT NOT NULL,
ProductoId BIGINT NOT NULL,
Cantidad INT NOT NULL,
Precio DECIMAL (18,2) NOT NULL,
Descuento DECIMAL(5,2) NOT NULL,
Subtotal DECIMAL(18,2) NOT NULL,

CONSTRAINT PK_DetallePedido PRIMARY KEY (PedidoId, ProductoId),
CONSTRAINT FK_DetallePedido_Pedido FOREIGN KEY (PedidoId) REFERENCES Pedido(PedidoId),
CONSTRAINT FK_DetallePedido_Producto FOREIGN KEY (ProductoId) REFERENCES Producto(ProductoId),

CHECK (Cantidad > 0),
CHECK (Precio >= 0),
CHECK (Descuento BETWEEN 0 AND 100),
CHECK (Subtotal >= 0)
);