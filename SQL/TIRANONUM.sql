CREATE FUNCTION	TIRANONUM(@campo AS VARCHAR(100)) RETURNS INT BEGIN
               	                                              	
DECLARE @cont AS int
SET @cont=0
DECLARE @C AS CHAR(1)
DECLARE @ret AS VARCHAR(100)
SET @ret =''
WHILE @cont < LEN(@campo) BEGIN
	
	SET @C = SUBSTRING( @campo,@CONT,1)
	IF (@C LIKE '%[0-9]%') BEGIN
		SET @RET=@ret+@C			
	END
		
	SET @cont=@cont+1                          	
END 

RETURN CAST(@RET AS INT)
END