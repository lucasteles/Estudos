DECLARE tabelas CURSOR FOR
   SELECT TABLE_NAME 
   FROM INFORMATION_SCHEMA.TABLES
OPEN tabelas
DECLARE @tablename sysname
FETCH NEXT FROM tabelas INTO @tablename
WHILE (@@FETCH_STATUS <> -1) BEGIN
	IF (@@FETCH_STATUS <> -2) BEGIN  
		IF LEFT(@tablename,3)<>'TS_' BEGIN
		  SELECT @tablename = RTRIM(@tablename)
			  PRINT @tablename
			  BEGIN TRY
				--EXEC ('TRUNCATE TABLE ' + @tablename)
			  END TRY
			  BEGIN CATCH
				PRINT @tablename + ' not is a table!' ;
			  END CATCH;
		END
	END
   FETCH NEXT FROM tabelas INTO @tablename
END
CLOSE tabelas
DEALLOCATE tabelas

 
 
 
 
 
 
 
 
 
 
 
 SELECT object_name(id), sysindexes.* FROM sysindexes