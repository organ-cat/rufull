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
    <script type="text/javascript">
        $(function () {
            $(":input[name='username']").change(function () {
                var val = $(this).val();
                val = $.trim(val);
                if(val != "") {
                    var url = "${pageContext.request.contextPath}/test/ajax";
                    var args = {"username":val,"time":new Date()};

                    $.post(url,args, function (data) {
                        $("#message").html(data);
                    });
                }
            })
        });
    </script>
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


    <h1>使用spring mvc提供的类的方法上传文件</h1><br/>
    <form method="post" enctype="multipart/form-data" action="<c:url value="/test/upload"/>">
        <input type="file" name="photo">
        <input type="submit" value="upload"/>
    </form>

    <img src="http://localhost:8080/rufull/upload/account/${account.photo}">

</body>
</html>
