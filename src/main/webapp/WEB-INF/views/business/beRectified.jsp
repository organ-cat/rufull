<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/11
  Time: 0:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>等待审核</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/style.css">

</head>
<body>

<div class="jumbotron bg_forward">
    <h3>停业整顿或删除！请联系客服:8000 000</h3>

    <p>
        <a href="/rufull" class="btn btn-primary" role="button">点击这里跳转至首页</a>
    </p>
    <span class="text-primary" id="successText"></span>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/timeout.js"></script>


</html>
