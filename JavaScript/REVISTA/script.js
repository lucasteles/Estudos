$(document).ready( function(){ //espera o DOM (elementos da pagina) carregar

	// animação da imagem da esquerda (foto)
	var currentLeft = $('#foto').position().left;
	$('#foto').css( { left:-350, opacity:0 } ).animate({left:currentLeft, opacity:1},1500);

	$('#foto').click(function(){
		$('#main').css('overflow','visible');
		$('#capa').addClass('pagina');
	});

	// esconde subtitulo
	$('#sub').hide();

	
	// exibe com delay titulo
	$('#botao, .titulo').hide().fadeIn(1500,
			function(){
					$('#botao').attr(
							{
							myWidth: $('#botao').width(), 
							myLeft:$('#botao').position().left, 
							myTop:$('#botao').position().top
							}
						);
					$('#sub').slideDown("normal");
				}
		);

	// anima barra lateral de produtos
	$('#side').css('right','-200px').animate({right:0},1500);


	
	// faz efeito do bloco de texto e cabeçario "veja"
	$('#veja span').hide();
	var currentWidth = $('#veja h2').width();
	var currentHeight = $('#veja span').height();

	$('#veja h2').css({ width:'0px' }).animate({width: currentWidth}, 1500,
			function(){
				$(this).next().css({ height:'0px',display:'block' }).animate({height:currentHeight},500);

			}
	);


	//inclui no documento fundo negro para efeito do video
	//trata para background preto
	$('<div id="mascara"></div>')
		.css({
			opacity : 0.8,
			width : $(document).width(),
			height : $(document).height(),
			cursor: 'pointer'
		})
		.appendTo('body')
		.click(function(){
				$('.video').fadeOut(1000);
				$('#mascara').fadeOut(1500);
				$('.video').get(0).pause();
				
			}).hide();
		
	
	$(window).resize(function()
	{
		$('#mascara').css({
			width : $(document).width(),
			height : $(document).height()
		});
		
	
	});


	//define funções do botao "+"
	$('#botao').hover(
			function(){
				$(this).stop().animate({width: parseInt($(this).attr('myWidth')) +40, 
										left:parseInt($(this).attr('myLeft'))-20,
										top:parseInt($(this).attr('myTop'))-20  
									},500);
			},
			function(){
				$(this).stop().animate({width: parseInt($(this).attr('myWidth')), 
										left: parseInt($(this).attr('myLeft')),
										top: parseInt($(this).attr('myTop'))  },500);
			}
	).click(function(e){
			e.preventDefault(); //ignora padarao do navegador no click
			$('#mascara').fadeIn(1000);
			$('.video').remove();

			$('<video type="video/mp4" class="video" controls />')
				.attr('src', 'video1.mp4')
				.css({
						left: ($(document).width()/2 - 400 ),
						top: ($(document).height()/2 - 200)
					}).appendTo('body');	

			$('.video').get(0).play();

		})


});