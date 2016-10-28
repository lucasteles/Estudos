-- SQL Server 2008

-- Efetua shrink database e retorna espaço restante de volta ao S.O
-- Obs. Comando demorado e exige muito processamento e acesso a disco do servidor
-- podendo ocasionar em lentidão, portanto não recomendado a execução em horário
-- de pico
USE [DatabaseName]
GO
DBCC SHRINKDATABASE(N'DatabaseName' )
GO
DBCC SHRINKFILE (N'Database_Data' , 0, TRUNCATEONLY)
GO
