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
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>管理员更新用户信息</title>
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
                    text: "你确定要更新用户吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    document.accountInfoform.submit();
                });
        }
        var updateAccerror = "${updateAccerror}";
        if(updateAccerror!='') {
            window.onload = function() {
                swal("操作失败", "更新用户信息出错!", "error");
            };
        }
        phone.oninvalid=function(){
            phone.setCustomValidity("请输正确的手机号码？");
        };
    </script>
</head>
<body>
<form id="ManagerForm" name="accountInfoform" class="form-inline"
      action="${pageContext.request.contextPath}/manageAcc/updateacccount" method="post" enctype="multipart/form-data">

    <div class="col-sm-8" style="padding-top: 80px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">用户姓名:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username" required
                   value="${requestScope.maccount.username}" name="username" placeholder="请输入姓名！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">用户密码:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="phone" required
                   value="${requestScope.maccount.password}" name="password" placeholder="请填写新密码">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">用户手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone" pattern="^1[3-9]\d{9}$" required
                   value="${requestScope.maccount.phone}" name="phone" placeholder="1xxxxxxxxxx">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;" for="exampleInputEmail2">用户邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="exampleInputEmail2" required
                   value="${requestScope.maccount.email}" name=" email" placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;">注册时间:</label>
            <label style="font-size: 20px;">
                &nbsp;&nbsp;<fmt:formatDate value="${requestScope.maccount.registerTime}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/>
            </label>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;">用户状态:</label>
            <c:if test="${requestScope.maccount.status==100}">
                <label style="font-size: 20px;">
                    &nbsp;&nbsp;状态正常</label>
            </c:if>
            <c:if test="${requestScope.maccount.status==101}">
                &nbsp;&nbsp;<label style="font-size: 20px;" >状态异常</label>
            </c:if>
            <c:if test="${requestScope.maccount.status!=101}">
                <c:if test="${requestScope.maccount.status!=100}">
                    &nbsp;&nbsp;<label style="font-size: 20px;" >商家状态</label>
                </c:if>
            </c:if>
        </div>
    </div>

    <div class="col-sm-8" style="padding-top: 20px;padding-left: 200px">
        <div class="form-group">
            <label style="font-size: 20px;">用户角色:</label>
            <c:if test="${requestScope.maccount.role==1}">
                <label style="font-size: 20px;">
                    &nbsp;&nbsp;普通用户</label>
            </c:if>
            <c:if test="${requestScope.maccount.role==2}">
                &nbsp;&nbsp;<label style="font-size: 20px;" >商家</label>
            </c:if>
        </div>
    </div>

    <div class="col-sm-8" style="padding-top: 0px;padding-left: 240px">
        <div class="form-group" style="padding-left: 350px;">
            <input type="hidden" name="id" value="${requestScope.maccount.id}"/>
            <input type="button" onclick="submitform();" class="sgBtn" value="确定修改"/>
        </div>
    </div>
</form>

</body>
</html>
