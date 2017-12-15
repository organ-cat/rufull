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
        alert(phone + password + checkCode);
        $.ajax({
            url: "http://localhost:8080/rufull/nologin/forgotPassword",
            data: {"phone": phone,"password":password, "checkCode": checkCode},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result == "1") {
                    alert("修改成功");
                }else if(result == "0"){
                    alert("修改失败");
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
            url: "http://localhost:8080/rufull/check/sendCode",
            data: {"phone": phone},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if(result == PHONE_FORMAT_ERROR){
                    alert("手机或者邮箱号码格式错误");
                }
            }
        });
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
                    alert("手机通过");
                }else if(result == EMAIL_PASSED) {
                    alert("邮箱通过");
                }else if(result == PHONE_FORMAT_ERROR) {
                    alert("手机或邮箱格式错误");
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
