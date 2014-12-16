<HTML>
	<BODY>
		<HEAD>
			<TITLE>TESTE PHP</TITLE>
			<link rel="stylesheet"type="text/css"href="styleS/E1.css"/>
		</HEAD>
		<FORM METHOD="POST"ACTION="INDEX.PHP">
		<?
			require("SYS.php");

			$COD=	$_GET['id'];
			$NOME=	TrataI($_POST['NOME']);
			$EMAIL=	TrataI($_POST['EMAIL']);
			
		
			$alca=Conecta();
			

			IF($COD<>''){
				$cons=Executa("update clientes set nome='".$NOME."',email='".$EMAIL."' where codigo=".$COD,$alca);
			}
			ELSE{
				$cons=Executa("insert into clientes(nome,email) values('".$NOME."','".$EMAIL."')",$alca);
			}
			
		?>
		Redirecionando....
		<meta HTTP-EQUIV="REFRESH" content="0; url=ConsCli.php">

		</FORM>
	</BODY>
</HTML>