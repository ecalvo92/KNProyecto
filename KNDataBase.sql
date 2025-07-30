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

SET IDENTITY_INSERT [dbo].[TCarrito] ON 
GO
INSERT [dbo].[TCarrito] ([IdCarrito], [IdUsuario], [IdProducto], [Cantidad], [FechaCarrito]) VALUES (1, 2, 1, 5, CAST(N'2025-07-29T20:40:10.243' AS DateTime))
GO
INSERT [dbo].[TCarrito] ([IdCarrito], [IdUsuario], [IdProducto], [Cantidad], [FechaCarrito]) VALUES (2, 2, 2, 1, CAST(N'2025-07-29T20:40:19.043' AS DateTime))
GO
INSERT [dbo].[TCarrito] ([IdCarrito], [IdUsuario], [IdProducto], [Cantidad], [FechaCarrito]) VALUES (3, 2, 3, 2, CAST(N'2025-07-29T20:40:21.030' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TCarrito] OFF
GO

SET IDENTITY_INSERT [dbo].[TProducto] ON 
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (1, N'Ps4', N'Consola de video juegos', 5, CAST(140.00 AS Decimal(10, 2)), 1, N'/Productos/1.png')
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (2, N'Ps7', N'Producto nuevo que no ha salido', 4, CAST(1600.00 AS Decimal(10, 2)), 1, N'/Productos/2.png')
GO
INSERT [dbo].[TProducto] ([IdProducto], [Nombre], [Descripcion], [Cantidad], [Precio], [Estado], [Imagen]) VALUES (3, N'Ps 10', N'Play nuevo', 9, CAST(1900.00 AS Decimal(10, 2)), 1, N'/Productos/3.png')
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