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
    <h3>请认真阅读入驻规则后填写入驻信息！！！</h3>

    <p>
        <a href="http://localhost:8080/rufull/business/addBusinessUI" class="btn btn-primary" role="button">点击这里跳转至入驻页面</a>
    </p>
    <span class="text-primary" id="successText"></span>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/addBusinesstimeout.js"></script>


</html>
