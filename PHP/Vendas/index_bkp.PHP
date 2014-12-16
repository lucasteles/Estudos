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
		<style type="text/css">
			ul{
				list-style:none;
				margin:0px;
				margin-top:-110px;
				padding:0px;
			}

			li{
				display:inline;
				font-size:1.1em;
				letter-spacing:-1px;
				font-weight:normal;
				color:#FFF;
				text-align:center;
				float:left;
			}
			li a{
				display:block;
				color:#FFF;
				background-color:#0000CD;
				text-decoration:none;
				padding-bottom:10px;
				padding-left:10px;
				padding-right:10px;
				padding-top:10px;
			}
		</style>
		
		<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
		<script type="text/javascript">
		$('document').ready(function(){
			//--- Menu
			$('ul a').each(function(key){
				if(key == 0)
					$(this).stop().animate({backgroundColor:"#00008B"}, {duration:1000});
			});
			
			//--- menu
			$('ul a').hover(
				function(){
					$('ul a').each(function(key){
						$(this).stop().animate({backgroundColor:"##0000CD"}, {duration:1500})
					});
					
					$(this).stop().animate({backgroundColor:"#00008B"}, {duration:1000});
				},
				function(){            
					$('ul a').each(function(key){
						if(key == 0)
							$(this).stop().animate({backgroundColor:"#00008B"}, {duration:800});
						else
						{
							$(this).stop().animate({backgroundColor:"##0000CD"}, {duration:1500})
						}
					});
				}
			);
		});
		</script>
	</HEAD>
	<BODY onLoad="scroll();return true;">

	<H1>VENDAS</H1>
	
	<div id="Menu">
    <ul>
		<li><a href="Index.php"> Inicio </a> </li>
		<li><a href="Clientes.php"> Cadastro de clientes </a> </li>
		<li><a href="Produtos.php"> Cadastro de Produtos </a> </li>
		<li><a href="ConsCli.php"> Consulta de clientes </a> </li>
		<li><a href="ConsProd.php"> Consulta de Produtos </a> </li>
		<li><a href="SalvarPed.php"> Iniciar Pedido </a> </li>
	</ul>
	
	</div>
			<HR>
	</BODY>
</HTML>