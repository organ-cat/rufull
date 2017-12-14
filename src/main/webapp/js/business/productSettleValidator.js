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
                        regexp: /^[0-9]+$/,
                        message: '商品价格只能为数字'
                    },
                    numeric: {
                        message:'只能输入数字'
                    },
                    stringLength: {
                        min: 1,
                        max: 2,
                        message: '商店价格以人民币为单位'
                    }
                }
            },



        }
    });
});