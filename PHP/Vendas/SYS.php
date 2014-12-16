<?
Function Conecta(){
	$alca= mysql_connect('localhost','root','') or die("erro na conexao");
	$base= mysql_select_db('vendas',$alca) or die("erro na banco");
	Return $alca;
}

Function Executa($comando,$alca){
	$cons= mysql_query($comando,$alca)	or die($comando);//"erro na execução"
	Return $cons;
}

function TrataI($sql){
	$sql = preg_replace(sql_regcase("/( from |select|or |and |insert into|delete from|delete * from| where |drop table|show tables|truncate table|#|\*|--|\\\\)/"),"",$sql); //TIRA SINTAXES SQL
	$sql = str_replace('<','&lt;',$sql);
	$sql = str_replace('>','&gt;',$sql);
	$sql = str_replace('"','&quot;',$sql);
	$sql = str_replace("'",'&acute;',$sql);
	$sql = trim($sql);//limpa espaços vazio
	//$sql = strip_tags($sql);//tira tags html e php
	$sql = addslashes($sql);//Adiciona barras invertidas a uma string

	return $sql;
}

?>
