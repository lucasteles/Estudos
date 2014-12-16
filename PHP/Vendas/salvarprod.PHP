<HTML>
	<BODY>
		<HEAD>
			<TITLE>TESTE PHP</TITLE>
			<link rel="stylesheet" type="text/css" href="styleS/E1.css" />
		</HEAD>
		<FORM METHOD="POST" ACTION="INDEX.PHP">
		<?
			require("SYS.php");

			$COD		=	$_GET['id'];
			$PRODUTO	=	TrataI($_POST['PRODUTO']);
			$VALOR		=	str_replace('.','',TrataI($_POST['VALOR']));
			$VALOR		=	str_replace(',','.',$VALOR);
			$DESCRICAO	=	TrataI($_POST['DESCRICAO']);
			
		
			$alca=Conecta();
			

			IF ($COD <> ''){
				$cons=Executa("update produtos set nome='".$PRODUTO."', VALOR='".$VALOR."', DESCRICAO='".$DESCRICAO."' where codigo=".$COD,$alca);
			}
			ELSE{
				$cons=Executa("insert into produtos(nome,valor,descricao) values('".$PRODUTO."','".$VALOR."','".$DESCRICAO."')",$alca);
			}
		?>
		<p>
		Redirecionando....
		<meta HTTP-EQUIV="REFRESH" content="0; url=ConsProd.php">
		
		<!--<table align='center'>
			<tr>
				<td><H4>Suas informaçoes foram salvas com sucesso</H4></td>
			</tr>
			<tr align=center>
				<td><INPUT TYPE="submit" NAME="botaoVoltar" VALUE="Voltar"></td>
			</tr>
		</table> -->
		
		</FORM>
	</BODY>
</HTML>