<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RuFull后台登录</title>

    <link href="../../../css/system/bootstrap.min.css" rel="stylesheet">
    <link href="../../../css/system/signin.css" rel="stylesheet">

</head>

<body>

<div class="signin">
    <div class="signin-head "><img src="../../../image/system/atm.png" class="img-circle imgsize"></div>
    <form class="form-signin" role="form" action="manage/login.do">
        <input type="text" name="username" class="form-control" placeholder="请填写用户名/手机号/邮箱" required autofocus />
        <input type="password" name="password" class="form-control" placeholder="请填写密码" required />
        <button class="btn btn-lg btn-warning btn-block" type="submit">登录</button>
    </form>
</div>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">

</div>
</body>
</html>

