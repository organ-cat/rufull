$(function () {
    $(".accountPhoto").mouseenter(function () {
        $(".editInfo").show();
    });
    $(".accountPhoto").mouseleave(function () {
        $(".editInfo").hide();
    });
});

$(function () {
    $(".infoPhoto").mouseenter(function () {
        $(".updatePhoto").show();
    });
    $(".infoPhoto").mouseleave(function () {
        $(".updatePhoto").hide();
    });
});
$(function () {
    $("#aNick").click(function () {
        var nickname = $("#nickname").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/updateNickname",
            data: {"nickname": nickname},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});
$(function () {
    $("#aUser").click(function () {
        var username = $("#username").val();
        $.ajax({
            url: "http://localhost:8080/rufull/account/setUsername",
            data: {"username": username},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});

$(function () {
    $("#username").blur(function () {
        var username = $("#username").val();
        alert(username);
        $.ajax({
            url: "http://localhost:8080/rufull/check/checkUsername",
            data: {"username": username},
            async: true,
            cache: false,
            type: "POST",
            dataType: "json",
            success: function (result) {
                alert(result)
            }
        });
    });
});

