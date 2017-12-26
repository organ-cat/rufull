<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/11/29
  Time: 12:14
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
    <title>提示</title>
    <spring:url value="/resources/css/account/nologin.css" var="nologin_css_url"/>
    <link rel="stylesheet" type="text/css" href="${nologin_css_url}"/>
    <spring:url value="/resources/image/account/nologin.jpg" var="nologin_url"/>
    <spring:url value="/" var="index_url"/>
</head>
<body>
    <div class="nologin">
        <img class="image" src="${nologin_url}"><br/><br/>
        <h2>提示：您还没有登陆！</h2><br/><br/>
        <a href="${index_url}">回到首页登陆or注册</a>
    </div>
</body>
</html>
