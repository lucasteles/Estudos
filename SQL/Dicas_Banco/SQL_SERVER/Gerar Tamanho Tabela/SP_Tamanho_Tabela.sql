use VolpeCliente
go

sp_MSforeachTable @command1="print '>>>Tabela: ?' ", @command2="SP_GRAVAR_TAMANHO_TABELAS '?' "
go
