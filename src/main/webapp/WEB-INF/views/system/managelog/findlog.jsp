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
    <%--时间控件--%>
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <script type="text/javascript">

        $(function() {
            $(document).ready(function () {
                lay('#version').html('-v' + laydate.v);
                laydate.render({
                    elem: '#end'
                    , type: 'datetime'
                });
                laydate.render({
                    elem: '#begin'
                    , type: 'datetime'
                });

            });
        });
        function findLog() {
            document.findLog.submit();
        }
    </script>
</head>

<body>

<form class="form-inline" name="findLog" action="${pageContext.request.contextPath}/manageLog/checkLogs"
      method="post">
    <div class="col-sm-12">
        <div class="form-group" style="padding-left: 20%;padding-top: 20px;padding-bottom: 20px;">

            <input  type="text" class="form-control input-lg" id="begin"
                    name="beginTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入开始时间">----
            <input type="text" class="form-control input-lg" id="end"
                   name="endTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入结束时间">&nbsp;&nbsp;
            <input type="text" class="form-control input-lg"
                   id="findname" name="keyword" style="min-width: 200px;max-width: 200px;" placeholder="请填写查找条件">
            &nbsp;&nbsp;<button type="submit" style="max-width: 150px;"
                                class="btn btn-lg" onclick="findLog();">查找
        </button>

        </div>
    </div>
</form>



<div class="col-sm-12" style="padding:20px 80px 20px 80px;">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>用户管理日志列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>日志内容</th>
                <th>登记时间</th>
                <th>用户姓名</th>
                <th>用户角色</th>
                <th>登记者</th>
                <th>登记者角色</th>
            </tr>
            <c:forEach items="${Logslist}" var="list">
                <tr>
                    <td>${list.detail}</td>
                    <td><fmt:formatDate value="${list.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <c:if test="${list.account.id!=null}">
                        <td>${list.account.username}</td>
                    </c:if>
                    <c:if test="${list.account.id==null}">
                        <td>无</td>
                    </c:if>
                    <c:if test="${list.account.id!=null}">
                    <c:if test="${list.account.role=='1'}">
                        <td>普通用户</td>
                    </c:if>
                    <c:if test="${list.account.role=='2'}">
                        <td>商家</td>
                    </c:if>
                    </c:if>
                    <c:if test="${list.account.id==null}">
                        <td>无</td>
                    </c:if>

                    <td>${list.manager.username}</td>
                    <c:if test="${list.manager.role=='1'}">
                        <td>超级管理员</td>
                    </c:if>
                    <c:if test="${list.manager.role=='2'}">
                        <td>管理员</td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
