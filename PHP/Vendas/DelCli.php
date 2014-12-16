<?
	require("SYS.php");
	$COD=$_GET["id"];
	$alca=Conecta();
	IF($COD<>''){
		Executa("Delete from clientes where codigo='".$COD."'",$alca);
		
	}
	Header("Location: ConsCli.php"); 
?>