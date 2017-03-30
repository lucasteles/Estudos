USE [carteen]
GO

/****** Object: Table [dbo].[PRODUCTS] Script Date: 05/11/2015 10:51:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PRODUCTS] (
    [Id]          INT             IDENTITY (1, 1) NOT NULL,
    [IdStore]     INT             NULL,
    [Name]        CHAR (50)       NULL,
    [Description] CHAR (100)      NULL,
    [Picture]     TEXT            NULL,
    [Price]       NUMERIC (10, 2) NULL,
    [Activated]   BIT             NULL,
    [Created]     DATETIME        NULL,
    [Updated]     SMALLDATETIME   NULL
);


