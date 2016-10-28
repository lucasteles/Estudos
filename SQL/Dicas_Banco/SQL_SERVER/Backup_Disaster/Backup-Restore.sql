-- Criando Backup do banco de dados
BACKUP DATABASE [VolpeHbusterAM] TO DISK = 'BACKUP_VOLPEHBAM.BAK' WITH COPY_ONLY

-- Visualizar conteúdo do arquivo de backup
RESTORE FILELISTONLY
   FROM DISK = 'c:\VolpeHbusterAM.bak'
   
-- Restaurar banco de dados
-- a partir de um arquivo de backup
RESTORE DATABASE VolpeHbusterAM
	FROM DISK = 'c:\VolpeHbusterAM.bak'
	WITH RECOVERY,
	MOVE 'VolpeHbusterAM' TO 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\VolpeHbusterAM.mdf',
	MOVE 'VolpeHbusterAM_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\VolpeHbusterAM_log.ldf'

USE master
GO
-- First determine the number and names of the files in the backup.
-- AdventureWorks_Backup is the name of the backup device.
RESTORE FILELISTONLY
   FROM AdventureWorks_Backup
-- Restore the files for MyAdvWorks.
RESTORE DATABASE MyAdvWorks
   FROM AdventureWorks_Backup
   WITH RECOVERY,
   MOVE 'AdventureWorks_Data' TO 'D:\MyData\MyAdvWorks_Data.mdf', 
   MOVE 'AdventureWorks_Log' TO 'F:\MyLog\MyAdvWorks_Log.ldf'
GO