CREATE DATABASE DBArchivos;
GO

USE DBArchivos;
GO

CREATE TABLE TiposArchivos (
    IDTipoArchivo SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TipoArchivo VARCHAR(100) NOT NULL,
)
GO

CREATE TABLE TipoUsuario (
    IDTipoUsuario SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    TipoUsuario VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Usuarios (
    IDUsuario SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Apellido Varchar(100) NOT NULL,
    IDTipoUsuario SMALLINT NOT NULL FOREIGN KEY REFERENCES TipoUsuario(IDTipoUsuario)
)
GO

CREATE Table Archivos (
    IDArchivo SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IDUsuarioDueno SMALLINT NOT NULL FOREIGN KEY REFERENCES Usuarios(IDUsuario),
    Nombre VARCHAR(100) NOT NULL,
    Extension VARCHAR(10) NOT NULL,
    Descripcion VARCHAR(255) NULL,
    IDTipoArchivo SMALLINT NOT NULL FOREIGN KEY REFERENCES TiposArchivos(IDTipoArchivo),
    Tamanio int NOT NULL,
    FechaCreacion DATE NOT NULL,
    FechaUltimaModificacion DATE NOT NULL,
    Eliminado BIT NOT NULL
)
GO

CREATE TABLE Permisos (
    IDPermiso SMALLINT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL
)
GO

CREATE TABLE ArchivosCompartidos(
    IDArchivo SMALLINT NOT NULL,
    IDUsuario SMALLINT NOT NULL,
    IDPermiso SMALLINT NOT NULL FOREIGN KEY REFERENCES Permisos(IDPermiso),
    FechaCompartido DATE NULL,
    PRIMARY KEY (IDArchivo, IDUsuario),
    FOREIGN KEY (IDArchivo) REFERENCES Archivos(IDArchivo),
    FOREIGN KEY (IDUsuario) REFERENCES Usuarios(IDUsuario)
)
GO
