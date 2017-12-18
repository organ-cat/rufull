var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var EMAIL_PASSED = "20";             //邮箱号码通过
var EMAIL_REGISTERED = "21";         //邮箱号码被注册了
var EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误
var countdown = 60;
//手机更换,点击下一步   * 一 *
$(function(){
    $("#addPhone").click(function () {
        var phone = $("#phone").val();
        var checkCode = $("#checkCode").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/addPhone",
            data: {"phone": phone, "checkCode": checkCode},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result == PHONE_PASSED) {
                    bindSuccess();
                }else if(result == PHONE_REGISTERED){
                    alert("手机被注册了");
                } else if (result == PHONE_CHECK_CODE_ERROR) {
                    checkCodeError();
                }
            }
        });
    });
});
//手机更换，点击获取验证码  * 二 *
$(function(){
    $("#getCode").click(function () {
        var phone = $("#phone").val();
        settime(this);
        $.ajax({
            url: "http://localhost:8080/rufull/check/sendbindPhone",
            data: {"phone": phone},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {}
        });
    });
});
//手机更换，异步校验数据   * 三 *
$(function () {
    $("#phone").change(function () {
        var phone = $("#phone").val();
        $.ajax({
            url: "http://localhost:8080/rufull/check/checkPhone",
            data: {"phone": phone},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if(result == PHONE_PASSED){
                    alert("手机通过");
                }else if(result == PHONE_REGISTERED) {
                    alert("手机被注册了");
                }else if(result == PHONE_FORMAT_ERROR) {
                    alert("手机格式错误");
                }
            }
        });
    });
});

///////////////////////////////////////////////////////////////////
$(function(){
    $("#addEmail").click(function () {
        var email = $("#email").val();
        var checkCode = $("#checkCode").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/addEmail",
            data: {"email": email, "checkCode": checkCode},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result);
                if (result == EMAIL_PASSED) {
                    bindSuccess();
                }else if(result == EMAIL_REGISTERED){
                    alert("手机被注册了");
                } else if (result == EMAIL_CHECK_CODE_ERROR) {
                    checkCodeError();
                }
            }
        });
    });
});
//邮箱更换，点击获取验证码  * 二 *
$(function(){
    $("#obtainCode").click(function () {
        var email = $("#email").val();
        alert(email);
        settime(this);
        $.ajax({
            url: "http://localhost:8080/rufull/check/sendbindEmail",
            data: {"email": email},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {

            }
        });
    });
});
//邮箱更换，异步校验数据   * 三 *
$(function () {
    $("#email").change(function () {
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
                    alert("邮箱通过");
                }else if(result == EMAIL_REGISTERED) {
                    alert("邮箱被注册了");
                }else if(result == EMAIL_FORMAT_ERROR) {
                    alert("邮箱格式错误");
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

function checkCodeError() {
    $("#returnMessage").html("验证码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
function phoneError() {
    $("#returnMessage").html("手机号码格式错误");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}

function bindSuccess() {
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#returnMessage").html("绑定成功");
    countdown = 0;
}
function emailError() {
    $("#returnMessage").html("邮箱号码格式错误");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}
