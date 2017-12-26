var host = window.location.host;
var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var countdown = 60;
//手机更换,点击下一步   * 一 *
$(function(){
    $("#addPhone").click(function () {
        var phone = $("#phone").val();
        var checkCode = $("#checkCode").val();
        if(isTelCode(phone)){
            $.ajax({
                url: "/rufull/account/addPhone",
                data: {"phone": phone, "checkCode": checkCode},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == PHONE_PASSED) {
                        bindSuccess();
                    }else if(result == PHONE_REGISTERED){
                        phoneRegisted()
                    } else if (result == PHONE_CHECK_CODE_ERROR) {
                        checkCodeError();
                    }
                }
            });
        }else {
            phoneError();
        }

    });
});
//手机更换，点击获取验证码  * 二 *
$(function(){
    $("#getCode").click(function () {
        var phone = $("#phone").val();
        if(isTelCode(phone)){
            settime(this);
            $.ajax({
                url: "/rufull/check/sendbindPhone",
                data: {"phone": phone},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {}
            });
        }else {
            phoneError();
        }

    });
});
//手机更换，异步校验数据   * 三 *
$(function () {
    $("#phone").change(function () {
        var phone = $("#phone").val();
        if(isTelCode(phone)){
            $.ajax({
                url: "/rufull/check/checkPhone",
                data: {"phone": phone},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if(result == PHONE_PASSED){
                        phonePassed();
                    }else if(result == PHONE_REGISTERED) {
                        phoneRegisted();
                    }else if(result == PHONE_FORMAT_ERROR) {
                        phoneError();
                    }
                }
            });
        }else {
            phoneError();
        }

    });
});
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
function phoneRegisted() {
    $("#returnMessage").html("手机被注册了");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}
function phonePassed() {
    $("#returnMessage").html("手机通过");
    $("#phone").attr("style", "border: 1px solid #7B9CD3");
}
function bindSuccess() {
    $("#showSpan3").attr("style", "color: #0089DC");
    $("#returnMessage").html("绑定成功");
    $("#checkCode").val("");
    countdown = 0;
    setTimeout(function () {
        $(location).attr('href', '/rufull/account/security');
    },3000)
}
function phoneError() {
    $("#returnMessage").html("手机号码格式错误");
    $("#phone").attr("style", "border: 1px solid #FF0000");
}
/*校验电话码格式 */
function isTelCode(str) {
    var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return reg.test(str);
}