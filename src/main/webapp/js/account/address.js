function addAddress(){
    showAddresss();
    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 800);
}
function showAddresss() {
    $('#addAddressId').fadeIn('fast',function(){

    });
    $('.error').removeClass('alert alert-danger').html('');

}