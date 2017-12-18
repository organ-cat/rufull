<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>系统日志获取</title>
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

</head>
<body>
<div class="col-sm-12" style="padding:80px;">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>系统管理日志列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>日志内容</th>
                <th>登记时间</th>
                <th>登记者</th>
                <th>登记者角色</th>
            </tr>
            <c:forEach items="${loglist}" var="list">
                <tr>
                    <td>${list.detail}</td>
                    <td><fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${list.manager.username}</td>
                    <c:if test="${list.manager.role=='1'}">
                        <td>超级管理员</td>
                    </c:if>
                    <c:if test="${list.manager.role=='2'}">
                        <td>管理员</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
