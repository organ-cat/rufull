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
            file: {
                message: '验证失败',
                validators: {
                    notEmpty: {
                        message: '商品图片不能为空'
                    }
                }
            },
            productName: {
                validators: {
                    notEmpty: {
                        message: '商品名不能为空'
                    }
                }
            },

            price: {
                validators: {
                    notEmpty: {
                        message: '商品价格不为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+.[0-9]{2}$/,
                        message: '价格格式不正确,格式为：0.00保留两位小数'
                    },
                }
            },



        }
    });
});