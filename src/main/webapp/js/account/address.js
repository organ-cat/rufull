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
        url: "http://localhost:8080/rufull/address/findAddressById",
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
            $("#location").val(result.location);
            $("#detail").val(result.detail);
            $("#status").val(result.status);
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