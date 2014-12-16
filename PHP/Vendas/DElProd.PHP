<?
	require("SYS.php");
	$COD=$_GET["id"];
	$alca=Conecta();
	IF($COD<>''){
		Executa("Delete from produtos where codigo='".$COD."'",$alca);
		
	}
	Header("Location: ConsProd.php"); 
?>