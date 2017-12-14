var UPDATE_PASSWORD_SUCCESS = "300";
var UPDATE_PASSWORD_FAIL = "301";

$(function(){
    $("#updatePassword").click(function(){
        var id = $("#id").val();
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();
        if(newPassword == confirmPassword){
            $.ajax({
                url: "http://localhost:8080/rufull/account/updatePassword",
                data: {"id": id,"newPassword":newPassword,"oldPassword":oldPassword},
                async: true,
                cache: false,
                type: "POST",
                dataType: "json",
                success: function (result) {
                    if (result == UPDATE_PASSWORD_SUCCESS) {
                        $(".updateInPassworMessage").attr("style", "background-color: #74c864");
                        $("#messageId").html("密码修改成功，请使用您的新密码");

                    } else if (result == UPDATE_PASSWORD_FAIL) {
                        $(".updateInPassworMessage").attr("style", "background-color: #FF6D5A");
                        $("#messageId").html("警告！您输入的当前密码不正确");
                    }
                }
            });
        }else {
            $(".updateInPassworMessage").attr("style", "background-color: #FFE343");
            $("#messageId").html("警告！新的密码和确认密码不一致");
        }

        $("#oldPassword").val("");
        $("#newPassword").val("");
        $("#confirmPassword").val("");
    })
});