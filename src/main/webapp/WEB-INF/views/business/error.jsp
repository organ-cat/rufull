<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- bootstrap css -->
    <spring:url value="/resources/css/bootstrap.css" var="bootstrap_css_url"/>
    <link rel="stylesheet" href="${bootstrap_css_url}"/>

    <!-- normalize css -->
    <spring:url value="/resources/css/style.css" var="normalize_css_url"/>
    <link rel="stylesheet" href="${normalize_css_url}"/>

    <!-- app css -->
    <spring:url value="/resources/css/style.css" var="app_css_url"/>
    <link rel="stylesheet" type="text/css" href="${app_css_url}"/>

    <!-- jquery -->
    <spring:url value="/resources/js/jquery-1.12.4.js" var="jquery_url"/>
    <script src="${jquery_url}" type="text/javascript"></script>

    <!-- bootstrap js -->
    <spring:url value="/resources/js/bootstrap.js" var="bootstrap_js_url"/>
    <script src="${bootstrap_js_url}" type="text/javascript"></script>

    <title>个人中心_订单错误页面|饱了么网上订餐</title>

    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order" var="showOrderUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="/business/joinBusiness" var="showCooperationUrl"/>
    <spring:url value="/service/getAgreement" var="showAgreementUrl"/>
    <spring:url value="/account/center" var="showProfileUrl"/>
    <spring:url value="/favor/myFavor" var="showFavorUrl"/>
    <spring:url value="/account/center" var="footprintUrl"/>
    <spring:url value="/address/addressManage" var="showAddressUrl"/>
    <spring:url value="/account/security" var="showSecurityUrl"/>
    <spring:url value="/account/logout" var="logoutUrl"/>
    <spring:url value="/place" var="showPlaceUrl"/>
    <spring:url value="/home" var="homeUrl"/>
    <spring:url value="/balance" var="showBalanceUrl"/>
    <spring:url value="/info" var="showInfoUrl"/>
    <spring:url value="/security/changepassword" var="changePasswordUrl"/>
    <spring:url value="/shop/showShopDetail" var="showShopUrl"/>
    <spring:url value="/evaluation" var="addEvaluationUrl"/>
    <spring:url value="/favor" var="addFavorUrl"/>
    <spring:url value="/complaint?from" var="addComplaintUrl"/>
    <spring:url value="/payment" var="showPaymentUrl"/>
    <spring:url value="/order/cancel" var="cancelOrderUrl"/>
    <spring:url value="/upload/shop" var="showShopPhotoUrl"/>
    <spring:url value="/order/refund" var="refundOrderUrl"/>
    <spring:url value="/order/urge" var="urgeOrderUrl"/>
    <spring:url value="/order/cancelRefund" var="cancelRefundOrderUrl"/>
    <spring:url value="/order/confirm" var="confirmOrderUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${rootUrl}"><img class="img-responsive center-block" alt="饱了么" src=""></a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="hidden-sm hidden-md"><a href="${rootUrl}">首页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/business/showBusinessProfile">商家中心</a></li>
                <li><a href="${showCooperationUrl}">加盟合作</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-sm hidden-md"><a href="${showAgreementUrl}">规则中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${account.username}<span class="caret"></span></a>
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
                        <li><a href="${pageContext.request.contextPath}/account/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 主界面 -->
<div id="main">
    <div class="container-fluid">
        <!-- 路径导航 -->
        <div class="container-fluid">
            <ol class="breadcrumb">
                <li>商家错误</li>
            </ol>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item "><strong><span class="glyphicon glyphicon-home"
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
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <c:if test="${shop != null}">
                            <li class="list-group-item"><a class="text-muted"
                                                           href="${pageContext.request.contextPath}/business/showAccountAndShopInfo">个人资料</a>
                            </li>
                        </c:if>
                        <li class="list-group-item list-group-item-info"><a class="text-muted"
                                                                            href="${pageContext.request.contextPath}/business/showBusinessSettleInfo">入驻资料</a>
                        </li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="page-header">
                        <h1><small>商家错误页面</small></h1>
                    </div>
                    <div class="container-fluid" id="content">
                        <p>Failed URL: ${url}</p>
                        <p>Exception's Message: ${exception.message}</p>
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
</html>
