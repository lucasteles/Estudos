$('img').attr("indo","0").attr("volta","0").each(function(){$(this).attr('myWidth',$(this).width());}).fadeTo(5000,0.3);

$('img').hover(
function(){
	if ($(this).attr('indo')=='0'){
		$(this).attr('indo','1'); 
		$(this).animate({width: parseFloat($(this).attr('myWidth'))*2 , opacity:1},1000,function(){$(this).attr('indo','0');}).css('height:auto;'); 
	} 
}
,
function(){
	if ($(this).attr('volta')=='0'){
		$(this).attr('volta','1');
		$(this).animate({width:parseFloat($(this).attr('myWidth')), opacity:0.3},1000,function(){$(this).attr('volta','0');}).css('height:auto;')
	} 
})


$('img').each(function(){$(this).attr('myWidth',$(this).width());}).fadeTo(5000,0.3).hover(
function(){
	$(this).filter(':animated').stop();
	$(this).animate({width: parseFloat($(this).attr('myWidth'))*2 , opacity:1},1000).css('height:auto;'); 
	} 
,
function(){
	$(this).filter(':animated').stop();
	$(this).animate({width:parseFloat($(this).attr('myWidth')), opacity:0.3},1000).css('height:auto;'); 
})

$('#para :eq(0)').before('<a href=# class="esconde">[clique para esconder]</a>');
$('.esconde').click(
	function(e){
		e.preventDefault(); 
		if( $(this).text()=='[clique para esconder]') 
			{ $(this).text('[clique para mostrar]');
			$(this).parent().find('p').slideUp('slow') 
		} 
		else { 
			$(this).text('[clique para esconder]');
			$(this).parent().find('p').slideDown('slow') } 
	})