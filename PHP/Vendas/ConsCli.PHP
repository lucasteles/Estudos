<HTML>
	<HEAD>
		<TITLE>TESTE PHP</TITLE>
		 <? include("menu.php") ?>
		<script language="JavaScript">
			function msg() {
			  return confirm("Deseja Realmente excluir?");
			}
		</script>
		<link rel="stylesheet" type="text/css" href="styleS/E1.css" />
		<? 
			require("SYS.php");
			$alca=Conecta();
			$cons=Executa("Select * from clientes",$alca);
			$cont=0;
		?>
	</HEAD>
	<BODY>
		<H1>CONSULTA DE CLIENTES</H1>
		<hr>
		<table border="1" align="center" BGCOLOR=WHITE >
			<tr bgcolor=blue align="center">
				<td><font color=white>Codigo</td>
				<td><font color=white>Nome</td>
				<td><font color=white>E-mail</td>
				<td><font color=white>Ações</td>
			</tr>
			<?
				while($cont<mysql_num_rows($cons)){
					$campos=mysql_fetch_array($cons);
			?>
				<tr>
					<td><? echo($campos["CODIGO"]); ?></td>
					<td><? echo($campos["NOME"]); ?></td>
					<td><? echo($campos["EMAIL"]); ?></td>
					<td>
						<table>
							<tr>
								<td><a href=Clientes.php?id=<?echo($campos[0])?>>Alterar</a></td>
								<td><a href=DelCli.php?id=<?echo($campos[0])?> onclick='return msg()'>Excluir</a></td>
							</tr>
						</table>
					</td>
				</tr>			
			<?
				$cont=$cont+1;
				}
				
			?>
				
			
		</table>
		<hr>
		<a href=index.php>Voltar</a>
	</BODY>
</HTML>