USE [carteen]
GO

/****** Object: Table [dbo].[SALES] Script Date: 05/11/2015 10:51:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SALES] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [IdUser]    INT           NULL,
    [Activated] BIT           NULL,
    [Created]   DATETIME      NULL,
    [Updated]   SMALLDATETIME NULL,
    [Paid]      BIT           NULL,
    [Delivered] BIT           NULL
);


