<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/12/14
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <title>找回密码</title>
    <spring:url value="/resources/css/account/forgotPassword.css" var="forgotPassword_css_url"/>
    <link rel="stylesheet" type="text/css" href="${forgotPassword_css_url}"/>
    <!-- jquery -->
    <spring:url value="/resources/js/jquery-1.12.4.js" var="jquery_url"/>
    <script src="${jquery_url}" type="text/javascript"></script>
    <spring:url value="/resources/js/account/forgotPassword.js" var="forgotPassword_url"/>
    <script src="${forgotPassword_url}" type="text/javascript"></script>
</head>
<body>
<div class="findPassword">
    <div class="inputDiverr">
        <p id="message"></p>
    </div>
    <div class="inputDiv">
        <input id="phone" type="text" name="phone" placeholder="手机/邮箱" /><br />
        <input type="password" id="newPasswrod" placeholder="新密码" /><br />
        <input type="password" id="comfirePassword" name="newPassword" placeholder="确认密码" /><br />
        <input id="checkCode" type="text" name="checkCode" placeholder="验证码" />
        <input type="button" id="getCode" value="获取验证码"/>
        <input type="button" id="confirm" value="确定"/>
    </div>
    <a class="back" href="http://localhost:8080/rufull">回到首页登陆</a>
</div>
</body>
</html>
