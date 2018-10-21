
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/21/2018 09:50:00
-- Generated from EDMX file: c:\users\teather\documents\visual studio 2017\Projects\ModelEntityFrameWorkDemo\ModelEntityFrameWorkDemo\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [HomeWorkDb];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AuthorBook_Author]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuthorBook] DROP CONSTRAINT [FK_AuthorBook_Author];
GO
IF OBJECT_ID(N'[dbo].[FK_AuthorBook_Book]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuthorBook] DROP CONSTRAINT [FK_AuthorBook_Book];
GO
IF OBJECT_ID(N'[dbo].[FK_VisitorCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_VisitorCart];
GO
IF OBJECT_ID(N'[dbo].[FK_BookCart]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CartSet] DROP CONSTRAINT [FK_BookCart];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[AuthorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorSet];
GO
IF OBJECT_ID(N'[dbo].[BookSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BookSet];
GO
IF OBJECT_ID(N'[dbo].[VisitorSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VisitorSet];
GO
IF OBJECT_ID(N'[dbo].[CartSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CartSet];
GO
IF OBJECT_ID(N'[dbo].[AuthorBook]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorBook];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'AuthorSet'
CREATE TABLE [dbo].[AuthorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'BookSet'
CREATE TABLE [dbo].[BookSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Pages] int  NOT NULL
);
GO

-- Creating table 'VisitorSet'
CREATE TABLE [dbo].[VisitorSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(50)  NOT NULL,
    [LastName] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'CartSet'
CREATE TABLE [dbo].[CartSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [isHand] smallint  NOT NULL,
    [dateOf] nvarchar(max)  NOT NULL,
    [VisitorId] int  NOT NULL,
    [BookId] int  NOT NULL
);
GO

-- Creating table 'AuthorBook'
CREATE TABLE [dbo].[AuthorBook] (
    [Author_Id] int  NOT NULL,
    [Book_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'AuthorSet'
ALTER TABLE [dbo].[AuthorSet]
ADD CONSTRAINT [PK_AuthorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'BookSet'
ALTER TABLE [dbo].[BookSet]
ADD CONSTRAINT [PK_BookSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VisitorSet'
ALTER TABLE [dbo].[VisitorSet]
ADD CONSTRAINT [PK_VisitorSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [PK_CartSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Author_Id], [Book_Id] in table 'AuthorBook'
ALTER TABLE [dbo].[AuthorBook]
ADD CONSTRAINT [PK_AuthorBook]
    PRIMARY KEY CLUSTERED ([Author_Id], [Book_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Author_Id] in table 'AuthorBook'
ALTER TABLE [dbo].[AuthorBook]
ADD CONSTRAINT [FK_AuthorBook_Author]
    FOREIGN KEY ([Author_Id])
    REFERENCES [dbo].[AuthorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Book_Id] in table 'AuthorBook'
ALTER TABLE [dbo].[AuthorBook]
ADD CONSTRAINT [FK_AuthorBook_Book]
    FOREIGN KEY ([Book_Id])
    REFERENCES [dbo].[BookSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorBook_Book'
CREATE INDEX [IX_FK_AuthorBook_Book]
ON [dbo].[AuthorBook]
    ([Book_Id]);
GO

-- Creating foreign key on [VisitorId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_VisitorCart]
    FOREIGN KEY ([VisitorId])
    REFERENCES [dbo].[VisitorSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VisitorCart'
CREATE INDEX [IX_FK_VisitorCart]
ON [dbo].[CartSet]
    ([VisitorId]);
GO

-- Creating foreign key on [BookId] in table 'CartSet'
ALTER TABLE [dbo].[CartSet]
ADD CONSTRAINT [FK_BookCart]
    FOREIGN KEY ([BookId])
    REFERENCES [dbo].[BookSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BookCart'
CREATE INDEX [IX_FK_BookCart]
ON [dbo].[CartSet]
    ([BookId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------