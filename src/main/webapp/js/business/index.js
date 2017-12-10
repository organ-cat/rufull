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

    function initFileInput(ctrlName, uploadUrl) {
        var control = $('#' + ctrlName);

        control.fileinput({
            language: 'zh', //设置语言
            uploadUrl: uploadUrl, //上传的地址
            allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
            showUpload: true, //是否显示上传按钮
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        });
    }

    initFileInput("file-Portrait", "/User/EditPortrait");

	
});
