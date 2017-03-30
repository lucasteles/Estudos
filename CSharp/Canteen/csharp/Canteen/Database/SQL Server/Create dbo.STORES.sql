USE [carteen]
GO

/****** Object: Table [dbo].[STORES] Script Date: 05/11/2015 10:51:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[STORES] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [Name]      CHAR (50)     NULL,
    [Picture]   TEXT          NULL,
    [Activated] BIT           NULL,
    [Created]   DATETIME      NULL,
    [Updated]   SMALLDATETIME NULL
);


