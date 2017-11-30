<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/11/30
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>check_log</title>
</head>
<body>
<form action="${pageContext.request.contextPath }/managerlog/deleteByIds.do" method="post">
    查询条件：
    <table width="100%" border=1>
        <tr>
            <td><input type="submit" value="查询"/></td>
            <td><input type="submit" value="批量删除"/></td>
        </tr>
    </table>
    管理日志列表：
    <table width="100%" border=1>
        <tr>
            <td></td>
            <td>日志编号</td>
            <td>日志内容</td>
            <td>日志时间</td>
            <td>日志相关者</td>
            <td>日志登记员</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${list }" var="mlog">
            <tr>
                <td>
                    <input type="checkbox" name="id" value="${mlog.id }">
                </td>
                <td>${mlog.id }</td>
                <td>${mlog.detail }</td>
                <td><fmt:formatDate value="${mlog.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>${mlog.account.username }</td>
                <td>${mlog.manager.username }</td>
                <td><a href="${pageContext.request.contextPath }/managelog/edit.do?id=${mlog.id}">修改</a>
                    <a href="${pageContext.request.contextPath }/managelog/deleteByID.do?id=${mlog.id}">删除</a>
                </td>
            </tr>
        </c:forEach>

    </table>
</form>
</body>
</html>
