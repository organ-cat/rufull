<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/12
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商家主页</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/businessInfo.css">

<body>
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img class="img-responsive center-block" alt="饱了么" src="">
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/business/showBusinessProfile">商家中心</a></li>
                <li><a href="${pageContext.request.contextPath}/business/joinBusiness">加盟合作</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/service/getAgreement">规则中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">${business.nickname} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <c:if test="${shop != null}">
                            <li><a href="${pageContext.request.contextPath}/business/showBusinessProfile"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 我的商店</a></li>
                            <li><a href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>我的订单</a></li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/business/showBusinessSettleInfo"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 入驻资料</a>
                        </li>
                        <c:if test="${shop != null}">
                            <li><a href="${pageContext.request.contextPath}/business/showAccountAndShopInfo"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>个人资料</a></li>
                        </c:if>
                        <li class="divider" role="separator"></li>
                        <li><a href="${pageContext.request.contextPath}/business/loginOut"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 主界面 -->
<div id="main">
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group text-center">

                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-home"
                                                                      aria-hidden="true"></span>商家商店</strong></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showBusinessProfile">我的商店</a></li>
                        <c:if test="${shop != null}">
                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list"
                                                                      aria-hidden="true"></span>商家订单</strong></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID">未接订单</a></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=ACCEPTED">已接订单</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=AUDITING">退单记录</a></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=COMPLETED">完成订单</a></li>
                        </c:if>
                        <li class="list-group-item list-group-item-info"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <c:if test="${shop != null}">
                            <li class="list-group-item"><a class="text-muted"
                                                           href="${pageContext.request.contextPath}/business/showAccountAndShopInfo">个人资料</a>
                            </li>
                        </c:if>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showBusinessSettleInfo">入驻资料</a>
                        </li>

                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10 bg-warning">
                    <div class="page-header">
                        <div class=" shoptTitle">
                            <h1><span class="label label-default">个人资料</span></h1>
                        </div>
                    </div>
                    <!-- 头像 -->
                    <div class="col-md-2">
                        <a href="#" class="photo_a">
                            <img class="businessPhoto img-circle"
                                 src="${pageContext.request.contextPath}/upload/shop/${sessionScope.shop.shopPhoto}">
                            <p>头像</p>
                        </a>
                    </div>
                    <div class="col-md-10">
                        <div class="businessInfo">
                            <h4 class="">
                                <strong class="">基础资料</strong>
                            </h4>
                        </div>
                        <div class="edit_a">
                            <a href="${pageContext.request.contextPath}/shop/updateShopUI?id=${sessionScope.shop.id}">编辑</a>
                        </div>
                        <div class="textLine">
                            <h4>姓名：
                                <small>${sessionScope.shop.business.account.nickname}</small>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>电话：
                                <small>${sessionScope.shop.business.account.phone}</small>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>邮箱：
                                <small>${sessionScope.shop.business.account.email}</small>
                            </h4>
                        </div>
                        <div class="businessInfo">
                            <h4 class="">
                                <strong class="">商店资料</strong>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>商店名：
                                <small>${sessionScope.shop.shopName}</small>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>电话：
                                <small>${sessionScope.shop.shopPhone}</small>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>地址：
                                <small>${sessionScope.shop.address}</small>
                            </h4>
                        </div>
                        <div class="textLine">
                            <h4>营业时间：
                                <small>${sessionScope.shop.operateTime}</small>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<footer class="container-fluid">
    <div class="row">
        <div class="col-md-4">
            <h3 class="text-center"><strong>用户帮助</strong></h3>
            <ul class="list-unstyled text-center">
                <li><a href="#" class="text-muted">常见问题</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h3 class="text-center"><strong>商务合作</strong></h3>
            <ul class="list-unstyled text-center">
                <li><a href="#" class="text-muted">我要开店</a></li>
                <li><a href="#" class="text-muted">加盟指南</a></li>
                <li><a href="#" class="text-muted">市场合作</a></li>
                <li><a href="#" class="text-muted">开放平台</a></li>
            </ul>
        </div>
        <div class="col-md-4">
            <h3 class="text-center"><strong>关于我们</strong></h3>
            <ul class="list-unstyled text-center">
                <li><a href="#" class="text-muted">饱了么介绍</a></li>
                <li><a href="#" class="text-muted">加入我们</a></li>
                <li><a href="#" class="text-muted">联系我们</a></li>
                <li><a href="#" class="text-muted">规则中心</a></li>
            </ul>
        </div>
    </div>
</footer>
</body>

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>
</html>