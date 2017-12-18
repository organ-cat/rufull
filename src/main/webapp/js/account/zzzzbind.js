var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var EMAIL_PASSED = "20";             //邮箱号码通过
var EMAIL_REGISTERED = "21";         //邮箱号码被注册了
var EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误
var PHONE_CHECK_CODE_RIGHT = "400";
var PHONE_CHECK_CODE_ERROR = "401";
var NEW_PHONE_CHECK_CODE_RIGHT = "402";
var NEW_PHONE_CHECK_CODE_ERROR = "403";
var PHONE_ERROR = "405";
var EMAIL_CHECK_CODE_RIGHT = "500";
var EMAIL_CHECK_CODE_ERROR = "501";
var NEW_EMAIL_CHECK_CODE_RIGHT = "502";
var NEW_EMAIL_CHECK_CODE_ERROR = "503";
var EMAIL_ERROR = "505";
var flag = true;
var emailFlag = true;
var countdown = 60;
//手机更换,点击下一步
$(function(){
    $("#button").click(function () {
        var phone = $("#phone").val();
        var checkCode = $("#checkCode").val();
        if(isTelCode(phone)){
            $.ajax({
                url: "http://localhost:8080/rufull/account/bindPhone",
                data: {"phone": phone, "checkCode": checkCode},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == PHONE_CHECK_CODE_RIGHT) {
                        bindphone();
                    }else if(result == PHONE_ERROR){
                        phoneError();
                    } else if (result == PHONE_CHECK_CODE_ERROR) {
                        checkCodeError();
                    }else if (result == NEW_PHONE_CHECK_CODE_RIGHT) {
                        bindSuccess();
                    }else if (result == NEW_PHONE_CHECK_CODE_ERROR) {

                    }
                }
            });
        }else {
            alert("手机号码格式错误");
        }

    });
});
//手机更换，点击获取验证码
$(function(){
    $("#inputCode").click(function () {
        var phone = $("#phone").val();
        if(flag){
            if(isTelCode(phone)){
                settime(this);
                $.ajax({
                    url: "http://localhost:8080/rufull/check/sendbindPhone",
                    data: {"phone": phone},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {
                    }
                });
            }else {
                alert("手机号码格式错误");
            }
        }else{
            if(isTelCode(phone)){
                settime(this);
                $.ajax({
                    url: "http://localhost:8080/rufull/check/sendbindNewPhone",
                    data: {"phone": phone},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {

                    }
                });
            }else {
                alert("手机号码格式错误");
            }

        }
    });
});
//手机更换，异步校验数据
$(function () {
    $("#phone").change(function () {
        if(!flag){
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
        }
    });
});
////////手机
function bindphone() {
    flag = false;
    $("#show2").attr("style", "background-color: #0089DC");
    $("#show2").css("color","#FFFFFF");
    $("#showSpan2").attr("style", "color: #0089DC");
    $("#inputPhone").val("新的手机号");
    countdown = 0;
}
function checkCodeError() {
    $("#returnMessage").html("验证码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
function phoneError() {
    $("#returnMessage").html("当前手机号码错误");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}

function bindSuccess() {
    flag = true;
    $("#show3").attr("style", "background-color: #0089DC");
    $("#show3").css("color","#FFFFFF");
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#returnMessage").html("绑定成功");
}
////////邮箱
function bindEmail() {
    emailFlag = false;
    $("#show2").attr("style", "background-color: #0089DC");
    $("#show2").css("color","#FFFFFF");
    $("#showSpan2").attr("style", "color: #0089DC");
    $("#currentEmail").val("新的邮箱号");
    countdown = 0;
}
function checkCodeError() {
    $("#returnMessage").html("验证码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
function emailError() {
    $("#returnMessage").html("当前邮箱号码错误");
    $("#checkCode").attr("style", "border: 1px solid #FF0000");
}
function bindSuccess() {
    emailFlag = true;
    $("#show3").attr("style", "background-color: #0089DC");
    $("#show3").css("color","#FFFFFF");
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#returnMessage").html("绑定成功");
}
//邮箱更换,点击下一步
$(function(){
    $("#next").click(function () {
        var email = $("#email").val();
        var checkCode = $("#checkCode").val();
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
    });
});
//邮箱更换，点击获取验证码
$(function(){
    $("#getCode").click(function () {
        var email = $("#email").val();
        if(emailFlag){
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
        }else{
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
        }
    });
});
//邮箱更换，异步校验数据
$(function () {
    $("#email").change(function () {
        if(!emailFlag){
            var email = $("#email").val();
            $.ajax({
                url: "http://localhost:8080/rufull/check/checkmail",
                data: {"email": email},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result == EMAIL_PASSED){
                        alert("邮箱号码通过");
                    }else if(result == EMAIL_REGISTERED) {
                        alert("邮箱号码被注册了");
                    }else if(result == EMAIL_FORMAT_ERROR) {
                        alert("邮箱号码格式错误");
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

function error() {
    $("#confirm").attr("disabled", true);
    $("#confirm").css("cursor",'not-allowed');
}
function right() {
    $("#confirm").removeAttr("disabled");
    $("#confirm").css("cursor","default")
}