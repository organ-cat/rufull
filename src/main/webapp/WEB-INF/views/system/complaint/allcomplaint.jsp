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
    <title>用户日志获取</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/indexJs.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/xcConfirm.css"/>
    <script src="${pageContext.request.contextPath}/js/system/xcConfirm.js" type="text/javascript"
            charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/system/promptbox.js" type="text/javascript"
            charset="utf-8"></script>
    <script type="text/javascript">
        var isCheckAll = false;
        function swapCheck() {
            if (isCheckAll) {
                $("input[type='checkbox']").each(function() {
                    this.checked = false;
                });
                isCheckAll = false;
            } else {
                $("input[type='checkbox']").each(function() {
                    this.checked = true;
                });
                isCheckAll = true;
            }
        }
        function getComp(id) {
            window.location.href="${pageContext.request.contextPath}/ManageCom/getAccComp?id="+id;
        }
    </script>
</head>
<body>

<div class="col-sm-12" style="padding:80px;">
    <div class="col-sm-4">
        <tr>
            <td><input type="checkbox" onclick="swapCheck()"/>&nbsp;&nbsp;全选&nbsp;&nbsp;</td>
            <td><input type="button" class="btn btn-primary" value="一键处理"/></td>&nbsp;&nbsp;&nbsp;
            <td><input type="button" class="btn btn-warning" value="一键取消"/></td>
        </tr>
    </div>
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>用户投诉列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>ID</th>
                <th>投诉类型</th>
                <th>投诉内容</th>
                <th>投诉时间</th>
                <th>处理状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${managecomp}" var="list">
                <tr>
                    <td><input type="checkbox" class="checkbox" name="id" value="${item.id }"></td>
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
