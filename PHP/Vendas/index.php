<HTML>
	<HEAD>
		<TITLE>TESTE PHP</TITLE>
			<script>	
				var scrtxt="Alguns testes de desenvolvimento WEB by Lucas Teles; "+
				"muito loko escrever coisas nessa barrinha XD...";
				var lentxt=scrtxt.length;
				var width=150;
				var pos=1-width;
				var INI = 0
				 
				function scroll() {
					pos++;
					var scroller="";
					if (pos==lentxt) {
						pos=1-width;
					}
					if (pos<0) {
						for (var i=1; i<=Math.abs(pos); i++) {
							scroller=scroller+" ";
						}
							scroller=scroller+scrtxt.substring(0,width-i);
					}
					else {
							scroller=scroller+scrtxt.substring(pos,width+pos);
						}
							window.status = scroller;
							setTimeout("scroll()",150);
					
				}
		</script>
		<link rel="stylesheet" type="text/css" href="styleS/E1.css" />	
		 <? include("menu.php") ?>

	</HEAD>
	<BODY onLoad="scroll();return true;">
	<H1>VENDAS</H1>
		<a href="Clientes.php"> Cadastro de clientes </a><br>
		<a href="Produtos.php"> Cadastro de Produtos </a><br><br>
		<a href="ConsCli.php"> Consulta de clientes </a> <br>
		<a href="ConsProd.php"> Consulta de Produtos </a><br><br>
		<a href="SalvarPed.php"> Iniciar Pedido </a> 
		
		<p>
		
	<HR>
	</BODY>
</HTML>