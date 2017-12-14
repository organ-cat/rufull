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
                function findallorders() {
                    document.findorder.submit();
                }
            });
        });
        function getdetail(id) {
            window.location.href = "${pageContext.request.contextPath}/ordermanage/getOrder?id=" + id;
        }
    </script>
</head>

<body>

<form class="form-inline" name="findorder" action="${pageContext.request.contextPath}/ordermanage/getOrdersbycondition"
      method="post">
    <div class="col-sm-12">
        <div class="form-group" style="padding-left: 20%;padding-top: 20px;padding-bottom: 20px;">

            <input  type="text" class="form-control input-lg" id="begin"
                    name="beginTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入开始时间">----
            <input type="text" class="form-control input-lg" id="end"
                   name="endTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入结束时间">&nbsp;&nbsp;

            &nbsp;&nbsp;<button type="submit" style="max-width: 150px;"
                                class="btn btn-lg" onclick="findallorders();">查找
        </button>

        </div>
    </div>
</form>


<div class="col-sm-12" style="padding:20px 80px 20px 80px;">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 40%">
            <h4>订单列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>订单号</th>
                <th>创建时间</th>
                <th>商店名称</th>
                <th>支付方式</th>
                <th>订单总额</th>
                <th>订单状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${morderlist}" var="list">
                <tr>
                    <td>${list.orderNumber}</td>
                    <td><fmt:formatDate value="${list.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${list.shop.shopName}</td>
                    <c:if test="${list.paymentMethod=='ONLINE'}">
                        <td>在线支付</td>
                    </c:if>
                    <c:if test="${list.paymentMethod=='OFFLINE'}">
                        <td>货到付款</td>
                    </c:if>
                    <td>${list.total}</td>
                    <c:if test="${list.status=='UNPAID'}">
                        <td>未付款</td>
                    </c:if>
                    <c:if test="${list.status=='PAID'}">
                        <td>已付款</td>
                    </c:if>
                    <c:if test="${list.status=='CANCELED'}">
                        <td>已取消</td>
                    </c:if>
                    <c:if test="${list.status=='ACCEPTED'}">
                        <td>已接单</td>
                    </c:if>
                    <c:if test="${list.status=='DELIVERY'}">
                        <td>运送中</td>
                    </c:if>
                    <c:if test="${list.status=='COMPLETED'}">
                        <td>已完成</td>
                    </c:if>
                    <c:if test="${list.status=='AUDITING'}">
                        <td>审核中</td>
                    </c:if>
                    <c:if test="${list.status=='UNCOMPLETED'}">
                        <td>未完成</td>
                    </c:if>
                    <c:if test="${list.status=='EVALUATED'}">
                        <td>已评价</td>
                    </c:if>
                    <td>
                        <input type="button" class="btn btn-primary" value="查看详情"
                               onclick="getdetail(${list.id});"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
