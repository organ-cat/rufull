var EMAIL_PASSED = "20";             //邮箱号码通过
var EMAIL_REGISTERED = "21";         //邮箱号码被注册了
var EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误
var EMAIL_CHECK_CODE_RIGHT = "500";
var EMAIL_CHECK_CODE_ERROR = "501";
var NEW_EMAIL_CHECK_CODE_RIGHT = "502";
var NEW_EMAIL_CHECK_CODE_ERROR = "503";
var EMAIL_ERROR = "505";
var flag = true;
var countdown = 60;
//邮箱更换,点击下一步
$(function(){
    $("#next").click(function () {
        var email = $("#email").val();
        var checkCode = $("#checkCode").val();
        if(IsEmail(email)){
            $.ajax({
                url: "http://localhost:8080/rufull/account/bindEmail",
                data: {"email": email, "checkCode": checkCode},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == EMAIL_CHECK_CODE_RIGHT) {
                        bindEmail();
                    }else if(result == EMAIL_ERROR){
                        emailError();
                    } else if (result == EMAIL_CHECK_CODE_ERROR) {
                        checkCodeError();
                    }else if (result == NEW_EMAIL_CHECK_CODE_RIGHT) {
                        bindSuccess();
                    }else if (result == NEW_EMAIL_CHECK_CODE_ERROR) {

                    }
                }
            });
        }else{
            emailError();
        }


    });
});
//邮箱更换，点击获取验证码
$(function(){
    $("#getCode").click(function () {
        var email = $("#email").val();
        if(flag){
            if(IsEmail(email)){
                emailPassed();
                settime(this);
                $.ajax({
                    url: "http://localhost:8080/rufull/check/sendbindEmail",
                    data: {"email": email},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {
                        emailPassed();
                    }
                });
            }else {
                emailError();
            }

        }else{
            if(IsEmail(email)){
                emailPassed();
                settime(this);
                $.ajax({
                    url: "http://localhost:8080/rufull/check/sendbindNewEmail",
                    data: {"email": email},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {
                    }
                });
            }else{
                emailError();
            }
        }
    });
});
//邮箱更换，异步校验数据
$(function () {
    $("#email").change(function () {
        if(!flag){
            var email = $("#email").val();
            $.ajax({
                url: "http://localhost:8080/rufull/check/checkEmail",
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

function error() {
    $("#next").attr("disabled", true);
    $("#next").css("cursor",'not-allowed');
    $("#getCode").attr("disabled", true);
    $("#getCode").css("cursor",'not-allowed');
}
function right() {
    $("#next").removeAttr("disabled");
    $("#next").css("cursor", "default");
    $("#getCode").removeAttr("disabled");
    $("#getCode").css("cursor", "default");
}
function bindEmail() {
    flag = false;
    $("#show2").attr("style", "background-color: #0089DC");
    $("#show2").css("color","#FFFFFF");
    $("#showSpan2").attr("style", "color: #0089DC");
    $("#currentEmail").val("新的邮箱号");
    $("#email").val("");
    $("#checkCode").val("");
    right();
    countdown = 0;
}
function emailError() {
    $("#returnMessage").html("当前邮箱号码错误");
    $("#email ").attr("style", "border: 1px solid #FF0000");
}
function emailRegisted() {
    $("#returnMessage").html("邮箱被注册了");
    $("#email").attr("style", "border: 1px solid #FF0000");
    error();
}
function emailPassed() {
    $("#returnMessage").html("邮箱通过");
    $("#email").attr("style", "border: 1px solid #7B9CD3");
    $("#next").removeAttr("disabled");
    $("#next").css("cursor","default");
    right();
}
function bindSuccess() {
    flag = true;
    $("#show3").attr("style", "background-color: #0089DC");
    $("#show3").css("color","#FFFFFF");
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#returnMessage").html("绑定成功");
    $("#checkCode").val("");
    countdown = 0;
}
function checkCodeError() {
    $("#returnMessage").html("验证码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
/*校验邮件地址是否合法 */
function IsEmail(str) {
    var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
    return reg.test(str);
}