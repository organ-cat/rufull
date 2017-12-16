/**
 * Created by Luckily on 2017/12/15.
 */

/*日志管理部分*/
if(logerror!='') {
    window.onload = function() {
        swal("操作失败", "插入日志出错!", "error");
    };
}

/*商家管理部分*/

if(delBsuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功删除商家!", "success");
    };
}

if(delBerror!='') {
    window.onload = function() {
        swal("操作失败", "删除商家失败!", "error");
    };
}


if(rogBsuccess!='') {
    window.onload = function() {
        swal("操作成功", "停止商家营业成功!", "success");
    };
}

if(rogBerror!='') {
    window.onload = function() {
        swal("操作失败", "停止商家营业失败!", "error");
    };
}


if(redelsuccess!='') {
    window.onload = function() {
        swal("操作成功", "允许商家重新入驻成功!", "success");
    };
}

if(redelerror!='') {
    window.onload = function() {
        swal("操作失败", "允许商家重新入驻失败!", "error");
    };
}