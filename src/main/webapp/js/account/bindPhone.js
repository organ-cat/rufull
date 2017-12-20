var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var PHONE_CHECK_CODE_RIGHT = "400";
var PHONE_CHECK_CODE_ERROR = "401";
var NEW_PHONE_CHECK_CODE_RIGHT = "402";
var NEW_PHONE_CHECK_CODE_ERROR = "403";
var PHONE_ERROR = "405";
var EMAIL_CHECK_CODE_ERROR = "501";
var flag = true;
var countdown = 60;
//手机更换,点击下一步
$(function(){
    $("#button").click(function () {
        var phone = $("#phone").val();
        var checkCode = $("#checkCode").val();
        if(isTelCode(phone)){
            $.ajax({
                url: "http://172.16.13.94:8080/rufull/account/bindPhone",
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
            phoneError();
        }

    });
});
//手机更换，点击获取验证码
$(function(){
    $("#inputCode").click(function () {
        var phone = $("#phone").val();
        if(flag){
            if(isTelCode(phone)){
                phonePassed();
                settime(this);
                $.ajax({
                    url: "http://172.16.13.94:8080/rufull/check/sendbindPhone",
                    data: {"phone": phone},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {
                    }
                });
            }else {
                phoneError();
            }
        }else{
            if(isTelCode(phone)){
                phonePassed();
                settime(this);
                $.ajax({
                    url: "http://172.16.13.94:8080/rufull/check/sendbindNewPhone",
                    data: {"phone": phone},
                    async: true,
                    cache: false,
                    type: "POST",
                    dataType: "json",
                    success: function (result) {

                    }
                });
            }else {
                phoneError();
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
                url: "http://172.16.13.94:8080/rufull/check/checkPhone",
                data: {"phone": phone},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result == PHONE_PASSED){
                        phonePassed();
                    }else if(result == PHONE_REGISTERED) {
                        phoneRegister();
                    }else if(result == PHONE_FORMAT_ERROR) {
                        phoneError();
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
    $("#button").attr("disabled", true);
    $("#inputCode").attr("disabled", true);
    $("#button").css("cursor",'not-allowed');
    $("#inputCode").css("cursor",'not-allowed');
}
function right() {
    $("#button").removeAttr("disabled");
    $("#inputCode").removeAttr("disabled");
    $("#button").css("cursor","default")
    $("#inputCode").css("cursor","default")
}
function bindphone() {
    flag = false;
    $("#show2").attr("style", "background-color: #0089DC");
    $("#show2").css("color","#FFFFFF");
    $("#showSpan2").attr("style", "color: #0089DC");
    $("#inputPhone").val("新的手机号");
    $("#phone").val("");
    $("#checkCode").val("");
    right();
    countdown = 0;
}
function phoneError() {
    $("#returnMessage").html("当前手机号码错误");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}
function phoneRegister() {
    $("#returnMessage").html("手机被注册了");
    $("#phone").attr("style", "border: 1px solid #FF0000");
    error();
}

function phonePassed() {
    $("#returnMessage").html("手机通过");
    $("#phone").attr("style", "border: 1px solid #7B9CD3");
    $("#button").removeAttr("disabled");
    $("#button").css("cursor","default");
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

/*校验电话码格式 */
function isTelCode(str) {
    var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return reg.test(str);
}