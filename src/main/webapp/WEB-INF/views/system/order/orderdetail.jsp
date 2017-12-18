<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>修改管理员</title>
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

    <script type="text/javascript">
        function getreturn() {
            history.go(-1);
        }
    </script>

</head>
<body>

<div class="col-sm-12" style="padding-top:30px;padding-left: 960px;">
    <div class="form-group">
        <input type="button" class="btn btn-warning" value="返回"
               onclick="getreturn();"/>
    </div>
</div>

<div class="col-sm-12" style="padding-top:30px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">订单编号：</label>
        <label style="font-size: 20px;">${morder.orderNumber}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">用户姓名：</label>
        <label style="font-size: 20px;">${orderaccount.username}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 30px;">
    <div class="form-group">
        <label style="font-size: 20px;">收货人姓名：</label>
        <label style="font-size: 20px;">${morder.address.receiver}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">收货人电话：</label>
        <label style="font-size: 20px;">${morder.address.phone}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 30px;">
    <div class="form-group">
        <label style="font-size: 20px;">收货地址：</label>
        <label style="font-size: 20px;">${morder.address.detail}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">下单时间：</label>
        <label style="font-size: 20px;">
        <fmt:formatDate value="${morder.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        </label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 30px;">
    <div class="form-group">
        <label style="font-size: 20px;">商店名称：</label>
        <label style="font-size: 20px;">${ordershop.shopName}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">商店地址：</label>
        <label style="font-size: 20px;">${ordershop.address}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 30px;">
    <div class="form-group">
        <label style="font-size: 20px;">商店电话：</label>
        <label style="font-size: 20px;">${ordershop.shopPhone}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">订单总额：</label>
        <label style="font-size: 20px;">${morder.total}</label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 30px;">
    <div class="form-group">
        <label style="font-size: 20px;">支付方式：</label>
        <label style="font-size: 20px;">
            <c:if test="${morder.paymentMethod=='ONLINE'}">
                在线支付
            </c:if>
            <c:if test="${morder.paymentMethod=='OFFLINE'}">
                货到付款
            </c:if>
        </label>
    </div>
</div>
<div class="col-sm-6" style="padding-top:20px;padding-left: 150px;">
    <div class="form-group">
        <label style="font-size: 20px;">订单状态：</label>
        <label style="font-size: 20px;">
            <td>${list.total}</td>
            <c:if test="${morder.status=='UNPAID'}">
                <td>未付款</td>
            </c:if>
            <c:if test="${morder.status=='PAID'}">
                <td>已付款</td>
            </c:if>
            <c:if test="${morder.status=='CANCELED'}">
                <td>已取消</td>
            </c:if>
            <c:if test="${morder.status=='ACCEPTED'}">
                <td>已接单</td>
            </c:if>
            <c:if test="${morder.status=='DELIVERY'}">
                <td>运送中</td>
            </c:if>
            <c:if test="${morder.status=='COMPLETED'}">
                <td>已完成</td>
            </c:if>
            <c:if test="${morder.status=='AUDITING'}">
                <td>审核中</td>
            </c:if>
            <c:if test="${morder.status=='UNCOMPLETED'}">
                <td>未完成</td>
            </c:if>
            <c:if test="${morder.status=='EVALUATED'}">
                <td>已评价</td>
            </c:if>
        </label>
    </div>
</div>


</body>
</html>



