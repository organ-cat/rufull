<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/12/16
  Time: 17:04
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
    <title>投诉</title>
    <spring:url value="/resources/css/account/complaint.css" var="complaint_css_url"/>
    <link rel="stylesheet" type="text/css" href="${complaint_css_url}"/>
    <spring:url value="/resources/js/account/complaint.js" var="complaint_js_url"/>
    <script src="${complaint_js_url}" type="text/javascript"></script>
</head>

<body>
<div class="complaint-title">
    <p style="font-size: 35px;color: #0c9efc;margin-top: 35px;">对商家不满意？那就投诉吧</p>
    <hr>
</div>
<div class="all">
    <div class="complaint">
        <form action="${pageContext.request.contextPath}/complaint/addComplaint" method="post" enctype="multipart/form-data">
            <p>
                商店：<b>${shop.shopName}</b>
            </p>
            <br/>
            <p>投诉原因</p>
            <P>
                <input id="reason1" type="radio" value="1" checked="checked" name="type"/>
                <label for="reason1">商店确认接单，没有送餐</label>
            </P>
            <P>
                <input id="reason2" type="radio" value="2" name="type"/>
                <label for="reason2">商店存在卫生安全问题</label>
            </P>
            <P>
                <input id="reason3" type="radio" value="3" name="type"/>
                <label for="reason3">其他</label>
            </P>
            <br/>
            <p>投诉内容</p>
            <P>
                <textarea id="content"  name="content"></textarea>
            </P>
            <P>
                <input id="evidence" name="evidence" type="file" onchange="imgPreview(this)"/>
            </P>
            <img id="preview" alt="投诉图片" style="width: auto;height: 180px;">
            <p>
                <input name="accountId"type="hidden" value="${account.id}">
                <input name="shopId" type="hidden"  value="${shop.id}"/>
            </p>
            <input id="submit" type="submit" value="投诉"/>
        </form>
    </div>
</div>
</body>
</html>
