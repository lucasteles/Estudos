-- Visualizar número atual de identity
DBCC CHECKIDENT(Nome_Tabela)

-- Alterar próximo número identity da tabela
DBCC CHECKIDENT(Nome_Tabela, RESEED, 10)

-- Inserir registro especificando coluna identity
SET IDENTITY_INSERT TB_CADUNICO ON -- DESLIGA INSERT
INSERT INTO TB_CADUNICO(PK_ID) VALUES (10)
SET IDENTITY_INSERT TB_CADUNICO OFF --LIGA INSERT
