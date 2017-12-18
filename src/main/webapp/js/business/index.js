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

    // $("#submitBussiness").click(function () {
    //     alert("提交");
    //     $("#businessForm").submit();
    // });


});

//添加收藏商家
$("#rst_fav").click(function(){
    var url = "/rufull/favor/addFavorShop?shopId="+shopId+"&accountId="+accountId;
    console.log(url);
    var sendData = null;
    $.get(url,sendData,function(backData,textStaut,ajax){
        alert(ajax.responseText);
    });
});




