var countdown=60;
var flag = false;
var PHONE_PASSED = "10";            //手机号码通过
var PHONE_REGISTERED = "11";        //手机号码被注册了
var PHONE_FORMAT_ERROR = "12";      //手机号码格式错误
var EMAIL_PASSED = "20";              //邮箱号码通过
var EMAIL_REGISTERED = "21";         //邮箱号码被注册了
var EMAIL_FORMAT_ERROR = "22";       //邮箱号码格式错误
var SNED_PHONE_CODE = "31";           //发送手机验证码成功
var SNED_EMAIL_CODE = "32";           //发送手机验证码成功
var LOGIN_SUCCESS = "100";            //登陆成功
var PASSWORD_ERROR = "101";           //密码错误
var REMOTE_LOGIN = "102";              //异地登陆
var REMOTE_CODE_ERROR = "103";        //异地登陆验证码错误
var SNED_REMOTE_CODE_SUCCESS = "104";//异地登陆验证码发送成功

/*
   商家状态：1.已经注册，但是没有入驻为               0
             2.已经填写入驻信息，但是未通过管理员审核200
             3.已经通过管理员审核，未创建商店        201
             4.已经创建商店                          202
             5.被管理员停业整顿                      203
             6.被管理员删除                          204
             7.商家入驻通过                          205


    */
var BUSINESS_STATUS_REGISTERED = 0;
var BUSINESS_STATUS_SETTLED = 200;
var BUSINESS_STATUS_SETTLED_PASS = 201;
var BUSINESS_STATUS_CREATED_SHOP= 202;
var BUSINESS_STATUS_RECITIFY = 203;
var BUSINESS_STATUS_DELETE= 204;

function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('注册方式');
    });
    $('.error').removeClass('alert alert-danger').html('');
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('登陆方式');
    });
     $('.error').removeClass('alert alert-danger').html('');
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 230);

}

function loginAjax(){
     shakeModal();
}
function registerAjax(){
    shakeModal();
}

function shakeModal(message){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html(message);
             $('input[type="password"]').val('');
             setTimeout( function(){
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 );
}

//输入错误，显示错误信息
function messageShow() {
    $("#registerButton").attr("disabled", true);
    $("#getCheckCodeButton").attr("disabled", true);
    $("#getCheckCodeButton").css("cursor",'not-allowed');
    $("#getCheckCodeButton").css("background-color","#5AC4EE");
    $(".error").show();

}
//输入正确，隐藏错误信息
function messageHide() {
    $("#registerButton").removeAttr("disabled");
    $("#getCheckCodeButton").removeAttr("disabled");
    $("#getCheckCodeButton").css("cursor","default");
    $(".error").hide();

}


//注册时候，输入手机或邮箱，输入框失去焦点的时候触发的事件
$(function(){
    //当输入注册信息输入框失去焦点时
    $("#phone").blur(function(){
        var value=$("#phone").val();
        $.ajax({
            url:"http://localhost:8080/rufull/check/checkAccountRegisterWays",//要请求的服务器url
            data:{phone:value},  //这里的phone对应表单中的name="phone"，注册方式也可替换成邮箱
            async:true,   //是否为异步请求
            cache:false,  //是否缓存结果
            type:"POST", //请求方式为POST
            dataType:"json",   //服务器返回的数据是json类型
            success:function(result){  //这个方法会在服务器执行成功是被调用 ，参数result就是服务器返回的值(现在是json类型)
                if(result == PHONE_PASSED){
                    messageHide();
                    flag = true;
                }else if (result == PHONE_REGISTERED){
                    shakeModal("手机被注册了");
                    messageShow();
                    flag = false;
                }else if (result == PHONE_FORMAT_ERROR){
                    shakeModal("手机格式错误")
                    flag = false;
                }else if (result == EMAIL_PASSED){//邮箱通过
                    flag = true;
                    messageHide();
                }else if (result == EMAIL_REGISTERED){
                    shakeModal("邮箱被注册了");
                    flag = false;
                    messageShow();
                }else if (result == EMAIL_FORMAT_ERROR){
                    shakeModal("手机或邮箱格式错误");
                    messageShow();
                    flag = false;
                }
            }
        })
    })
});


//点击"免费获取验证码"后，按钮变成"重新发送（60）"倒计时
function settime(val) {
    if (countdown == 0) {
        val.removeAttribute("disabled");
        val.value="免费获取验证码";
        countdown = 60;
        return;
    } else {
        val.setAttribute("disabled", true);
        val.value="重新发送(" + countdown + ")";
        countdown--;
    }
    setTimeout(function() {
        settime(val)
    },1000)
}
//点击免费获取密码时候，按钮触发的事件
$(function(){
    $("#getCheckCodeButton").click(function(){  //点击发送按钮
        var value=$("#phone").val();
        if(flag){
            settime(this);
            $.ajax({
                url:"http://localhost:8080/rufull/check/sendRegisterCode",//要请求的服务器url
                data:{phone:value},  //这里的phone对应表单中的name="phone"，注册方式也可替换成邮箱
                async:true,   //是否为异步请求
                cache:false,  //是否缓存结果
                type:"POST", //请求方式为POST
                dataType:"json",   //服务器返回的数据是json类型
                success:function(result){  //这个方法会在服务器执行成功是被调用 ，参数result就是服务器返回的值(现在是json类型)
                    if(result == SNED_PHONE_CODE){
                        // alert("短信验证码已发送成功,请尽快确认");
                    }else if(result == SNED_EMAIL_CODE){
                        // alert("邮箱验证码已发送成功,请尽快确认");
                    }
                }
            })
        }else {
            shakeModal("请填写注册的手机或邮箱");
            messageShow();
        }
    })
});

//注册时候输入密码，输入框离开聚焦时候触发的事件
$(function(){
    $("#registerPassword").blur(function(){  //点击发送按钮
        var rp = $("#registerPassword").val();
        if(!(/^[0-9a-zA-Z_]{6,15}$/.test(rp))){
            messageShow();
            shakeModal("密码必须是6-16位且由字母,数字和_组成");
        }else{
            messageHide();
            flag = true;
        }
    })
});
//注册时候确认密码，输入框离开聚焦时候触发的事件
$(function(){
    $("#confirmationPassword").blur(function(){  //点击发送按钮
        var rp = $("#registerPassword").val();
        var cp = $("#confirmationPassword").val();
        if(cp!=rp){
            messageShow();
            shakeModal("您的密码和确认密码不一致");
            flag = false;
        }else if((cp!="")&&(rp!="")){
            messageHide();
            flag = true;
        }
    })
});

//点击登陆按钮登陆
$(function(){
    $("#loginButton").click(function(){
        var username = $("#username").val();
        var password = $("#loginPassword").val();
        var ip = returnCitySN["cip"] ;
        var city = returnCitySN["cname"] ;
        var remoteCode = $("#remoteCode").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/accountLogin",
            data: {"username": username,"password":password,"ip":ip,"city":city,"remoteCode":remoteCode},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result == LOGIN_SUCCESS) {
                    $(location).attr('href', 'http://localhost:8080/rufull');
                } else if (result == PASSWORD_ERROR) {
                    shakeModal("账号或密码不正确");
                    $("#hideDiv").attr("style","display:block;");
                }else if(result == REMOTE_LOGIN){
                    shakeModal("您是异地登陆，请进行身份验证");
                    $("#hideDiv").attr("style","display:block;");
                }else if(result == REMOTE_CODE_ERROR){
                    shakeModal("验证码错误，请重新输入");
                    $("#hideDiv").attr("style","display:block;");
                }

                //商家模块

                else if(result == BUSINESS_STATUS_REGISTERED ||
                          result == BUSINESS_STATUS_SETTLED){   // 已经注册但没有填写入驻信息
                    $(location).attr('href', '/business/addBusinessUI');//商家入驻页面
                }else if(result == BUSINESS_STATUS_SETTLED_PASS ||
                         result == BUSINESS_STATUS_CREATED_SHOP){ // 已经填写入驻想信息
                    $(location).attr('href', 'http://localhost:8080/rufull/business/addBusiness');  // 展示商家页面
                }else if( result == BUSINESS_STATUS_RECITIFY){   // 商家被停业整顿
                    // $(location).attr('href', 'http://localhost:8080/rufull/business/showBusiness');  //还没有对应的页面或者提示
                }else if(result == BUSINESS_STATUS_DELETE){      //商家被管理员删除
                    // 提示信息：请联系饱了吗：客服
                }
            }
        });
    })
});

$(function () {
    $("#loginCodeBtn").click(function () {
        var username = $("#username").val();
        settime(this);
        $.ajax({
            url: "http://localhost:8080/rufull/check/sendRometeCheckCode",
            data: {"username": username},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result == SNED_REMOTE_CODE_SUCCESS){

                }else {
                    alert("发送失败");
                }
            }
        });

    });
});







