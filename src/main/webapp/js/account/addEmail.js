var host = window.location.host;
var EMAIL_PASSED = "20";             //邮箱号码通过
var EMAIL_REGISTERED = "21";         //邮箱号码被注册了
var EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误
var countdown = 60;
$(function(){
    $("#addEmail").click(function () {
        var email = $("#email").val();
        var checkCode = $("#checkCode").val();
        if(IsEmail(email)){
            $.ajax({
                url: "/rufull/account/addEmail",
                data: {"email": email, "checkCode": checkCode},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == EMAIL_PASSED) {
                        bindSuccess();
                    }else if(result == EMAIL_REGISTERED){
                        emailRegisted()
                    } else if (result == EMAIL_CHECK_CODE_ERROR) {
                        checkCodeError();
                    }
                }
            });
        }else{
            emailError();
        }


    });
});
//邮箱更换，点击获取验证码  * 二 *
$(function(){
    $("#obtainCode").click(function () {
        var email = $("#email").val();
        if(IsEmail(email)){
            settime(this);
            $.ajax({
                url: "/rufull/check/sendbindEmail",
                data: {"email": email},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {

                }
            });
        }else {
            emailError();
        }

    });
});
//邮箱更换，异步校验数据   * 三 *
$(function () {
    $("#email").change(function () {
        var email = $("#email").val();
        if(IsEmail(email)){
            $.ajax({
                url: "/rufull/check/checkEmail",
                data: {"email": email},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result == EMAIL_PASSED){
                        emailPassed();
                    }else if(result == EMAIL_REGISTERED) {
                        emailRegisted();
                    }else if(result == EMAIL_FORMAT_ERROR) {
                        emailError();
                    }
                }
            });
        }else {
            emailError();
        }

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

function checkCodeError() {
    $("#returnMessage").html("验证码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
function emailRegisted() {
    $("#returnMessage").html("邮箱被注册了");
    $("#email").attr("style", "border: 1px solid #FF0000");
}
function emailPassed() {
    $("#returnMessage").html("邮箱通过");
    $("#email").attr("style", "border: 1px solid #7B9CD3");
}
function bindSuccess() {
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#checkCode").val("");
    $("#returnMessage").html("绑定成功");
    countdown = 0;
    setTimeout(function () {
        $(location).attr('href', 'http://' + host + '/rufull/account/security');
    },3000)
}
function emailError() {
    $("#returnMessage").html("邮箱号码格式错误");
    $("#email").attr("style", "border: 1px solid #FF0000");
}
/*校验邮件地址是否合法 */
function IsEmail(str) {
    var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    return reg.test(str);
}