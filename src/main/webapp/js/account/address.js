var host = window.location.host;
function addAddress(){
    showAddresss();
    setTimeout(function(){
        $('#addAddressId').modal('show');
    }, 200);
}
function showAddresss() {
    $('.error').removeClass('alert alert-danger').html('');
}
function updateAddress(id){
    $.ajax({
        url: "/rufull/address/findAddressById",
        data: {"id": id},
        async: true,
        cache: false,
        type: "GET",
        dataType: "json",
        success: function (result) {
            $("#accountId").val(result.accountId);
            $("#id").val(result.id);
            $("#phone").val(result.phone);
            $("#receiver").val(result.receiver);
            $("#location").attr('placeholder', result.location);
            $("#detail").val(result.detail);
            if(result.status == "1"){
                $("#radioCheckedTrue").attr("checked", "checked");
            }else {
                $("#radioCheckedFalse").attr("checked", "checked");
            }
        }
    });
    showAddresss();
    setTimeout(function(){
        $('#updateAddressId').modal('show');
    }, 200);
}
function showAddresss() {
    $('.error').removeClass('alert alert-danger').html('');
}
function hideView() {
    $('#addAddressId').modal('hide');
    $('#updateAddressId').modal('hide');
    $('.error').removeClass('alert alert-danger').html('');
}
$(function () {
    $("#phone").mouseleave(function () {
        var phone = $("#phone").val();
        if(isTelCode(phone)){
            $("#phone").css("border", "1px solid #999999");
            allowSubmit();
        }else {
            $("#phone").css("border", "1px solid #ff0000");
            banSubmit();
        }
    });
})
$(function () {
    $("#receiverPhone").mouseleave(function () {
        var phone = $("#receiverPhone").val();
        if(isTelCode(phone)){
            $("#receiverPhone").css("border", "1px solid #999999");
            allowSubmit();
        }else {
            $("#receiverPhone").css("border", "1px solid #ff0000");
            banSubmit();
        }
    });
})

/*校验电话码格式 */
function isTelCode(str) {
    var reg= /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
    return reg.test(str);
}
function banSubmit() {
    $(".saveBtn").attr("disabled", true);
    $(".saveBtn").css("cursor",'not-allowed');
}
//输入正确，隐藏错误信息
function allowSubmit() {
    $(".saveBtn").removeAttr("disabled");
    $(".saveBtn").css("cursor","default");
}
