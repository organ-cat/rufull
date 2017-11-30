<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/11/30
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>登陆页面</title>
</head>
<body>
<h1>用户登陆</h1>
<form method="post" action="<c:url value="/account/login"/>">
    <table>
        <tr>
            <td>手机：</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" name="提交"/></td>
        </tr>
    </table>
</form>
</body>
</html>