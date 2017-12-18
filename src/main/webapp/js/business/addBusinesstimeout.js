var InterValObj; //timer变量，控制时间
var count = 10; //间隔函数，1秒执行
var curCount;//当前剩余秒数

$(function(){
    curCount = count;
    var dealType; //验证方式
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次

});

//timer处理函数
function SetRemainTime() {
    if (curCount == 0) {
        window.clearInterval(InterValObj);//停止计时器
        window.location = "http://localhost:8080/rufull/business/addBusinessUI";
    }
    else {
        curCount--;
        $("#successText").text("系统会在" + curCount +"秒后自动跳转首页！");
    }
}