<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/11/30
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="apple-touch-icon-precomposed" href="">

    <link href="../css/service/bootstrap.css" rel="stylesheet"/>
    <link href="../css/service/pagevendor.css" rel="stylesheet">

    <link href="../css/service/pagemain.css" rel="stylesheet">
    <link href="../css/service/login-register.css" rel="stylesheet"/>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="../js/service/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="../css/service/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="../js/service/login-register.js" type="text/javascript"></script>
</head>
<body>
    <%--<h1>Ajax</h1><br/>--%>
    <%--<form method="post">--%>
        <%--用户名：<input type="text" name="username"><br/>--%>
        <%--<div id="message"></div>--%>
        <%--<input type="submit" value="submit">--%>
    <%--</form>--%>

    <%--<br/>--%>
    <%--session: ${sessionScope.code}--%>
    <%--request:${requestScope.code} <br/>--%>
    <%--<br/>--%>
    <%--session: ${sessionScope.bbbb}--%>
    <%--request:${requestScope.bbbb} <br/>--%>
    <%--<a href="${pageContext.request.contextPath}/test/test">哈哈哈哈</a>--%>


    <%--<h1>使用spring mvc提供的类的方法上传文件</h1><br/>--%>
    <%--<form method="post" enctype="multipart/form-data" action="<c:url value="/test/upload"/>">--%>
        <%--<input type="file" name="photo">--%>
        <%--<input type="submit" value="upload"/>--%>
    <%--</form>--%>

    <%--<img src="http://localhost:8080/rufull/upload/account/${account.photo}">--%>

    <a href=" "   data-bidding="" target="_blank" class="rstblock">
        <div class="rstblock-logo">
            <img src="${pageContext.request.contextPath}/upload/account/${shop.shopPhoto}"
                 width="70" height="70" alt="${shop.shopName}" class="rstblock-logo-icon">
            <span class="rstblock-left-timeout">${shop.shippingTime}+分钟</span>
        </div>
        <div class="rstblock-content">
            <div class="rstblock-title">${shop.shopName}</div>
            <div class="rating-star r8"></div>
            <span class="rstblock-monthsales">月售100+</span>
            <div class="rstblock-cost">￥${shop.shippingFee}</div>
        </div>
    </a>

</body>
</html>
