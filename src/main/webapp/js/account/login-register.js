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
var flag = false;

function messageShow() {
    $("#registerButton").attr("disabled", true);
    $("#getCheckCodeButton").attr("disabled", true);
    $("#getCheckCodeButton").css("cursor",'not-allowed');
    $("#getCheckCodeButton").css("background-color","#5AC4EE");
    $(".error").show();

}
function messageHide() {
    $("#registerButton").removeAttr("disabled");
    $("#getCheckCodeButton").removeAttr("disabled");
    $("#getCheckCodeButton").css("cursor","default");
    $(".error").hide();

}



$(function(){
    $("#phone").blur(function(){  //当xxx失去焦点时
        var value=$("#phone").val();
        $.ajax({
            url:"http://localhost:8080/rufull/check/checkAccountRegisterWays",//要请求的服务器url
            //这是一个对象，表示请求的参数，两个参数：method=ajax&val=xxx，服务器可以通过request.getParameter()来获取
            //data:{method:"ajaxTest",val:value},
            data:{phone:value},  //这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
            async:true,   //是否为异步请求
            cache:false,  //是否缓存结果
            type:"POST", //请求方式为POST
            dataType:"json",   //服务器返回的数据是什么类型
            success:function(result){  //这个方法会在服务器执行成功是被调用 ，参数result就是服务器返回的值(现在是json类型)
                if(result == "10"){//手机通过
                    messageHide();
                    flag = true;
                }else if (result == "11"){
                    shakeModal("手机被注册了");
                    messageShow();
                    flag = false;
                }else if (result == "12"){
                    shakeModal("手机格式错误")
                    flag = false;
                }else if (result == "20"){//邮箱通过
                    flag = true;
                    messageHide();
                }else if (result == "21"){
                    shakeModal("邮箱被注册了");
                    flag = false;
                    messageShow();
                }else if (result == "22"){
                    shakeModal("手机或邮箱格式错误");
                    messageShow();
                    flag = false;
                }
            }
        })
    })
});

$(function(){
    $("#getCheckCodeButton").click(function(){  //点击发送按钮
        var value=$("#phone").val();
        if(flag){
            $.ajax({
                url:"http://localhost:8080/rufull/check/sendRegisterCode",//要请求的服务器url
                data:{phone:value},  //这里的email对应表单中的name="email"，也是发送url中的email=value(GET方式)
                async:true,   //是否为异步请求
                cache:false,  //是否缓存结果
                type:"POST", //请求方式为POST
                dataType:"json",   //服务器返回的数据是什么类型
                success:function(result){  //这个方法会在服务器执行成功是被调用 ，参数result就是服务器返回的值(现在是json类型)
                    if(result == "31"){
                        alert("短信验证码已发送成功,请尽快确认");
                    }else if(result == "32"){
                        alert("邮箱验证码已发送成功,请尽快确认");
                    }
                }
            })
        }else {
            shakeModal("请填写注册的手机或邮箱");
            messageShow();
        }

    })
});

$(function(){
    $("#confirmationPassword").blur(function(){  //点击发送按钮
        var rp = $("#registerPassword").val();
        var cp = $("#confirmationPassword").val();
        if(cp!=rp){
            messageShow();
            shakeModal("您的密码和确认密码不一致");
        }else if(!(/^[0-9a-zA-Z_]{6,15}$/.test(rp))){
            messageShow();
            shakeModal("密码必须是6-16位且由字母,数字和_组成");
        }else{
            messageHide();
        }
    })
});

// var countdown=60;
// function settime(val) {
//     if (countdown == 0) {
//         val.removeAttribute("disabled");
//         val.value="免费获取验证码";
//         countdown = 60;
//         return;
//     } else {
//         val.setAttribute("disabled", true);
//         val.value="重新发送(" + countdown + ")";
//         countdown--;
//     }
//     setTimeout(function() {
//         settime(val)
//     },1000)
// }

