// 表单验证
$(function () {

    $('form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            files: {
                message: '验证失败',
                validators: {
                    notEmpty: {
                        message: '上传文件不能为空'
                    }
                }
            },
            identifier: {
                validators: {
                    stringLength: {
                        min:'15',
                        max:'18',
                        message: '身份证格式不正确'
                    },
                    notEmpty: {
                        message: '身份证不能为空'
                    },

                }
            }
        }
    });
});