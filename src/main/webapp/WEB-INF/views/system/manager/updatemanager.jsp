<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>修改管理员</title>
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
        function submitform() {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要更新吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    document.Infoform.submit();
                });
        }
        var updateerror = "${updateerror}";
        var logerror = "${logerror}";
        if(logerror!='') {
            window.onload = function() {
                swal("操作失败", "插入日志出错!", "error");
            };
        }
        if(updateerror!='') {
            window.onload = function() {
                swal("操作失败", "更新管理员失败!", "error");
            };
        }
    </script>
</head>
<body>
<form id="ManagerForm" name="Infoform" class="form-inline" action="${pageContext.request.contextPath}/manager/updateManager" method="post" enctype="multipart/form-data">
    <div class="col-sm-2" style="padding-top: 100px;">
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding:3px;height:30px;">
                管理员头像
            </div>
            <div class="panel-body" id="imgSrc">
                <p><label></label>
                    <img id="imgSize1ImgSrc" src="${pageContext.request.contextPath}/upload/manager/${requestScope.manager.photo}"
                         height="150px" width="120px" class="img-thumbnail"/>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 150px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">管理员姓名:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username"
                   value="${requestScope.manager.username}" name = "username" placeholder="请输入姓名！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">管理员手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone"
                   value="${requestScope.manager.phone}" name="phone"  placeholder="1xxxxxxxxxx">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="exampleInputEmail2">管理员邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="exampleInputEmail2"
                   value="${requestScope.manager.email}" name=" email"  placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 343px" >
        <div class="form-group">
            <label style="font-size: 20px;" >创建的时间:</label>
            <label style="font-size: 20px;" >
                &nbsp;&nbsp;<fmt:formatDate value="${requestScope.manager.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
            </label>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 343px" >
        <div class="form-group">
            <label style="font-size: 20px;" >管理员状态:</label>
                <c:if test="${requestScope.manager.status==1}">
                    <label style="font-size: 20px;" >
                        &nbsp;&nbsp;管理员状态正常</label>
                </c:if>
            <c:if test="${requestScope.manager.status==0}">
                &nbsp;&nbsp;<label style="font-size: 20px;" >管理员已被删除</label>
            </c:if>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 360px" >
        <div class="form-group" style="padding-left: 350px;">
            <input type="hidden" name="id" value="${requestScope.manager.id}"/>
            <input type="button" onclick="submitform();" class="sgBtn" value="确定修改"/>
        </div>
    </div>
</form>

</body>
</html>
