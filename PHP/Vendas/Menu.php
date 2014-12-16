
		<style type="text/css">
			ul{
				list-style:none;
				margin:0px;
				margin-top:5px;
				padding:2px;
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
		//alert("a")
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
		<link rel="stylesheet" type="text/css" href="styleS/E1.css" />
	
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
	
