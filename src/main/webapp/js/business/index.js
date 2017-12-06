$(function(){
	$("#myCarousel").carousel({
		interval:2000
	});



	$("body").css("width",  window.innerWidth);

	    $(window).resize(function () {
	        $("body").css("width",  window.innerWidth);
	    });


	$("body").css("height",  window.innerHeight);

    $(window).resize(function () {
        $("body").css("height",  window.innerHeight);
    });

	
});
