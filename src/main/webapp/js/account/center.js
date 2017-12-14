$(function () {
    $(".accountPhoto").mouseenter(function () {
        $(".editInfo").show();
    });
    $(".accountPhoto").mouseleave(function () {
        $(".editInfo").hide();
    });
});

$(function () {
    $(".infoPhoto").mouseenter(function () {
        $(".updatePhoto").show();
    });
    $(".infoPhoto").mouseleave(function () {
        $(".updatePhoto").hide();
    });
});

function imgPreview(fileDom){
    //判断是否支持FileReader
    if (window.FileReader) {
        var reader = new FileReader();
    } else {
        alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
    }

    //获取文件
    var file = fileDom.files[0];
    var imageType = /^image\//;
    //是否是图片
    if (!imageType.test(file.type)) {
        alert("请选择图片！");
        return;
    }
    //读取完成
    reader.onload = function(e) {
        //获取图片dom
        var img = document.getElementById("preview");
        //图片路径设置为读取的图片
        img.src = e.target.result;
    };
    reader.readAsDataURL(file);
}


// function updateNickname() {
//     var nickname = $("#nickname").val();
//     var id = $("#id").val();
//     $.ajax({
//         url: "http://localhost:8080/rufull/account/updateNickname",
//         data: {"id": id, "nickname": nickname},
//         async: true,
//         cache: false,
//         type: "POST",
//         dataType: "json",
//         success: function (result) {
//             alert(result)
//         }
//     });
// }

$(function () {
    $("#aNick").click(function () {
        var nickname = $("#nickname").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/updateNickname",
            data: {"nickname": nickname},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});
$(function () {
    $("#aUser").click(function () {
        var username = $("#username").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/setUsername",
            data: {"username": username},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});

$(function () {
    $("#username").blur(function () {
        var username = $("#username").val();
        alert(username);
        $.ajax({
            url: "http://localhost:8080/rufull/check/checkUsername",
            data: {"username": username},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});

