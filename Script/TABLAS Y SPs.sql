USE [master]
GO

/****** Object:  Database [AlmacenIngresoHitss]    Script Date: 07/06/2024 15:58:06 ******/
CREATE DATABASE [AlmacenIngresoHitss]
 
GO
USE [AlmacenIngresoHitss]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoIdentificacion] [int] NOT NULL,
	[NumeroIdentificacion] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Telefono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](50) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoIdentificacion]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoIdentificacion](
	[IdTipoIdentificacion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoIdentificacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdProductoCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdProducto] [int] NOT NULL,
	[ValorTotal] [decimal](18, 2) NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdProductoCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_TIPO_DOCUMENTO] FOREIGN KEY([IdTipoIdentificacion])
REFERENCES [dbo].[TipoIdentificacion] ([IdTipoIdentificacion])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_TIPO_DOCUMENTO]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_CLIENTE] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_VENTA_CLIENTE]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_VENTA_PRODUCTO] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_VENTA_PRODUCTO]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarCliente]
	-- Add the parameters for the stored procedure here
	@IDCLIENTE INT,
	@TipoIdentificacion int,
	@NumeroIdentificacion varchar(50),
	@Nombres varchar(50),
	@Apellidos varchar(50),
	@Telefono  varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Cliente 
	SET Nombres=@Nombres,Apellidos=@Apellidos,Telefono=@Telefono
	WHERE IdCliente =@IDCLIENTE
	

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProducto]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarProducto]
	-- Add the parameters for the stored procedure here
	@IdProducto INT,
	@Nombreproducto varchar(50),
	@Cantidad int,
	@Precio decimal(18,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Producto
	SET Nombreproducto=@Nombreproducto,Cantidad=@Cantidad,Precio=@Precio
	WHERE IdProducto =@IdProducto


END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarVenta]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarVenta]
	-- Add the parameters for the stored procedure here
	@IdProductoCliente int,
	@IdCliente int,
	@IdProducto int,
	@ValorTotal decimal(18,2),
	@FechaCompra datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	
	UPDATE venta
	set IdCliente=@IdCliente,IdProducto=@IdProducto,ValorTotal=@ValorTotal,FechaCompra=@FechaCompra
	where IdProductoCliente = @IdProductoCliente and IdCliente = @IdCliente 
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarCliente]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarCliente]
	@IdCliente int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select ti.Descripcion,NumeroIdentificacion,Nombres,Apellidos,Telefono from Cliente
  inner join TipoIdentificacion ti on Cliente.idtipoidentificacion = ti.IdTipoIdentificacion
  where IdCliente = @IdCliente
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProducto]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarProducto]
	@IdProducto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select [NombreProducto],[Cantidad],[Precio] from Producto
  where IdProducto =@IdProducto
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVentas]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarVentas]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select c.nombres as Nombre,c.apellidos as Apellidos,p.nombreproducto as Producto, ValorTotal as Valor, FechaCompra As Fecha from Venta
inner join Cliente c on Venta.IdCliente = c.IdCliente
inner join Producto p on Venta.IdProducto = p.NombreProducto

END
GO
/****** Object:  StoredProcedure [dbo].[CrearCliente]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearCliente]
	-- Add the parameters for the stored procedure here
	@idTipoIdentificacion int,
	@NumeroIdentificacion varchar(50),
	@Nombres varchar(50),
	@Apellidos varchar(50),
	@Telefono  varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Cliente (idTipoIdentificacion,NumeroIdentificacion,Nombres,Apellidos,Telefono)
	VALUES (@idTipoIdentificacion,@NumeroIdentificacion,@Nombres,@Apellidos,@Telefono)

END
GO
/****** Object:  StoredProcedure [dbo].[CrearProducto]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CrearProducto]
	-- Add the parameters for the stored procedure here
	@Nombreproducto varchar(50),
	@Cantidad int,
	@Precio decimal(18,2)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Producto(Nombreproducto,Cantidad,Precio)
	VALUES (@Nombreproducto,@Cantidad,@Precio)

END
GO
/****** Object:  StoredProcedure [dbo].[InsertarVenta]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertarVenta]
	-- Add the parameters for the stored procedure here
	@IdCliente int,
	@IdProducto int,
	@ValorTotal decimal(18,2),
	@FechaCompra datetime

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO venta(IdCliente,IdProducto,ValorTotal,FechaCompra)
	VALUES (@IdCliente,@IdProducto,@ValorTotal,@FechaCompra)

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerProductos]    Script Date: 07/06/2024 16:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerProductos]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select [NombreProducto],[Cantidad],[Precio] from Producto
  order by 1 desc
END
GO

SET IDENTITY_INSERT [dbo].[TipoIdentificacion] ON 
GO
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion]) VALUES (1, N'Cedula')
GO
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion]) VALUES (2, N'Pasaporte')
GO
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion]) VALUES (3, N'NIT')
GO
INSERT [dbo].[TipoIdentificacion] ([IdTipoIdentificacion], [Descripcion]) VALUES (4, N'TarjetaIdentidad')
GO
SET IDENTITY_INSERT [dbo].[TipoIdentificacion] OFF
