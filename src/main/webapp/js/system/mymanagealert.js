/**
 * Created by Luckily on 2017/12/16.
 */
/*日志管理部分*/
if(logerror!='') {
    window.onload = function() {
        swal("操作失败", "插入日志出错!", "error");
    };
}

/*管理员管理部分*/



if(addMsuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功添加管理员!", "success");
    };
}



if(updatesuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功更新管理员!", "success");
    };
}



if(delsuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功删除管理员!", "success");
    };
}

if(delerror!='') {
    window.onload = function() {
        swal("操作失败", "删除管理员失败!", "error");
    };
}

if(redelsuccess!='') {
    window.onload = function() {
        swal("操作成功", "成功恢复已被删除的管理员!", "success");
    };
}

if(redelerror!='') {
    window.onload = function() {
        swal("操作失败", "恢复已被删除的管理员失败!", "error");
    };
}