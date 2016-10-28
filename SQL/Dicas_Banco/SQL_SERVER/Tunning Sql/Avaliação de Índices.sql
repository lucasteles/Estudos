-- Avaliação de índices

declare @banco as char(50)
declare @tabela as char(50)

set @banco = 'NOME_DO_BANCO'
set @tabela = 'NOME_DA_TABELA'

select
	ix.name
	,ix.type_desc
	,vwy.partition_number
	,vw.user_seeks
	,vw.last_user_seek
	,vw.user_scans
	,vw.last_user_scan
	,vw.user_lookups
	,vw.user_updates as 'total_user_escrita'
	,(vw.user_scans + vw.user_seeks + vw.user_lookups) as 'total_user_leitura'
	,vw.user_updates - (vw.user_scans + vw.user_seeks + vw.user_lookups) as 'dif_read_write'
	,ix.allow_row_locks
	,vwx.row_lock_count
	,row_lock_wait_count
	,row_lock_wait_in_ms
	,ix.allow_page_locks
	,vwx.page_lock_count
	,page_lock_wait_count
	,page_lock_wait_in_ms
	,ix.fill_factor
	,ix.is_padded
	,vwy.avg_fragmentation_in_percent
	,vwy.avg_page_space_used_in_percent
	,ps.in_row_used_page_count as Total_Pagina_Usadas
	,ps.in_row_reserved_page_count as total_pagina_reservada
	,convert(real, ps.in_row_used_page_count) * 8192 /1024 /1024 as total_indice_usado_mb
	,convert(real, ps.in_row_reserved_page_count) * 8192/1024/1024 as total_indice_reservado_mb
	,page_io_latch_wait_count
	,page_io_latch_wait_in_ms
from sys.dm_db_index_usage_stats vw
join sys.indexes ix on ix.index_id = vw.index_id and ix.object_id = vw.object_id
join sys.dm_db_index_operational_stats(db_id(@banco), object_id(@tabela), null, null) vwx on vwx.index_id = ix.index_id and ix.object_id = vwx.object_id
join sys.dm_db_index_physical_stats(db_id(@banco), object_id(@tabela), null, null, null) vwy on vwy.index_id = ix.index_id and ix.object_id = vwy.object_id and vwy.partition_number = vwx.partition_number
join sys.dm_db_partition_stats ps on ps.index_id = vw.index_id and ps.object_id = vw.object_id
where vw.database_id = db_id(@banco) and object_name(vw.object_id) = @tabela
order by user_seeks desc, user_scans desc