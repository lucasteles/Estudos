<HTML>
	<HEAD>
		<TITLE>TESTE PHP</TITLE>
		 <? include("menu.php") ?>
		<script language="Javascript" type="text/javascript" src="JS/Funcs.js"></script>
		<script>
			function validar(form) {
				var txt=form.EMAIL.value;
				if (txt == "" || txt.indexOf('@', 0) == -1 || txt.indexOf('.',0)== -1 ) {
						alert("Não é um e-mail válido!");
						return false;
				}else{
					if (form.NOME.value=='' ) {
						alert("Escreva um nome!");	
						return false;
					}else{
						return true;
					}
				}
			}
			
			
			function Tratar(form){
				var txt=form.NOME.value;
				var txt2=form.EMAIL.value;
				
				txt=txt.replace('<','&lt;');
				txt2=txt2.replace('<','&lt;');
				
				
				txt=txt.replace('>','&gt;');	
				txt2=txt2.replace('>','&gt;');
				
				txt=txt.replace("'","");
				txt2=txt2.replace("'","");
						
				txt=txt.replace('"','&quot;');
				txt2=txt2.replace('"','&quot;');	
			
				form.NOME.value=txt;
				form.EMAIL.value=txt2;
			}
		</script>
		<link rel="stylesheet" type="text/css" href="styleS/E1.css" />
	</HEAD>
	<BODY>
	
	<H1>CLIENTES</H1>
		<?
			$cod=$_GET["id"];
		
			IF ($cod <> '' ){
				require("SYS.php");
				$alca=Conecta();
				$cons=Executa("Select * from clientes where codigo=".$cod ,$alca);
				$campos=mysql_fetch_array($cons);
				
				$nome=$campos["NOME"];
				$email=$campos["EMAIL"];
			} 
		?>
		<FORM METHOD="POST" ACTION="salvarcli.php<?="?id=".$cod?>"> <!-- onsubmit='Tratar(this)' -->
			<table>
				<tr>
					<td>Nome:</td>
					<td><INPUT TYPE="TEXT" NAME="NOME" SIZE="20" MAXLENGTH="20" value="<?=$nome;?>" ></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><INPUT TYPE="TEXT" NAME="EMAIL" SIZE="50" MAXLENGTH="100" value="<?=$email;?>" onblur="lower(this)"></td>
				</tr>
			</table>
			<p>
			

			<INPUT TYPE="RESET" NAME="botaoR" VALUE="Limpar" > 
			<INPUT TYPE="submit" NAME="botaoS" VALUE="Enviar" onclick='return validar(this.form);'> <!---->
		</FORM>
		<br>
		<a href='index.php'>Voltar</a>
	<HR>
	</BODY>
</HTML>