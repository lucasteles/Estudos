$(function(){
	pages = $('body').data('pages');
	showdock= null;
		
	$('#magazine').turn({
							display: 'double',
							acceleration: true,
							gradients: !$.isTouch,
							elevation:100,
							duration:800,
							when: {
								turned: function(e, page) {
									/*console.log('Current view: ', $(this).turn('view'));*/
								}
							}
						});


	$('.button-prev').click(function(e){
		e.preventDefault();
		$('#magazine').turn('previous');
	});

	$('.button-next').click(function(e){
		$('#magazine').turn('next');
		e.preventDefault();

	});

	$( "#magazine" ).click(function(){
		console.log(currentMousePos);
		if ( $(this).prop('zoom')===undefined || $(this).prop('zoom')==0)
		{
			zoom.to({
				 //element: $(this).parent().find('img')[0]
				 	x: currentMousePos.x,
				    y: currentMousePos.y,
				    scale: 3,
				    width: 300,
    				height: 300
			});
			clearTimeout(showdock);
			$(this).prop('zoom',1);
			$('.dock').hide();
		}
		else
		{			
				zoom.out();
				$(this).prop('zoom',0);
				showdock = setTimeout(function(){ $('.dock').fadeIn(); }, 1000);
				
		}

		

	});


	$(window).bind('keydown', function(e){
		
		if (e.keyCode==37)
			$('#magazine').turn('previous');
		else if (e.keyCode==39)
			$('#magazine').turn('next');
			
	});
	


	$('.thumb, .thumbfull').click(function(){
		$('#magazine').turn('page', $(this).data('page'));
	})


	var currentMousePos = { x: -1, y: -1 };
    $(document).mousemove(function(event) {
        currentMousePos.x = event.pageX;
        currentMousePos.y = event.pageY;

    });
});
