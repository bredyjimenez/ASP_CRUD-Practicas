use master
GO
/****** Object:  Database [SQL_CRUD] ******/
CREATE DATABASE [SQL_CRUD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL_CRUD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SQL_CRUD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SQL_CRUD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SQL_CRUD_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
USE [SQL_CRUD]
GO
/****** Object:  Table [dbo].[empleados] ******/
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[apellido] [varchar](40) NOT NULL,
	[cedula] [char](11) NOT NULL,
	[telefono] [char](10) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[genero] [char](1) NOT NULL,
	[id_nacionalidad] [int] NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[condicion] [char](1) NOT NULL,
	[fecha_entrada] [date] NOT NULL,
	[fecha_salida] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nacionalidades] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nacionalidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](40) NOT NULL,
	[estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_nacionalidades] FOREIGN KEY([id_nacionalidad])
REFERENCES [dbo].[nacionalidades] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[empleados] CHECK CONSTRAINT [FK_empleados_nacionalidades]
GO
/****** Object:  StoredProcedure [dbo].[pa_sql] ******/
CREATE proc pa_sql
@accion char(1),
@nombre varchar(40)=null,
@apellido varchar(40) =null,
@cedula char(11)=null,
@telefono char(10)=null,
@direccion varchar(100)=null,
@genero char(1)=null,
@id_nacionalidad int = null,
@fecha_nacimiento date=null,
@condicion char(1)=null,
@fecha_entrada date=null,
@fecha_salida date =null,
@id int = null
as
if(@accion='1')
begin
insert into empleados (nombre,apellido,cedula,telefono,direccion,genero, id_nacionalidad, fecha_nacimiento,condicion,fecha_entrada,fecha_salida) values (@nombre,@apellido ,@cedula,@telefono,
@direccion ,@genero, @id_nacionalidad ,@fecha_nacimiento ,@condicion ,@fecha_entrada ,@fecha_salida )
end
else if(@accion='2')
begin
update empleados set  nombre = @nombre,apellido = @apellido ,cedula=@cedula,telefono=@telefono,direccion=@direccion, id_nacionalidad=@id_nacionalidad, genero=@genero,fecha_nacimiento=@fecha_nacimiento,condicion=@condicion,fecha_entrada=@fecha_entrada,fecha_salida=@fecha_salida
end
else if(@accion='3')
begin
delete from empleados where id = @id
end
go
/****** Object:  StoredProcedure [dbo].[pa_nacionalidad] ******/
CREATE proc pa_nacionalidad
@accion char(1),
@nombre varchar(40)=null,
@estado bit = null,
@id  int = null
as
if(@accion='I')
begin
insert into nacionalidades (nombre, estado) values (@nombre, @estado)
end
else if(@accion='U')
begin
update nacionalidades set nombre = @nombre, estado = @estado
end
else if(@accion='D')
begin
delete from nacionalidades where id = @id
end
else if(@accion='S')
begin
select * from nacionalidades
end
go