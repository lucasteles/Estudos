declare @TAB_TEMP TABLE(data smalldatetime) -- Criando temporária
declare @dt_inicio datetime, @dt_fim datetime -- Criando variavel de inicio e fim
set @dt_inicio = cast(cast(year(getdate()) - 4 as char(4)) + '-01-01' as datetime)
set @dt_fim = getdate()
while @dt_inicio < @dt_fim
begin
      set @dt_inicio = dateadd(day, 1, @dt_inicio)
      insert into @TAB_TEMP values (@dt_inicio) -- inserindo na temporaria
end
select * from @TAB_TEMP -- retornando temporaria
