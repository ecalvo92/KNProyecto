USE [master]
GO

CREATE DATABASE [KNDataBase]
GO

USE [KNDataBase]
GO

CREATE TABLE [dbo].[TCarrito](
	[IdCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
 CONSTRAINT [PK_TCarrito] PRIMARY KEY CLUSTERED 
(
	[IdCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TDetalle](
	[IdDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[IdMaestro] [bigint] NOT NULL,
	[IdProducto] [bigint] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[SubTotal] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tDetalle] PRIMARY KEY CLUSTERED 
(
	[IdDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TMaestro](
	[IdMaestro] [bigint] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [bigint] NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
	[TotalPagado] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TMaestro] PRIMARY KEY CLUSTERED 
(
	[IdMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TProducto](
	[IdProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Descripcion] [varchar](1000) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Imagen] [varchar](255) NOT NULL,
 CONSTRAINT [PK_TProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TRol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionRol] [varchar](100) NOT NULL,
 CONSTRAINT [PK_TRol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[TUsuario](
	[IdUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](10) NOT NULL,
	[IdRol] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_TUsuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET IDENTITY_INSERT [dbo].[TDetalle] ON 
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (1, 1, 2, CAST(1600.00 AS Decimal(18, 2)), 2, CAST(3200.00 AS Decimal(18, 2)), CAST(416.00 AS Decimal(18, 2)), CAST(3616.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (2, 1, 1, CAST(140.00 AS Decimal(18, 2)), 1, CAST(140.00 AS Decimal(18, 2)), CAST(18.20 AS Decimal(18, 2)), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (3, 2, 3, CAST(1900.00 AS Decimal(18, 2)), 3, CAST(5700.00 AS Decimal(18, 2)), CAST(741.00 AS Decimal(18, 2)), CAST(6441.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (4, 3, 2, CAST(1600.00 AS Decimal(18, 2)), 2, CAST(3200.00 AS Decimal(18, 2)), CAST(416.00 AS Decimal(18, 2)), CAST(3616.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (5, 4, 1, CAST(140.00 AS Decimal(18, 2)), 1, CAST(140.00 AS Decimal(18, 2)), CAST(18.20 AS Decimal(18, 2)), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (6, 5, 1, CAST(140.00 AS Decimal(18, 2)), 1, CAST(140.00 AS Decimal(18, 2)), CAST(18.20 AS Decimal(18, 2)), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (7, 6, 1, CAST(140.00 AS Decimal(18, 2)), 2, CAST(280.00 AS Decimal(18, 2)), CAST(36.40 AS Decimal(18, 2)), CAST(316.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (8, 6, 3, CAST(1900.00 AS Decimal(18, 2)), 6, CAST(11400.00 AS Decimal(18, 2)), CAST(1482.00 AS Decimal(18, 2)), CAST(12882.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (9, 7, 3, CAST(1900.00 AS Decimal(18, 2)), 1, CAST(1900.00 AS Decimal(18, 2)), CAST(247.00 AS Decimal(18, 2)), CAST(2147.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (10, 8, 3, CAST(1900.00 AS Decimal(18, 2)), 1, CAST(1900.00 AS Decimal(18, 2)), CAST(247.00 AS Decimal(18, 2)), CAST(2147.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (11, 9, 1, CAST(140.00 AS Decimal(18, 2)), 1, CAST(140.00 AS Decimal(18, 2)), CAST(18.20 AS Decimal(18, 2)), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (12, 9, 3, CAST(1900.00 AS Decimal(18, 2)), 1, CAST(1900.00 AS Decimal(18, 2)), CAST(247.00 AS Decimal(18, 2)), CAST(2147.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (13, 10, 3, CAST(51500.00 AS Decimal(18, 2)), 1, CAST(51500.00 AS Decimal(18, 2)), CAST(6695.00 AS Decimal(18, 2)), CAST(58195.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TDetalle] ([IdDetalle], [IdMaestro], [IdProducto], [Precio], [Cantidad], [SubTotal], [Impuesto], [Total]) VALUES (14, 11, 2, CAST(75.00 AS Decimal(18, 2)), 12, CAST(900.00 AS Decimal(18, 2)), CAST(117.00 AS Decimal(18, 2)), CAST(1017.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[TDetalle] OFF
GO

SET IDENTITY_INSERT [dbo].[TMaestro] ON 
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (1, 2, CAST(N'2025-08-05T20:55:47.913' AS DateTime), CAST(3774.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (2, 2, CAST(N'2025-08-05T20:57:28.037' AS DateTime), CAST(6441.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (3, 2, CAST(N'2025-08-12T18:27:17.543' AS DateTime), CAST(3616.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (4, 2, CAST(N'2025-08-12T18:35:03.710' AS DateTime), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (5, 3, CAST(N'2025-08-12T18:35:27.407' AS DateTime), CAST(158.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (6, 2, CAST(N'2025-08-12T18:48:29.577' AS DateTime), CAST(13198.40 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (7, 2, CAST(N'2025-08-12T18:54:12.520' AS DateTime), CAST(2147.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (8, 3, CAST(N'2025-08-12T18:56:34.080' AS DateTime), CAST(2147.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (9, 2, CAST(N'2025-08-12T18:57:39.140' AS DateTime), CAST(2305.20 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (10, 6, CAST(N'2025-08-12T20:01:54.413' AS DateTime), CAST(58195.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[TMaestro] ([IdMaestro], [IdUsuario], [FechaCompra], [TotalPagado]) VALUES (11, 2, CAST(N'2025-08-12T20:17:13.113' AS DateTime), CAST(1017.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[TMaestro] OFF
GO

SET IDENTITY_INSERT [dbo].[TProducto] ON 
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (1, N'Ps4', N'Consola de video juegos', 4, CAST(140.00 AS Decimal(10, 2)), 0, N'/Productos/1.png')
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (2, N'Ps7', N'Producto nuevo que no ha salido', 0, CAST(75.00 AS Decimal(10, 2)), 1, N'/Productos/2.png')
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (3, N'Ps 10', N'Play nuevo', 5, CAST(51500.00 AS Decimal(10, 2)), 1, N'/Productos/3.png')
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (4, N'Ps17', N'111', 12, CAST(75.00 AS Decimal(10, 2)), 1, N'/Productos/4.png')
GO
SET IDENTITY_INSERT [dbo].[TProducto] OFF
GO

SET IDENTITY_INSERT [dbo].[TRol] ON 
GO
INSERT [dbo].[TRol] ([IdRol], [DescripcionRol]) VALUES (1, N'Usuario Regular')
GO
INSERT [dbo].[TRol] ([IdRol], [DescripcionRol]) VALUES (2, N'Usuario Administrador')
GO
SET IDENTITY_INSERT [dbo].[TRol] OFF
GO

SET IDENTITY_INSERT [dbo].[TUsuario] ON 
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (1, N'304590415', N'CALVO CASTILLO EDUARDO JOSE', N'ecalvo90415@ufide.ac.cr', N'90415', 2, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (2, N'113620173', N'CARLOS HUMBERTO VILLALOBOS PICADO', N'cvillalobos20173@ufide.ac.cr', N'20173', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (3, N'305550650', N'JOHNNY FABIAN CASTILLO FALLAS', N'jcastillo50650@ufide.ac.cr', N'50650', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (4, N'304590416', N'FRANCINI DE LOS ANGELES ROMERO ARAYA', N'ecalvo90416@ufide.ac.cr', N'90416', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (5, N'304590418', N'JOSUE DAVID TREJOS PARRAS', N'ecalvo90417@ufide.ac.cr', N'90417', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (6, N'304590418', N'JESUS ALBERTO NUÑEZ MOYA', N'ecalvo90418@ufide.ac.cr', N'90418', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (7, N'304590419', N'YAILYN PAOLA CESPEDES RODRIGUEZ', N'ecalvo90419@ufide.ac.cr', N'90419', 1, 1)
GO
INSERT [dbo].[TUsuario] ([IdUsuario], [Identificacion], [Nombre], [Correo], [Contrasenna], [IdRol], [Estado]) VALUES (8, N'304590420', N'CAROLINA DE LOS ANGELES ANGULO CALVO', N'ecalvo90420@ufidelitas.ac.cr', N'90419', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[TUsuario] OFF
GO

ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[TProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TProducto]
GO

ALTER TABLE [dbo].[TCarrito]  WITH CHECK ADD  CONSTRAINT [FK_TCarrito_TUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TCarrito] CHECK CONSTRAINT [FK_TCarrito_TUsuario]
GO

ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_TMaestro] FOREIGN KEY([IdMaestro])
REFERENCES [dbo].[TMaestro] ([IdMaestro])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_tDetalle_TMaestro]
GO

ALTER TABLE [dbo].[TDetalle]  WITH CHECK ADD  CONSTRAINT [FK_tDetalle_TProducto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[TProducto] ([IdProducto])
GO
ALTER TABLE [dbo].[TDetalle] CHECK CONSTRAINT [FK_tDetalle_TProducto]
GO

ALTER TABLE [dbo].[TMaestro]  WITH CHECK ADD  CONSTRAINT [FK_TMaestro_TUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TMaestro] CHECK CONSTRAINT [FK_TMaestro_TUsuario]
GO

ALTER TABLE [dbo].[TUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TUsuario_TRol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[TRol] ([IdRol])
GO
ALTER TABLE [dbo].[TUsuario] CHECK CONSTRAINT [FK_TUsuario_TRol]
GO

CREATE PROCEDURE [dbo].[ConsultarProductos]

AS
BEGIN
	
	SELECT IdProducto,
		   Nombre,
		   Descripcion,
		   Cantidad,
		   Precio,
		   Estado,
		   Imagen
	  FROM dbo.TProducto

END
GO

CREATE PROCEDURE [dbo].[ProcesarPago]
	@IdUsuario BIGINT
AS
BEGIN
	
	--MAESTRO
	INSERT	INTO dbo.TMaestro(IdUsuario,FechaCompra,TotalPagado)
	SELECT	C.IdUsuario, GETDATE(), SUM((C.Cantidad * P.Precio) * 1.13)
	FROM	dbo.TCarrito C
	INNER	JOIN dbo.TProducto P ON C.IdProducto = P.IdProducto
	WHERE	IdUsuario = @IdUsuario
	GROUP BY C.IdUsuario
 
	--# FACTURA
	DECLARE @IdMaestro BIGINT = SCOPE_IDENTITY()

	--DETALLE
	INSERT INTO dbo.TDetalle(IdMaestro,IdProducto,Precio,Cantidad,SubTotal,Impuesto,Total)
	SELECT	@IdMaestro, C.IdProducto, P.Precio, C.Cantidad, 
			(P.Precio * C.Cantidad),
			(P.Precio * C.Cantidad) * 0.13,
			(P.Precio * C.Cantidad) * 1.13
	FROM	dbo.TCarrito C
	INNER	JOIN dbo.TProducto P ON C.IdProducto = P.IdProducto
	WHERE	IdUsuario = @IdUsuario

	--REBAJA DEL INVENTARIO
	UPDATE	P
	SET		P.Cantidad = P.Cantidad - C.Cantidad
	FROM	TProducto P
	INNER	JOIN TCarrito C ON P.IdProducto = C.IdProducto
	WHERE	IdUsuario = @IdUsuario

	--LIMPIAR CARRITO
	DELETE FROM TCarrito
	WHERE IdUsuario = @IdUsuario

END
GO

CREATE PROCEDURE [dbo].[RegistroProducto]
	@Nombre varchar(255),
	@Descripcion varchar(1000),
	@Cantidad int,
	@Precio decimal(10,2),
	@Imagen varchar(255)
AS
BEGIN

	INSERT INTO dbo.TProducto (Nombre, Descripcion, Cantidad, Precio, Estado, Imagen)
	VALUES (@Nombre, @Descripcion, @Cantidad, @Precio, 1, @Imagen)

	SELECT SCOPE_IDENTITY() 'IdProducto'

END
GO

CREATE PROCEDURE [dbo].[RegistroUsuario]
	@Identificacion varchar(20),
	@Nombre varchar(255),
	@Correo varchar(100),
	@Contrasenna varchar(10)
AS
BEGIN

	INSERT INTO dbo.TUsuario (Identificacion,Nombre,Correo,Contrasenna,IdRol, Estado)
	VALUES (@Identificacion, @Nombre, @Correo, @Contrasenna, 1, 1)

END
GO

CREATE PROCEDURE [dbo].[ValidarInicioSesion]
	@Correo varchar(100),
	@Contrasenna varchar(10)
AS
BEGIN
	
	SELECT	IdUsuario,
			Identificacion,
			Nombre,
			Correo,
			Contrasenna,
			Estado,
			U.IdRol,
			R.DescripcionRol
	  FROM	dbo.TUsuario U
	  INNER JOIN dbo.TRol R ON U.IdRol = R.IdRol
	  WHERE Correo = @Correo
		AND Contrasenna = @Contrasenna
		AND Estado = 1

END
GO