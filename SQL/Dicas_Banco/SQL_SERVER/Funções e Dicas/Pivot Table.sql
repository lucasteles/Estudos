create table venda (ano int, mes int, valor numeric(9,2))

insert venda values (2003, 2, 10)
insert venda values (2003, 2, 1)   
insert venda values (2003, 3, 20)
insert venda values (2003, 4, 30)
insert venda values (2004, 1, 40)
insert venda values (2004, 2, 50)
insert venda values (2004, 3, 60)
insert venda values (2004, 4, 70)
insert venda values (2005, 1, 80)

select * from venda order by 1,2,3

Select ano
, [4] as Abr
, [2] as Fev
, [3] as Mar
, [1] as Jan
from venda pivot (sum(valor) for mes in ([2],[3],[4],[1])) p
order by 1;


Create table #Exemplo (codigo int, nome varchar(10))

insert

into #Exemplo (codigo, nome) Values (1,‘jose’)
insert into #Exemplo (codigo, nome) Values (2,‘mario’)
insert into #Exemplo (codigo, nome) Values (1,‘jose’)
insert into #Exemplo (codigo, nome) Values (2,‘mario’)
insert into #Exemplo (codigo, nome) Values (3,‘celso’)
insert into #Exemplo (codigo, nome) Values (4,‘andre’)

Select
[jose],[mario],[celso],[andre] from #exemplo
Pivot (count(codigo) for nome in ([jose],[mario],[celso],[andre])) p
