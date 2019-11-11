
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/10/2019 21:03:54
-- Generated from EDMX file: C:\Users\Facultad\Desktop\TP Final\ProyectoEpilepsiaWebYApi\Proyecto .NET\Epilepsia .NET\Epilepsia .NET\EpilepsiaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [DB_A4EFB7_aura];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Medicacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Medicamento] DROP CONSTRAINT [FK_Medicacion];
GO
IF OBJECT_ID(N'[dbo].[FK_Paciente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TutorPaciente] DROP CONSTRAINT [FK_Paciente];
GO
IF OBJECT_ID(N'[dbo].[FK_Registro_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Registro_Episodio] DROP CONSTRAINT [FK_Registro_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Telefono_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Telefono] DROP CONSTRAINT [FK_Telefono_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Token_Login_Id]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Token_Login] DROP CONSTRAINT [FK_Token_Login_Id];
GO
IF OBJECT_ID(N'[dbo].[FK_TokenTutorUsuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TokenTutor] DROP CONSTRAINT [FK_TokenTutorUsuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Tratamiento_Usuario]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tratamiento] DROP CONSTRAINT [FK_Tratamiento_Usuario];
GO
IF OBJECT_ID(N'[dbo].[FK_Tutor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TutorPaciente] DROP CONSTRAINT [FK_Tutor];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_Paciente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Alerta] DROP CONSTRAINT [FK_Usuario_Paciente];
GO
IF OBJECT_ID(N'[dbo].[FK_Usuario_Tutor]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Alerta] DROP CONSTRAINT [FK_Usuario_Tutor];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Alerta]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Alerta];
GO
IF OBJECT_ID(N'[dbo].[Medicamento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Medicamento];
GO
IF OBJECT_ID(N'[dbo].[Registro_Episodio]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Registro_Episodio];
GO
IF OBJECT_ID(N'[dbo].[Telefono]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Telefono];
GO
IF OBJECT_ID(N'[dbo].[Token_Login]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Token_Login];
GO
IF OBJECT_ID(N'[dbo].[TokenTutor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TokenTutor];
GO
IF OBJECT_ID(N'[dbo].[Tratamiento]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tratamiento];
GO
IF OBJECT_ID(N'[dbo].[TutorPaciente]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TutorPaciente];
GO
IF OBJECT_ID(N'[dbo].[Usuario]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Usuario];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Alerta'
CREATE TABLE [dbo].[Alerta] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Tipo_Alerta] int  NULL,
    [Id_Usuario_Paciente] bigint  NOT NULL,
    [Id_Usuario_Tutor] bigint  NOT NULL,
    [Tiempo] datetime  NULL,
    [Notas] varchar(max)  NULL
);
GO

-- Creating table 'Medicamento'
CREATE TABLE [dbo].[Medicamento] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [PacienteId] bigint  NULL,
    [Nombre] varchar(max)  NULL,
    [PeriodicidadHoras] int  NOT NULL,
    [Activo] bit  NOT NULL,
    [UltimaVez] datetime  NULL
);
GO

-- Creating table 'Registro_Episodio'
CREATE TABLE [dbo].[Registro_Episodio] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Fecha] datetime  NULL,
    [Duracion] decimal(6,2)  NULL,
    [Id_Usuario] bigint  NOT NULL
);
GO

-- Creating table 'Telefono'
CREATE TABLE [dbo].[Telefono] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Numero] varchar(max)  NOT NULL,
    [Id_Usuario] bigint  NOT NULL
);
GO

-- Creating table 'Token_Login'
CREATE TABLE [dbo].[Token_Login] (
    [Id_Usuario] bigint IDENTITY(1,1) NOT NULL,
    [Login_Api] varchar(max)  NULL
);
GO

-- Creating table 'TokenTutor'
CREATE TABLE [dbo].[TokenTutor] (
    [TutorID] bigint  NOT NULL,
    [API_Token] varchar(max)  NOT NULL
);
GO

-- Creating table 'Tratamiento'
CREATE TABLE [dbo].[Tratamiento] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Fecha_Inicio] datetime  NOT NULL,
    [Fecha_Fin] datetime  NULL,
    [Medicamento] varchar(max)  NULL,
    [Toma_Cada] varchar(max)  NULL,
    [Dosis] varchar(max)  NULL,
    [Id_Usuario] bigint  NOT NULL
);
GO

-- Creating table 'Usuario'
CREATE TABLE [dbo].[Usuario] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [Nombre] varchar(max)  NULL,
    [Apellido] varchar(max)  NULL,
    [Email] varchar(max)  NOT NULL,
    [Contrasenia] varchar(max)  NOT NULL,
    [FechaNacimiento] datetime  NULL,
    [Estado] bit  NULL,
    [Paciente] bit  NULL,
    [Token] varchar(max)  NULL
);
GO

-- Creating table 'TutorPaciente'
CREATE TABLE [dbo].[TutorPaciente] (
    [Usuario2_Id] bigint  NOT NULL,
    [Usuario1_Id] bigint  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Alerta'
ALTER TABLE [dbo].[Alerta]
ADD CONSTRAINT [PK_Alerta]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Medicamento'
ALTER TABLE [dbo].[Medicamento]
ADD CONSTRAINT [PK_Medicamento]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Registro_Episodio'
ALTER TABLE [dbo].[Registro_Episodio]
ADD CONSTRAINT [PK_Registro_Episodio]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Telefono'
ALTER TABLE [dbo].[Telefono]
ADD CONSTRAINT [PK_Telefono]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id_Usuario] in table 'Token_Login'
ALTER TABLE [dbo].[Token_Login]
ADD CONSTRAINT [PK_Token_Login]
    PRIMARY KEY CLUSTERED ([Id_Usuario] ASC);
GO

-- Creating primary key on [TutorID] in table 'TokenTutor'
ALTER TABLE [dbo].[TokenTutor]
ADD CONSTRAINT [PK_TokenTutor]
    PRIMARY KEY CLUSTERED ([TutorID] ASC);
GO

-- Creating primary key on [Id] in table 'Tratamiento'
ALTER TABLE [dbo].[Tratamiento]
ADD CONSTRAINT [PK_Tratamiento]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Usuario'
ALTER TABLE [dbo].[Usuario]
ADD CONSTRAINT [PK_Usuario]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Usuario2_Id], [Usuario1_Id] in table 'TutorPaciente'
ALTER TABLE [dbo].[TutorPaciente]
ADD CONSTRAINT [PK_TutorPaciente]
    PRIMARY KEY CLUSTERED ([Usuario2_Id], [Usuario1_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Id_Usuario_Paciente] in table 'Alerta'
ALTER TABLE [dbo].[Alerta]
ADD CONSTRAINT [FK_Usuario_Paciente]
    FOREIGN KEY ([Id_Usuario_Paciente])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_Paciente'
CREATE INDEX [IX_FK_Usuario_Paciente]
ON [dbo].[Alerta]
    ([Id_Usuario_Paciente]);
GO

-- Creating foreign key on [Id_Usuario_Tutor] in table 'Alerta'
ALTER TABLE [dbo].[Alerta]
ADD CONSTRAINT [FK_Usuario_Tutor]
    FOREIGN KEY ([Id_Usuario_Tutor])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Usuario_Tutor'
CREATE INDEX [IX_FK_Usuario_Tutor]
ON [dbo].[Alerta]
    ([Id_Usuario_Tutor]);
GO

-- Creating foreign key on [PacienteId] in table 'Medicamento'
ALTER TABLE [dbo].[Medicamento]
ADD CONSTRAINT [FK_Medicacion]
    FOREIGN KEY ([PacienteId])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Medicacion'
CREATE INDEX [IX_FK_Medicacion]
ON [dbo].[Medicamento]
    ([PacienteId]);
GO

-- Creating foreign key on [Id_Usuario] in table 'Registro_Episodio'
ALTER TABLE [dbo].[Registro_Episodio]
ADD CONSTRAINT [FK_Registro_Usuario]
    FOREIGN KEY ([Id_Usuario])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Registro_Usuario'
CREATE INDEX [IX_FK_Registro_Usuario]
ON [dbo].[Registro_Episodio]
    ([Id_Usuario]);
GO

-- Creating foreign key on [Id_Usuario] in table 'Telefono'
ALTER TABLE [dbo].[Telefono]
ADD CONSTRAINT [FK_Telefono_Usuario]
    FOREIGN KEY ([Id_Usuario])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Telefono_Usuario'
CREATE INDEX [IX_FK_Telefono_Usuario]
ON [dbo].[Telefono]
    ([Id_Usuario]);
GO

-- Creating foreign key on [Id_Usuario] in table 'Token_Login'
ALTER TABLE [dbo].[Token_Login]
ADD CONSTRAINT [FK_Token_Login_Id]
    FOREIGN KEY ([Id_Usuario])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [TutorID] in table 'TokenTutor'
ALTER TABLE [dbo].[TokenTutor]
ADD CONSTRAINT [FK_TokenTutorUsuario]
    FOREIGN KEY ([TutorID])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id_Usuario] in table 'Tratamiento'
ALTER TABLE [dbo].[Tratamiento]
ADD CONSTRAINT [FK_Tratamiento_Usuario]
    FOREIGN KEY ([Id_Usuario])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tratamiento_Usuario'
CREATE INDEX [IX_FK_Tratamiento_Usuario]
ON [dbo].[Tratamiento]
    ([Id_Usuario]);
GO

-- Creating foreign key on [Usuario2_Id] in table 'TutorPaciente'
ALTER TABLE [dbo].[TutorPaciente]
ADD CONSTRAINT [FK_TutorPaciente_Usuario]
    FOREIGN KEY ([Usuario2_Id])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Usuario1_Id] in table 'TutorPaciente'
ALTER TABLE [dbo].[TutorPaciente]
ADD CONSTRAINT [FK_TutorPaciente_Usuario1]
    FOREIGN KEY ([Usuario1_Id])
    REFERENCES [dbo].[Usuario]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TutorPaciente_Usuario1'
CREATE INDEX [IX_FK_TutorPaciente_Usuario1]
ON [dbo].[TutorPaciente]
    ([Usuario1_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------