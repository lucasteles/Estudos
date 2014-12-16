<HTML>
	<HEAD>
		<TITLE>TESTE PHP</TITLE>
		 <? include("menu.php") ?>
		<link rel="stylesheet" type="text/css" href="styleS/E1.css" />
		<script language="Javascript" type="text/javascript" src="JS/Funcs.js"></script>
	</HEAD>
	<BODY>
	
	<H1>PRODUTOS</H1>
		<?
			$cod=$_GET["id"];
		
			IF ($cod <> '' ){
				require("SYS.php");
				$alca=Conecta();
				$cons=Executa("Select * from produtos where codigo=".$cod ,$alca);
				$campos=mysql_fetch_array($cons);
				
				$produto=$campos["NOME"];
				$descricao=$campos["DESCRICAO"];
				$valor=$campos["VALOR"];
			} 
		?>
		<FORM METHOD="POST" ACTION="salvarprod.php<?="?id=".$cod?>">
			<table >
				<tr>
					<td>Produto:</td>
					<td><INPUT TYPE="TEXT" NAME="PRODUTO" SIZE="20" MAXLENGTH="20" value="<?=$produto;?>" ></td>
				</tr>
				<tr>
					<td>Valor</td>
					<td><INPUT TYPE="TEXT" NAME="VALOR"  value="<?=$valor;?>" onkeypress="reais(this,event)" onkeydown="backspace(this,event)" ></td>
				</tr>
				<tr>
					<td COLSPAN='2'>
						Descricao<BR>
						<TEXTAREA rows=6 cols=40 NAME=DESCRICAO onkeyup="maxLength(this,10)" onkeydown="maxLength(this,10)"><?=$descricao;?></TEXTAREA>
					</td>
				</tr>
			</table>
			<p>
			

			<INPUT TYPE="RESET" NAME="botaoR" VALUE="Limpar" > 
			<INPUT TYPE="submit" NAME="botaoS" VALUE="Enviar"> <!-- onclick='return validar(this.form);' -->
		</FORM>
		<br>
		<a href='index.php'>Voltar</a>
	<HR>
	</BODY>
</HTML>