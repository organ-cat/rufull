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
    <!-- bootstrap js -->
    <spring:url value="/resources/js/account/complaint.js" var="complaint_js_url"/>
    <script src="${complaint_js_url}" type="text/javascript"></script>
</head>
    <div class="complaint">
        <form action="${pageContext.request.contextPath}/complaint/addComplaint" method="post" enctype="multipart/form-data">
            <p>
                商家名：<input type="text" name="shopId" value="${shop.id}"/>
            </p>
            <p>
                商店名称：${shop.shopName}
            </p>
            <p>投诉原因</p>
            <P>
                <input id="reason1" type="radio" value="0" name="type"/>
                <label for="reason1">商店确认接单，没有送餐</label>
            </P>
            <P>
                <input id="reason2" type="radio" value="0" name="type"/>
                <label for="reason2">商店存在卫生安全问题</label>
            </P>
            <P>
                <input id="reason3" type="radio" value="0" name="type"/>
                <label for="reason3">其他</label>
            </P>
            <p>投诉内容</p>
            <P>
                <input name="content"/>
            </P>
            <P>
                <input name="evidence" type="file"/>
            </P>
            <p>
                <input name="accountId" value="${account.id}">
            </p>
            <input type="submit" value="投诉"/>
        </form>
    </div>
<body>
<div>

</div>
</body>
</html>
