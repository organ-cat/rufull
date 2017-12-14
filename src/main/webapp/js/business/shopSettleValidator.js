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
            shopName: {
                validators: {
                    notEmpty: {
                        message: '商店名不能为空'
                    }
                }
            },
            shopType: {
                validators: {
                    notEmpty: {
                        message: '商店类型'
                    }
                }
            },
            shopPhone: {
                validators: {
                    notEmpty: {
                        message: '商店电话不能为空'
                    },
                    phone:{
                        message:'电话格式不正确',
                        country:'CN'
                    }
                }
            },
            shippingTime: {
                validators: {
                    notEmpty: {
                        message: '配送时间不为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '配送时间只能为数字'
                    },
                    numeric: {
                        message:'只能输入数字'
                    },
                    stringLength: {
                        min: 1,
                        max: 2,
                        message: '配送时间分钟为单位'
                    }
                }
            },

            supportPaySelect: {
                validators: {
                    notEmpty: {
                        message: '支持支付方式不为空'
                    }
                }
            },
            shippingDistance: {
                validators: {
                    notEmpty: {
                        message: '配送距离不为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '配送时间只能为数字'
                    },
                    numeric: {
                        message:'只能输入数字'
                    },
                    stringLength: {
                        min: 1,
                        max: 2,
                        message: '配送时间分钟为单位'
                    }
                }
            },
            file: {
                validators: {
                    notEmpty: {
                        message: '上传图片不为空'
                    }
                }
            },
            detailAddress: {
                validators: {
                    notEmpty: {
                        message: '定位地址不为空'
                    }
                }
            },

            shippingFee: {
                validators: {
                    notEmpty: {
                        message: '配送费用不为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '配送时间只能为数字'
                    },
                    numeric: {
                        message:'只能输入数字'
                    },
                    stringLength: {
                        min: 1,
                        max: 3,
                        message: '配送以人民币为单位'
                    }
                }
            },
            shippingPrice: {
                validators: {
                    notEmpty: {
                        message: '配送起价不为空'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '配送时间只能为数字'
                    },
                    numeric: {
                        message: '只能输入数字'
                    },
                    stringLength: {
                        min: 1,
                        max: 3,
                        message: '配送以人民币为单位'
            }
        }
    },

        }
    });
});