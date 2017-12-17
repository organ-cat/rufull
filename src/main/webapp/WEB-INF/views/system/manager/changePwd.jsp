<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员修改密码</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/indexJs.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <style type="text/css">
        .sgBtn {
            width: 135px;
            height: 35px;
            line-height: 35px;
            margin-left: 10px;
            margin-top: 10px;
            text-align: center;
            background-color: #0095D9;
            color: #FFFFFF;
            float: left;
            border-radius: 5px;
        }
    </style>
    <script type="text/javascript">
        function checkold() {
            var option = {
                type: 'POST',
                url: '${pageContext.request.contextPath }/manager/checkPwd',
                dataType: 'text',
                /*data: {
                    password: document.getElementById("password").value
                },*/
                success: function (data) {
                    var jsonObj = JSON.stringify(data);
                    //alert(jsonObj=="\"00\"");
                    //var jsonObj = $.parseJSON(data);
                    if (jsonObj == "\"00\"") {
                        swal("操作失败", "原密码错误!", "error");
                    }
                }
            };
            $("#ManagerForm").ajaxSubmit(option);
        };

        function checkrepeat() {
            var option = {
                type: 'POST',
                url: '${pageContext.request.contextPath }/manager/repeatPwd',
                dataType: 'text',
                /*data: {
                    pwd1: document.getElementById("pwd1").value,
                    pwd2: document.getElementById("pwd2").value
                },*/
                success: function (data) {
                    var jsonObj = JSON.stringify(data);
                    //alert(jsonObj);
                    //var jsonObj = $.parseJSON(data);
                    if (jsonObj == "\"00\"") {
                        swal("操作失败", "重复密码不一致!", "error");
                    }
                }
            };
            $("#ManagerForm").ajaxSubmit(option);
        };

        function submitform() {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要修改密码吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    document.Infoform.submit();
                });
        }

        var repetpwd = "${repetpwd}";
        var editpwdsuccess = "${editpwdsuccess}";
        var editpwderror = "${editpwderror}";

        if (repetpwd != '') {
            window.onload = function () {
                swal("操作失败", "重复密码不一致!", "error");
            };
        }

        if (editpwderror != '') {
            window.onload = function () {
                swal("操作失败", "修改密码失败!", "error");
            };
        }
    </script>
</head>
<body>

<form id="ManagerForm" name="Infoform" class="form-inline" action="${pageContext.request.contextPath}/manager/editPwd"
      method="post" enctype="multipart/form-data">

    <div class="col-sm-8" style="padding-top: 150px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="password">原来密码:</label>
            <input type="password" class="form-control input-lg" style="min-width: 450px;" id="password"
                   name="password" placeholder="请输入旧密码！" onblur="checkold();">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="pwd1">新的密码:</label>
            <input type="password" class="form-control input-lg" style="min-width: 450px;" id="pwd1"
                   name="pwd1" placeholder="请输入新密码">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="pwd2">重复密码:</label>
            <input type="password" class="form-control input-lg" style="min-width: 450px;" id="pwd2"
                   name=" pwd2" onblur="checkrepeat();" placeholder="重复输入新的密码">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group" style="padding-left: 400px;">
            <input type="button" onclick="submitform();" class="sgBtn" value="确定修改">
        </div>
    </div>
</form>

</body>
</html>
