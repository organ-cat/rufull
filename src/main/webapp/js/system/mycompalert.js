/**
 * Created by Luckily on 2017/12/15.
 */
/*日志管理部分*/


if(logerror!='') {
    window.onload = function() {
        swal("操作失败", "插入日志出错!", "error");
    };
}

/**投诉管理部分**/
if(getacccomperror!='') {
    window.onload = function() {
        swal("操作失败", "获取用户的投诉信息出错!", "error");
    };
}

if(replysuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功回复用户的投诉信息!", "success");
    };
}


if(replyallsuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功一键回复用户的投诉信息!", "success");
    };
}

if(replyallerror!='') {
    window.onload = function() {
        swal("操作失败", "一键回复用户的投诉信息失败!", "error");
    };
}
