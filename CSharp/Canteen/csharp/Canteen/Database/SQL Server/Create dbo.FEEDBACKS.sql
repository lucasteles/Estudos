USE [carteen]
GO

/****** Object: Table [dbo].[FEEDBACKS] Script Date: 05/11/2015 10:51:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FEEDBACKS] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [NAME]        VARCHAR (100) NOT NULL,
    [EMAIL]       VARCHAR (255) NULL,
    [Description] VARCHAR (512) NOT NULL,
    [ACTIVATED]   BIT           NULL,
    [CREATED]     DATETIME2 (7) NULL,
    [UPDATED]     DATETIME2 (7) NULL
);


