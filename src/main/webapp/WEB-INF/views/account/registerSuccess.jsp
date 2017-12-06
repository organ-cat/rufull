<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/12/5
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>注册成功</title>
</head>
<body>
<h1>Register Success</h1>
${account.username}<br/>
${account.phone}<br/>
${account.email}<br/>
</body>
</html>
