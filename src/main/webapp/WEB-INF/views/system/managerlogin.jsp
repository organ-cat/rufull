<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RuFull后台登录</title>

    <link href="${pageContext.request.contextPath}/css/system/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/system/signin.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js" type="text/javascript"
            charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>
    <script type="text/javascript">
        var loginError = "${loginerror}";
        if(loginError!='') {
            window.onload = function() {
                swal("操作失败", "管理员信息不正确!", "error");
            };
        }
    </script>
</head>
<body>

<div class="signin">
    <div class="signin-head "><img src="${pageContext.request.contextPath}/image/system/atm.png" class="imgsize"></div>
    <form class="form-signin" role="form" action="${pageContext.request.contextPath}/adminLogin/Login" method="post">
        <input type="text" name="loginname" class="form-control" placeholder="请填写用户名/手机号/邮箱" required autofocus/>
        <input type="password" name="password" class="form-control" placeholder="请填写密码" required/>
        <button class="btn btn-lg btn-warning btn-block" type="submit">登录</button>
    </form>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

</div>
</body>
</html>

