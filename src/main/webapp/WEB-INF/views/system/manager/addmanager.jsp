<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/indexJs.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/xcConfirm.css"/>
    <script src="${pageContext.request.contextPath}/js/system/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/system/promptbox.js" type="text/javascript" charset="utf-8"></script>
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
            document.addform.submit();
        }
    </script>
</head>
<body>
<form id="ManagerForm" name="addform" class="form-inline" action="${pageContext.request.contextPath}/manager/saveManager" method="post" enctype="multipart/form-data">

    <div class="col-sm-8" style="padding-top: 100px;padding-left: 150px;">
        <div class="form-group">
            <h1>添加新的管理员</h1>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">管理员姓名:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username"
                   name = "username" placeholder="请输入姓名！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">管理员密码:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username"
                   name = "password" placeholder="请输入默认初始密码！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">管理员手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone"
                   name="phone"  placeholder="1xxxxxxxxxx">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="exampleInputEmail2">管理员邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="exampleInputEmail2"
                   name=" email"  placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>

    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px" >
        <div class="form-group" style="padding-left: 350px;">
            <input type="hidden" name="id" value="${requestScope.manager.id}"/>
            <input type="button" onclick="submitform();" class="sgBtn" value="确认提交"/>
        </div>
    </div>
</form>

</body>
</html>
