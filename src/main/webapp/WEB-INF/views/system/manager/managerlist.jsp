<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>管理员列表</title>
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
        function getManager(id) {
            window.location.href="${pageContext.request.contextPath}/manager/getManager?id="+id;
        }
        function delManager(id) {
            window.location.href="${pageContext.request.contextPath}/manager/delManager?id="+id;
        }
        function redelManager(id) {
            window.location.href="${pageContext.request.contextPath}/manager/redelManager?id="+id;
        }
        function findManager() {
            document.findManager.submit();
        }

    </script>

</head>
<body>
<form class="form-inline" name="findManager" action="${pageContext.request.contextPath}/manager/findbycondition" method="post">
    <div class="col-sm-8">
    <div class="form-group" style="padding-left: 40%;padding-top: 50px;padding-bottom: 10px;">

            <input type="text"  class="form-control input-lg"
                 id="findname"  name="findname" style="min-width: 350px;max-width: 350px;" placeholder="请填写查找条件">
        <button type="submit" style="max-width: 150px;"
                class="btn btn-lg" onclick="findManager();">查找</button>
    </div>
    </div>
</form>
<div class="col-sm-12">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 50%">
            <h4>管理员列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>管理员姓名</th>
                <th>手机号码</th>
                <th>邮箱</th>
                <th>加入时间</th>
                <th>角色</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${allmlist}" var="list">
                <tr>
                    <td>${list.username}</td>
                    <td>${list.phone}</td>
                    <td>${list.email}</td>
                    <td><fmt:formatDate value="${list.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:if test="${list.role=='1'}">
                        <td>超级管理员</td>
                    </c:if>
                    <c:if test="${list.role=='2'}">
                        <td>管理员</td>
                    </c:if>
                    <c:if test="${list.status=='1'}">
                        <td>正常使用</td>
                    </c:if>
                    <c:if test="${list.status=='0'}">
                        <td>已删除</td>
                    </c:if>
                    <td align="center">
                        <c:if test="${sessionScope.manager.role=='1'}">
                        <c:if test="${list.role!='1'}">
                        <input type="button" class="btn btn-primary" value="修改"
                               onclick="getManager(${list.id});"/>
                            <c:if test="${list.status=='1'}">
                                <input type="button" class="btn btn-danger" value="删除"
                                       onclick="delManager(${list.id});"/>
                            </c:if>
                            <c:if test="${list.status=='0'}">
                                <input type="button" class="btn btn-warning" value="恢复"
                                       onclick="redelManager(${list.id});"/>
                            </c:if>

                        </c:if>
                        <c:if test="${list.role=='1'}">
                                没有权限
                        </c:if>
                    </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
