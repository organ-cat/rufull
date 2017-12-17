var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var EMAIL_PASSED = "20";             //邮箱号码通过
var countdown = 60;
//手机更换,点击下一步   * 一 *
$(function(){
    $("#confirm").click(function () {
        var phone = $("#phone").val();
        var password = $("#newPasswrod").val();
        var checkCode = $("#checkCode").val();
        if(isTelCode(phone)||IsEmail(phone)){
            $.ajax({
                url: "http://localhost:8080/rufull/nologin/forgotPassword",
                data: {"phone": phone,"password":password, "checkCode": checkCode},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == "1") {
                        $("#message").html("密码修改成功");
                        $("#message").attr("color", "#69ff4e");
                        $("#phone").val("");
                        $("#newPasswrod").val("");
                        $("#checkCode").val("");
                        $("#comfirePassword").val("");
                    }else if(result == "0"){
                        $("#message").html("密码修改失败");
                        $("#message").attr("color", "#FF0000");
                        $("#phone").val("");
                        $("#newPasswrod").val("");
                        $("#checkCode").val("");
                        $("#comfirePassword").val("");
                    }
                }
            });
        }else {
            $("#message").html("手机或者邮箱号码格式错误");
            $("#message").attr("color", "#FF0000");
            error();
        }

    });
});
//手机更换，点击获取验证码  * 二 *
$(function(){
    $("#getCode").click(function () {
        var phone = $("#phone").val();
        if(isTelCode(phone)||IsEmail(phone)) {
            settime(this);
            $.ajax({
                url: "http://localhost:8080/rufull/check/sendCode",
                data: {"phone": phone},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result == PHONE_FORMAT_ERROR){
                        $("#message").html("手机或者邮箱号码格式错误");
                        $("#message").attr("color", "#FF0000");
                        error();
                    }
                }
            });
        }else {
            $("#message").html("请输入您的手机或者邮箱");
            $("#message").attr("color", "#FF9900");
            error();
        }

    });
});
//手机更换，异步校验数据   * 三 *
$(function () {
    $("#phone").blur(function () {
        var phone = $("#phone").val();
        $.ajax({
            url: "http://localhost:8080/rufull/check/checkPhoneOrEmail",
            data: {"phone": phone},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if(result == PHONE_PASSED){
                    $("#message").html("手机通过");
                    $("#message").attr("color", "#69ff4e");
                    right()
                }else if(result == EMAIL_PASSED) {
                    alert("邮箱通过");
                    $("#message").attr("color", "#69ff4e");
                    $("#message").html("手机通过");
                    right()
                }else if(result == PHONE_FORMAT_ERROR) {
                    $("#message").html("手机或邮箱格式错误");
                    $("#message").attr("color", "#FF0000");
                    error();
                }
            }
        });
    });
});

//点击"免费获取验证码"后，按钮变成"重新发送（60）"倒计时
function settime(val) {
    if (countdown == 0) {
        val.removeAttribute("disabled");
        val.value="获取验证码";
        countdown = 60;
        return;
    } else {
        val.setAttribute("disabled", true);
        val.value="重新发送" + countdown;
        countdown--;
    }
    setTimeout(function() {
        settime(val)
    },1000)
}

$(function () {
    $("#comfirePassword").blur(function () {
        var password = $("#newPasswrod").val();
        var comfirePassword = $("#comfirePassword").val();
        if (password != comfirePassword) {
            $("#message").html("密码和确认密码不一致");
            $("#message").attr("color", "#FF9900");
            error();
        }else {
            $("#message").html("通过");
            $("#message").attr("color", "#69ff4e");
        }
    });
})
function error() {
    $("#button").attr("disabled", true);
    $("#button").css("cursor",'not-allowed');
}
function right() {
    $("#button").removeAttr("disabled");
    $("#button").css("cursor","default")
}

/*校验电话码格式 */
function isTelCode(str) {
    var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return reg.test(str);
}

/*校验邮件地址是否合法 */
function IsEmail(str) {
    var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    return reg.test(str);
}