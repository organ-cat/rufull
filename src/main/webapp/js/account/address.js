function addAddress(){
    showAddresss();

    $('#addAddressId').css({
        position:'absolute',
        left: ($(window).width() - $('#addAddressId').outerWidth())/2,
        top: ($(window).height() - $('#addAddressId').outerHeight())/2 + $(document).scrollTop()
    });

    setTimeout(function(){
        $('#loginModal').modal('show');
    }, 800);
}
function showAddresss() {
    $('#addAddressId').fadeIn('fast',function(){

    });
    $('.error').removeClass('alert alert-danger').html('');

}

$(function () {
    $("#nav").click(function () {
        $('#addAddressId').fadeOut('fast',function(){

        });
    });
});