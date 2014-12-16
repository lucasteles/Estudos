SELECT codtipogen,CAST(descr AS VARCHAR(100)) descr
                            FROM tipogen FOR XML PATH
  
  
  
  
  -------------------------------------
  
  DECLARE @xmlstr AS NVARCHAR(MAX);
  
  SET @xmlstr= 
  N'
  <rows>
   
  </rows>
  '  
  declare @hDoc int
  exec sp_xml_preparedocument @hDoc OUTPUT,@xmlstr
  
    select *
    from OPENXML(@hDoc,'/rows/row',2)
      with(codtipogen int, descr varchar(50))
  xml
exec sp_xml_removedocument @hDoc