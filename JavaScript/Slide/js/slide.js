// 
$(function()
{
	var liWidth = $("#galeria ul li").outerWidth(),
					speed = 3000,
					timer = setInterval(auto, speed);
	
	// mostara botoes
	$("section#galeria").hover(
		function(){		
			clearInterval(timer);
			$("section#buttons").stop().fadeIn();
		},
		function(){
			$(this).filter(':animated').stop();
			
			timer = setInterval(auto, speed);
			$("section#buttons").stop().fadeOut();
		});
	
	
	//proximo
	$(".next").click(function(e){
		e.preventDefault();
		
		if($("#galeria ul").is(':animated'))
			return false;
		
		$("#galeria ul")
		.css("width","999%")
		.animate({left:-liWidth}, function(){		
			$("#galeria ul li").last().after( $("#galeria ul li").first() );
			$(this).css({left:0, width:"auto"});
		});
	});
	
	//voltar
	$(".prev").click(function(e){
		e.preventDefault();
		
		if($("#galeria ul").is(':animated'))
			return false;
		
		$("#galeria ul li").first().before( $("#galeria ul li").last().css('margin-left', -liWidth) );
		$("#galeria ul").css("width","999%").animate({left:liWidth}
		,function(){
			$("#galeria ul li").first().css('margin-left', 0);
			$(this).css({left:0, width:"auto"});
		});
	});
	
	function auto(){
		$('.next').click();
	}
	



	
	
	//teste de galeria slideshow 
	
	$('img.thumbnail').fadeTo(2000,0.5);
	
	$('img.thumbnail').hover(
					function(){
						$(this).stop().fadeTo("normal",1);
					},
					function(){
						$(this).stop().fadeTo("normal",0.5);
					});
	

	//trata para background preto
	$('<div id="mascara"></div>')
		.css({
			opacity : 0.8,
			width : $(document).width(),
			height : $(document).height()
		}).appendTo('body').hide();
	
	$(window).resize(function()
	{
		$('#mascara').css({
			width : $(document).width(),
			height : $(document).height()
		});
		$('.foto-ampliada').css({
						left: ($(document).width()/2 - 250),
						top: ($(document).height()/2 - 186)});
						
		$("#ant").css("left",($(document).width()/2 - 245));
		$("#prox").css("left",($(document).width()/2 + 200) );
		$('.botao').css("top", $(document).height()/2 - 25);
	})
	
	
	//poe e posiciona botoes
	$("<a href='#'class='botao' id='ant'>&laquo;</a>"+
		"<a href='#'class='botao' id='prox'>&raquo;</a>")
	.css({
		top: ($(document).height()/2 - 25)
	})
	.hover(
		function(){ $(this).stop().fadeTo("normal",1); },
		function(){ $(this).stop().fadeTo("normal",0.5);}
		)
	.click(function(e){
		e.preventDefault();
		
		if($(this).attr("id") == 'prox')
			$('.thumbnail[zoom=1]').next().click();
		else
			$('.thumbnail[zoom=1]').prev().click();
	})
	.appendTo('body').hide();
	
	$("#ant").css("left",($(document).width()/2 - 245));
	$("#prox").css("left",($(document).width()/2 + 200) );
	
	
	
	//trata click das fotos
		$('.foto').click(function(e) {
			e.preventDefault();
			
			$('.thumbnail[zoom=1]').attr("zoom","");
			$(this).attr('zoom','1');
						
			$('#mascara').fadeIn(1000);
			$('.botao').fadeIn(1000);
			$('.foto-ampliada').remove();
			
			$('<img class="foto-ampliada" />')
				.attr('src', $(this).attr('src'))
				.css({
						left: ($(document).width()/2 - 250),
						top: ($(document).height()/2 - 186)
					}).appendTo('body').add($('#mascara')).click(function(){
												$('.foto-ampliada').fadeOut(1000);
												$('#mascara').fadeOut(1500);
												$('.botao').fadeOut(10);
												
											});							
		});	

	
	
});
