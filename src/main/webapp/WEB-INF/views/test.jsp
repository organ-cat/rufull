<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <spring:message code="name" var="helloWorld"/>
</head>
<body>
    你好
    ${helloWorld}<br/>
    ${account.username}<br/>
    ${account.password}<br/>
</body>
</html>
