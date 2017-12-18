<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>添加管理员</title>
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
        function submitform() {
            var username = document.getElementById('username').value;
            var password = document.getElementById('password').value;
            var phone = document.getElementById('phone').value;
            var email = document.getElementById('email').value;
            if (username == null || username == '') {
                swal("操作失败", "用户名不能为空!", "error");
                return false;
            }
            if (password == null || password == '') {
                swal("操作失败", "密码不能为空!", "error");
                return false;
            }
            if (password.length < 6 || password.length > 16) {
                swal("操作失败", "密码的长度必须介于6~16之间!", "error");
                return false;
            }
            if (phone == null || phone == '') {
                swal("操作失败", "手机号码不能为空!", "error");
                return false;
            }
            if (!(/^1(3|4|5|7|8)\d{9}$/.test(phone))) {
                swal("操作失败", "手机号码填写有误!", "error");
                return false;
            }


            if (email == null || email == '') {
                swal("操作失败", "邮箱不能为空!", "error");
                return false;
            }
            if (!(/^([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|_|.]?)*[a-zA-Z0-9]+\.(?:com|cn)$/
                    .test(email))) {
                swal("操作失败", "邮箱格式有误！", "error");
                return false;
            }
            else {
                swal({
                        title: "确定操作吗？",
                        text: "你确定要添加管理员吗？",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: '#00FF00',
                        confirmButtonText: 'sure'
                    },
                    function () {
                        document.addform.submit();
                    });

            }
        }
        var addMerror = "${addMerror}";
        var logerror = "${logerror}";
        if (logerror != '') {
            window.onload = function () {
                swal("操作失败", "插入日志出错!", "error");
            };
        }
        if (addMerror != '') {
            window.onload = function () {
                swal("操作失败", "添加管理员失败!", "error");
            };
        }
    </script>
</head>
<body>
<form id="ManagerForm" role="form" name="addform" class="form-inline"
      action="${pageContext.request.contextPath}/manager/saveManager" method="post" enctype="multipart/form-data">

    <div class="col-sm-8" style="padding-top: 100px;padding-left: 150px;">
        <div class="form-group">
            <h1>添加新的管理员</h1>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">管理员姓名:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username"
                   name="username" placeholder="请输入姓名！"/>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">管理员密码:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="password"
                   name="password" placeholder="请输入默认初始密码！"/>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">管理员手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone"
                   name="phone" value="" placeholder="1xxxxxxxxxx"/>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="email">管理员邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="email"
                   name=" email" placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>

    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group" style="padding-left: 350px;">
            <input type="hidden" name="id" value="${requestScope.manager.id}"/>
            <input type="button" onclick="submitform();" class="sgBtn" value="确认提交"/>
        </div>
    </div>
</form>

</body>
</html>
