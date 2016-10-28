-- Mostra densidade do arquivo
DBCC SHOWCONTIG('ft_nfiscais')

-- Refaz índice primário para reduzir fragmentação da tabela
DBCC DBREINDEX( 'ft_nfiscais',PK_TS_NFISCAIS,90)

SELECT TOP 200 object_name(OBJECT_ID),* FROM sys.indexes 
WHERE object_name(OBJECT_ID) = 'PC_SERIALETAPAS'

DBCC SHOWCONTIG('PC_SERIALETAPAS') WITH ALL_INDEXES

select top 200
'ALTER INDEX ' + name  + ' ON ' + object_name(object_id)
+ ' REBUILD WITH ( PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, SORT_IN_TEMPDB = OFF, ONLINE = OFF )'
from sys.indexes
where name like 'PK_TB_CADU%'

Select
	a.Index_Id
	,Name
	,Avg_Fragmentation_in_Percent
From Sys.Dm_db_index_physical_stats(DB_ID(), OBJECT_ID(N'Person.Contact'), NULL, NULL, NULL) AS a
JOIN Sys.indexes as b on a.OBJECT_ID = b.OBJECT_ID AND a.index_id = b.index_id
