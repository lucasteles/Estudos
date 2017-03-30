USE [carteen]
GO

/****** Object: Table [dbo].[SALEITEMS] Script Date: 05/11/2015 10:51:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALEITEMS] (
    [Id]        INT             IDENTITY (1, 1) NOT NULL,
    [IdSale]    INT             NULL,
    [IdProduct] INT             NULL,
    [Amount]    INT             NULL,
    [Price]     NUMERIC (10, 2) NULL,
    [Activated] BIT             NULL,
    [Created]   DATETIME        NULL,
    [Updated]   SMALLDATETIME   NULL
);


