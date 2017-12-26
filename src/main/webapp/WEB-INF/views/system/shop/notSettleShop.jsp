<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>查看正在申请入驻的商家</title>
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

</head>
<script>
    function examineShop(id) {
        window.location.href="${pageContext.request.contextPath}/manageShop/getBusiness?id="+id;
    }
    var logerror = "${logerror}";
    var examsuccess = "${examsuccess}";
    var npexamsuccess = "${npexamsuccess}";

    if(logerror!='') {
        window.onload = function() {
            swal("操作失败", "插入日志出错!", "error");
        };
    }
    if(examsuccess!='') {
        window.onload = function() {
            swal("操作成功", "审核商家成功!", "success");
        };
    }
    if(npexamsuccess!='') {
        window.onload = function() {
            swal("操作成功", "审核商家成功!", "success");
        };
    }

</script>

<body>
<div class="col-sm-12" style="padding: 50px" align="center">
    <div  style="height: 360px">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;">
            <h4>商家申请列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>用户姓名</th>
                <th>用户昵称</th>
                <th>手机号码</th>
                <th>邮箱</th>
                <th>身份证号</th>
                <th>注册时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${notSettleShop}" var="list">
                <tr>
                    <td>${list.account.username}</td>
                    <td>${list.account.nickname}</td>
                    <td>${list.account.phone}</td>
                    <td>${list.account.email}</td>
                    <td>${list.identifier}</td>
                    <td><fmt:formatDate value="${list.account.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td align="center">
                            <input type="button" class="btn btn-primary" value="进行审核"
                                   onclick="examineShop(${list.id});"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    <%--<div class="pageDiv">
        <%@include file="../adminPage.jsp" %>
    </div>--%>
</div>
</body>
</html>
