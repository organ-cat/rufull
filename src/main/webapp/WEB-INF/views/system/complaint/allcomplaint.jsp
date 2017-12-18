<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 0:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>投诉列表获取</title>
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
        var logerror = "${logerror}";
        var getacccomperror = "${getacccomperror}";
        var replysuccess = "${replysuccess}";
        var replyallsuccess = "${replyallsuccess}";
        var replyallerror = "${replyallerror}";
        var timeerror = "${timeerror}";

        var isCheckAll = false;
        function swapCheck() {
            if (isCheckAll) {
                $("input[type='checkbox']").each(function () {
                    this.checked = false;
                });
                isCheckAll = false;
            } else {
                $("input[type='checkbox']").each(function () {
                    this.checked = true;
                });
                isCheckAll = true;
            }
        }


        function getComp(id) {
            window.location.href = "${pageContext.request.contextPath}/ManageCom/getAccComp?id=" + id;
        }
        function completeAll() {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要一键否决吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    var str = document.getElementsByName("id");
                    var obj = str.length;
                    var ids = new Array();
                    for (var i = 0; i < obj; i++) {
                        if (str[i].checked == true) {
                            ids[i] = str[i].value;
                        }
                    }
                    window.location.href = "${pageContext.request.contextPath}/ManageCom/replyAllComp?result=1&id=" + ids;
                });
        }

        function CancelAll() {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要一键审核吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    var str = document.getElementsByName("id");
                    var obj = str.length;
                    var ids = new Array();
                    for (var i = 0; i < obj; i++) {
                        if (str[i].checked == true) {
                            ids[i] = str[i].value;
                        }
                    }
                    window.location.href = "${pageContext.request.contextPath}/ManageCom/replyAllComp?result=2&id=" + ids;
                });
        }
    </script>
    <script src="${pageContext.request.contextPath}/js/system/mycompalert.js"></script>
</head>
<body>

<div class="col-sm-12" style="padding:80px;">
    <div class="col-sm-4">
        <tr>
            <td><input type="checkbox" onclick="swapCheck()"/>&nbsp;&nbsp;全选&nbsp;&nbsp;</td>
            <td><input type="button" class="btn btn-primary" onclick="completeAll();" value="一键处理"/></td>&nbsp;&nbsp;&nbsp;
            <td><input type="button" class="btn btn-warning" onclick="CancelAll()" value="一键取消"/></td>
        </tr>
    </div>
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>用户投诉列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>投诉发起者</th>
                <th>被投诉商店名</th>
                <th>投诉类型</th>
                <th>投诉内容</th>
                <th>投诉时间</th>
                <th>处理状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${managecomp}" var="list">
                <tr>
                    <td><input type="checkbox" class="checkbox" name="id" value="${list.id }"></td>
                    <td>${list.account.username}</td>
                    <td>${list.shop.shopName}</td>
                    <c:if test="${list.type==1}">
                        <td>商家已接单但未送餐</td>
                    </c:if>
                    <c:if test="${list.type==2}">
                        <td>商家美食存在卫生问题</td>
                    </c:if>
                    <c:if test="${list.type==3}">
                        <td>其他类型</td>
                    </c:if>
                    <td>${list.content}</td>
                    <td><fmt:formatDate value="${list.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:if test="${list.status==1}">
                        <td>未审核</td>
                    </c:if>
                    <c:if test="${list.status==2}">
                        <td>处理中</td>
                    </c:if>
                    <td align="center">
                        <input type="button" class="btn btn-primary" value="审核"
                               onclick="getComp(${list.id});"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
