/**
 * Created by Luckily on 2017/12/15.
 */
if(logerror!='') {
    window.onload = function() {
        swal("操作失败", "插入日志出错!", "error");
    };
}
if(updateAccsuccess!='') {
    window.onload = function() {
        swal("操作成功", "更新用户信息成功!", "success");
    };
}

if(delAccerror!='') {
    window.onload = function() {
        swal("操作失败", "删除用户出错!", "error");
    };
}

if(delAccsuccess!='') {
    window.onload = function() {
        swal("操作成功", "删除用户成功!", "success");
    };
}

if(redelAccerror!='') {
    window.onload = function() {
        swal("操作失败", "恢复用户的使用权出错!", "error");
    };
}

if(redelAccsuccess!='') {
    window.onload = function() {
        swal("操作成功", "恢复用户的使用权成功!", "success");
    };
}
