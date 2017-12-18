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
    <title>已经处理成功的投诉</title>
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
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <script type="text/javascript">
        $(function () {
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
        function getCompdetail(id) {
            window.location.href = "${pageContext.request.contextPath}/ManageCom/getCompdetail?id=" + id;
        }
        function findcompSu() {
            document.findcomp.submit();
        }

        var timeerror = "${timeerror}";
        if(timeerror!= '')
        {
            window.onload = function() {
                swal("操作失败", "开始时间不能大于结束时间!", "error");
            };
        }

    </script>
</head>
<body>
<form class="form-inline" name="findcomp" action="${pageContext.request.contextPath}/ManageCom/checkComp"
      method="post">
    <div class="col-sm-12">
        <div class="form-group" style="padding-left: 20%;padding-top: 20px;">

            <input type="text" class="form-control input-lg" id="begin" readonly="readonly"
                   name="beginTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入开始时间">----
            <input type="text" class="form-control input-lg" id="end" readonly="readonly"
                   name="endTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入结束时间">&nbsp;&nbsp;
            <input type="text" class="form-control input-lg"
                   id="findname" name="keyword" style="min-width: 200px;max-width: 200px;" placeholder="请填写查找条件">
            &nbsp;&nbsp;<button type="button" style="max-width: 150px;"
                                class="btn btn-lg" onclick="findcompSu();">查找
        </button>

        </div>
    </div>
</form>
<div class="col-sm-12" style="padding:40px;">

    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>已处理投诉列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>投诉类型</th>
                <th>投诉内容</th>
                <th>投诉时间</th>
                <th>处理结果</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${managecomp}" var="list">
                <tr>
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
                    <c:if test="${list.result==1}">
                        <td>情况属实</td>
                    </c:if>
                    <c:if test="${list.result==2}">
                        <td>情况作假</td>
                    </c:if>
                    <td align="center">
                        <input type="button" class="btn btn-primary" value="详情"
                               onclick="getCompdetail(${list.id});"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
