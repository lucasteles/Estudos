use master
go
/*
	EFETUANDO BACKUP DO BANCO DE DADOS
*/
-- BACKUP COMPLETO DO BANCO
backup database volpehbustersp to disk= 'c:\Backup_SQL\Segunda\volpehbustersp.bak'
go
--- VERIFICA INFORMAÇÕES DO BANCO
sp_helpdb volpehbustersp
--- CORRIGE EVENTUAIS ERROS NO BANCO DE DADOS
dbcc checkdb ('volpehbustersp')
go
--- EXECUTA CHECKPOINT PARA LIMEZA DO LOG
backup log volpehbustersp with no_log
go
--- DESFRAGMENTA OS ARQUIVOS FÍSICOS DO BANCO (DADOS E LOG
dbcc shrinkdatabase ( 'volpehbustersps' , 0 )
go


