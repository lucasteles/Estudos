USE [estudo]
GO
/****** Object:  Table [dbo].[TB_TELAS]    Script Date: 02/14/2012 13:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_TELAS](
    [PK_ID] [int] IDENTITY(1,1) NOT NULL,
    [DS_TELA] [char](50) NULL,
    [DS_FORM] [varchar](120) NULL,
    [NR_ORDEM] [int] NULL,
    [FK_MODULO] [int] NULL,
PRIMARY KEY NONCLUSTERED
(
    [PK_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_TELAS] ON
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (1, N'Cadastro Principal                                ', N'TESTE_FORM', 1, 1)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (2, N'Tipos de Cadastro                                 ', N'TESTE_FORM2', 2, 1)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (3, N'Cadatro de Cidades                                ', N'TESTE_FORM3', 3, 1)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (4, N'Usuarios                                          ', N'TESTE_FORM4', 1, 2)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (5, N'Ambiente                                          ', N'TESTE_FORM5', 2, 2)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (6, N'Direitos                                          ', N'TESTE_FORM6', 3, 2)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (8, N'Notas Fiscais                                     ', N'TESTE_FORM7', 1, 3)
INSERT [dbo].[TB_TELAS] ([PK_ID], [DS_TELA], [DS_FORM], [NR_ORDEM], [FK_MODULO]) VALUES (9, N'Faturamento de Pedidos                            ', N'TESTE_FORM7', 2, 3)
SET IDENTITY_INSERT [dbo].[TB_TELAS] OFF
/****** Object:  Table [dbo].[TB_MODULOS]    Script Date: 02/14/2012 13:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TB_MODULOS](
    [PK_ID] [int] IDENTITY(1,1) NOT NULL,
    [DS_MODULO] [char](50) NULL,
    [NR_ORDEM] [int] NULL,
PRIMARY KEY NONCLUSTERED
(
    [PK_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TB_MODULOS] ON
INSERT [dbo].[TB_MODULOS] ([PK_ID], [DS_MODULO], [NR_ORDEM]) VALUES (1, N'Cadastros                                         ', 1)
INSERT [dbo].[TB_MODULOS] ([PK_ID], [DS_MODULO], [NR_ORDEM]) VALUES (2, N'Opções                                            ', 99)
INSERT [dbo].[TB_MODULOS] ([PK_ID], [DS_MODULO], [NR_ORDEM]) VALUES (3, N'Faturamento                                       ', 2)
SET IDENTITY_INSERT [dbo].[TB_MODULOS] OFF



 
 
