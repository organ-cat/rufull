var flag = false;
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
$(function () {
    $("#aNick").click(function () {
        var nickname = $("#nickname").val();
        if(nickname!=""){
            $.ajax({
                url: "http://172.16.13.94:8080/rufull/account/updateNickname",
                data: {"nickname": nickname},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    $("#nicknameMessage").html("修改成功");
                    $("#nicknameMessage").style("color", "#008000");
                }
            });
        }else{
            $("#nicknameMessage").html("不能是空");
            $("#nicknameMessage").attr("color", "#FF0000");
        }


    });
});
$(function () {
    $("#aUser").click(function () {
        var username = $("#username").val();
        if(flag && isUsername(username)){
            $.ajax({
                url: "http://172.16.13.94:8080/rufull/account/setUsername",
                data: {"username": username},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    $("#usernameMessage").html("设置成功");
                    setTimeout(function(){
                        $(location).attr('href', 'http://172.16.13.94:8080/rufull/account/infomation');
                        },3000);

                }
            });
        }else {
            $("#usernameMessage").html("格式错误");
            flag = false;
        }

    });
});

$(function () {
    $("#username").change(function () {
        var username = $("#username").val();
        if(isUsername(username)){
            $.ajax({
                url: "http://172.16.13.94:8080/rufull/check/checkUsername",
                data: {"username": username},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result =="1"){
                        $("#usernameMessage").html("通过");
                        flag = true;
                    }else {
                        $("#usernameMessage").html("存在");
                        flag = false;
                    }
                }
            });
        }else {
            $("#usernameMessage").html("格式错误");
            flag = false;
        }

    });
});
function isUsername(username) {
    var reg = /^[a-zA-Z]{1}([a-zA-Z0-9]|[_]){2,19}$/;
    return reg.test(username);
}
