<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>用户列表</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.form.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>
    <script type="text/javascript">
        function getAccount(id) {
            window.location.href = "${pageContext.request.contextPath}/manageAcc/getAccount?id=" + id;
        }
        function delAccount(id) {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要删除吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    window.location.href = "${pageContext.request.contextPath}/manageAcc/delaccount?id=" + id;
                });
        }
        function redelAccount(id) {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要恢复吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    window.location.href = "${pageContext.request.contextPath}/manageAcc/redelaccount?id=" + id;
                });
        }

        var logerror = "${logerror}";
        var delAccerror = "${delAccerror}";
        var delAccsuccess = "${delAccsuccess}";
        var redelAccerror = "${redelAccerror}";
        var redelAccsuccess = "${redelAccsuccess}";
        var updateAccsuccess = "${updateAccsuccess}";

    </script>
    <script src="${pageContext.request.contextPath}/js/system/myaccalert.js"></script>


</head>
<body>

<div class="col-sm-12" style="padding-top: 80px;" align="center">
    <div style="height: 360px;">
    <div class="panel panel-default" >

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-right: 50%px">
            <h4>用户列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>用户姓名</th>
                <th>用户昵称</th>
                <th>手机号码</th>
                <th>邮箱</th>
                <th>注册时间</th>
                <th>角色</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${allalist}" var="list">
                <tr>
                    <td>${list.username}</td>
                    <td>${list.nickname}</td>
                    <td>${list.phone}</td>
                    <td>${list.email}</td>
                    <td><fmt:formatDate value="${list.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:if test="${list.role=='1'}">
                        <td>用户</td>
                    </c:if>
                    <c:if test="${list.role=='2'}">
                        <td>商家</td>
                    </c:if>

                    <td align="center">
                        <c:if test="${list.role==1}">
                            <input type="button" class="btn btn-primary" value="修改"
                                   onclick="getAccount(${list.id});"/>
                            <c:if test="${list.status=='100'}">
                                <input type="button" class="btn btn-danger" value="删除"
                                       onclick="delAccount(${list.id});"/>
                            </c:if>
                            <c:if test="${list.status=='0'}">
                                <input type="button" class="btn btn-warning" value="恢复"
                                       onclick="redelAccount(${list.id});"/>
                            </c:if>
                        </c:if>
                        <c:if test="${list.role==2}">
                            <input type="button" class="btn btn-primary" value="商家资料修改"
                                   onclick="getAccount(${list.id});"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
    </div>
    <div class="pageDiv">
        <%@include file="../adminPage.jsp" %>
    </div>
</div>
</body>
</html>
