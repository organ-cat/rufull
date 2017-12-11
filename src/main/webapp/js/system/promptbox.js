/**
 * Created by Luckily on 2017/12/11.
 */
    $(function () {
     //   var loginerror = "${sessionScope.loginerror}";
        if(loginerror!='')
        {
            var txt=  "管理员登录信息不正确！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

      //  var editpwdsuccess = "${sessionScope.editpwdsuccess}";
        if(editpwdsuccess!='')
        {
            var txt=  "更改密码成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

      //  var editpwderror = "${sessionScope.editpwderror}";
        if(editpwderror!='')
        {
            var txt=  "更改密码失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

      //  var editInfosuccess = "${sessionScope.editInfosuccess}";
        if(editInfosuccess!='')
        {
            var txt=  "更改管理员信息成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

      //  var editInfoerror = "${sessionScope.editInfoerror}";
        if(editInfoerror!='')
        {
            var txt=  "更改管理员信息失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

      //  var logerror = "${sessionScope.logerror}";
        if(logerror!='')
        {
            var txt=  "系统日志写入失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

      //  var addMerror = "${sessionScope.addMerror}";
        if(addMerror!='')
        {
            var txt=  "添加管理员失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

      //  var addMsuccess = "${sessionScope.addMsuccess}";
        if(addMsuccess!='')
        {
            var txt=  "添加管理员成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

       // var updateerror= "${sessionScope.updateerror}";
        if(updateerror!='')
        {
            var txt=  "更改管理员失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var updatesuccess= "${sessionScope.updatesuccess}";
        if(updatesuccess!='')
        {
            var txt=  "更改管理员成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

       // var delerror= "${sessionScope.delerror}";
        if(delerror!='')
        {
            var txt=  "删除管理员失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var delsuccess= "${sessionScope.delsuccess}";
        if(delsuccess!='')
        {
            var txt=  "删除管理员成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

      //  var redelerror= "${sessionScope.redelerror}";
        if(redelerror!='')
        {
            var txt=  "删除管理员失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

     //   var redelsuccess= "${sessionScope.redelsuccess}";
        if(redelsuccess!='')
        {
            var txt=  "删除管理员成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

        //var examerror= "${sessionScope.examerror}";
        if(examerror!='')
        {
            var txt=  "允许商家入驻失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var examsuccess= "${sessionScope.examsuccess}";
        if(examsuccess!='')
        {
            var txt=  "允许商家入驻成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }


       // var npexamerror= "${sessionScope.npexamerror}";
        if(npexamerror!='')
        {
            var txt=  "终止商家入驻失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var npexamsuccess= "${sessionScope.npexamsuccess}";
        if(npexamsuccess!='')
        {
            var txt=  "终止商家入驻失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

       // var delBsuccess= "${sessionScope.delBsuccess}";
        if(delBsuccess!='')
        {
            var txt=  "撤销商家入驻成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

       // var delBerror= "${sessionScope.delBerror}";
        if(delBerror!='')
        {
            var txt=  "撤销商家入失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var updateAccerror= "${sessionScope.updateAccerror}";
        if(updateAccerror!='')
        {
            var txt=  "更新用户失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var updateAccsuccess= "${sessionScope.updateAccsuccess}";
        if(updateAccsuccess!='')
        {
            var txt=  "更新用户失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

       // var delAccerror= "${sessionScope.delAccerror}";
        if(delAccerror!='')
        {
            var txt=  "删除用户失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

        //var delAccsuccess= "${sessionScope.delAccsuccess}";
        if(delAccsuccess!='')
        {
            var txt=  "删除用户成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

      //  var getcomperror= "${sessionScope.getcomperror}";
        if(getcomperror!='')
        {
            var txt=  "处理投诉失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var getacccomperror= "${sessionScope.getacccomperror}";
        if(getacccomperror!='')
        {
            var txt=  "处理投诉失败！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var replysuccess= "${sessionScope.replysuccess}";
        if(replysuccess!='')
        {
            var txt=  "回复投诉成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
        }

      //  var replyerror= "${sessionScope.replyerror}";
        if(replyerror!='') {
            var txt = "回复投诉成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

       // var replyerror= "${sessionScope.replyerror}";
        if(replyerror!='') {
            var txt = "回复投诉成功！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
        }

    })

