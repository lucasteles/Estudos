use master
go
CREATE DATABASE testelog
ON 
( NAME = testelog,
    FILENAME = 'd:\mssql\data\testelog.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = testelog_log,
    FILENAME = 'd:\mssql\data\testelog_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB )
go
use testelog
go
create table tb_audit
(
pk_id int identity(1,1),
dt_post datetime,
ds_nome char(50)
)
go
use master
go
use testelog
go
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'carlos')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'alberto')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'cordeiro')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'farias')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'junior')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'eduardo')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'adriana')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'bruna')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'ana')
GO
insert into tb_audit (dt_post, ds_nome) values (getdate(), 'gabrielle')
GO
select * from tb_audit
GO
-- BANCO EM ESTADO INICIAL
use master
go
backup database testelog to disk='D:\TESTELOG.BAK'
-- TRABALHO NORMAL
use testelog
go
UPDATE tb_audit SET DS_NOME=UPPER(DS_NOME)
-- HORARIO BASE : 2007-10-16 23:24:00.000
SELECT GETDATE()
-- CAGADA
UPDATE TB_AUDIT SET DS_NOME='CARLOS'
-- BACKUP LOG
use master
go
BACKUP LOG TESTELOG TO DISK='D:\TESTESLOG_LOG.BAK' with norecovery
-- RESTORE BANCO
RESTORE DATABASE TESTELOG FROM DISK='D:\TESTELOG.BAK' WITH noRECOVERY
-- RESTORE LOG
RESTORE LOG TESTELOG FROM DISK='D:\TESTESLOG_LOG.BAK' WITH FILE=1, STOPAT='2007-10-16 23:24:00.000', RECOVERY
