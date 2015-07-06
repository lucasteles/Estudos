$(function(){
	$('.loader').hide();
    $('.social-anchor').hover(function () {
        TweenMax.to($(this).find('.social'), 1, { rotationY: '+=360', ease: Linear.easeNone, repeat: -1 });
    }, function () {
        TweenMax.to($(this).find('.social'), 0.5, { rotationY: '0', ease: Linear.easeNone });
    });

    $('pre code').each(function (i, block) {
        hljs.highlightBlock(block);
    });




    $('#btnSend').click(function(){

    	 var ddata = new FormData();
    	 ddata.append( 'txtJson', $('#txtJson').val());

    	$.ajax({
		  type: "POST",
		  processData: false,
  		  contentType: false,
		  url: "../Home/GetParse",
		  data: ddata,  
		  crossDomain: true,
		  success: function(data){
		      $("#theCode").text(data.parse);
		      ZeroClipboard.setData("text/plain", $("#theCode").text());
		  	   $('pre code').each(function (i, block) {
			        hljs.highlightBlock(block);
			    });
		  },
		  error: function(data){
		  	//ee = (data);
		  },
		  beforeSend: function(){
		      $('.loader').fadeIn();
		      $('#btnSend').attr('disabled', 'disabled');
		   },
		   complete: function(){
		       $('.loader').fadeOut();
		       $('#btnSend').removeAttr('disabled');

		   }
		  
		});    	

    });

    ZeroClipboard.setData("text/plain", $("#theCode").text());
    var client = new ZeroClipboard(document.getElementById("copy-button"));
       client.on("ready", function (readyEvent) {
        client.on("aftercopy", function (event) {
            event.target.style.display = "none";
            $("#copy-button").show();
            alert("Copied!");
        });
    });
});