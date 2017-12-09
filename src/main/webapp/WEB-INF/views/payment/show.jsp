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

    <title>饱了么收银台</title>

    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order" var="showOrderUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="#" var="showCooperationUrl"/>
    <spring:url value="#" var="showAgreementUrl"/>
    <spring:url value="#" var="showProfileUrl"/>
    <spring:url value="/favor" var="showFavorUrl"/>
    <spring:url value="/address" var="showAddressUrl"/>
    <spring:url value="/security" var="showSecurityUrl"/>
    <spring:url value="/logout" var="logoutUrl"/>
    <spring:url value="/place" var="showPlaceUrl"/>
    <spring:url value="/home" var="homeUrl"/>
    <spring:url value="/balance" var="showBalanceUrl"/>
    <spring:url value="/info" var="showInfoUrl"/>
    <spring:url value="/security/changepassword" var="changePasswordUrl"/>
    <spring:url value="/shop" var="showShopUrl"/>
    <spring:url value="/rate?form" var="addEvaluationUrl"/>
    <spring:url value="/favor" var="addFavorUrl"/>
    <spring:url value="/complaint?from" var="addComplaintUrl"/>
    <spring:url value="/payment" var="showPaymentUrl"/>
    <spring:url value="/order/cancel" var="cancelOrderUrl"/>
    <spring:url value="/upload/business" var="showShopPhotoUrl"/>
    <spring:url value="/order/refund" var="refundOrderUrl"/>
    <spring:url value="/order/urge" var="urgeOrderUrl"/>
    <spring:url value="/order/cancelRefund" var="cancelRefundOrderUrl"/>
    <spring:url value="/order/confirm" var="confirmOrderUrl"/>
    <spring:url value="/payment/process" var="toPayUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#orderPaymentBtn').click(function () {
                $('#orderPaymentForm').submit();
            });
        });
</script>
</head>
<body class="payment">
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
                <p class="navbar-text">收银台</p>
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-sm hidden-md"><a href="${showAgreementUrl}">规则中心</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${account.nickname}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${showProfileUrl}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>个人中心</a></li>
                            <li><a href="${showCartUrl}"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>购物车</a></li>
                            <li><a href="${showFavorUrl}"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>我的收藏</a></li>
                            <li><a href="${showAddressUrl}"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>我的地址</a></li>
                            <li><a href="${showSecurityUrl}"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 安全设置</a></li>
                            <li class="divider" role="separator"></li>
                            <li><a href="${logoutUrl}"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- 主界面 -->
    <div id="main">
        <div class="container">
            <div class="row payment-part">
                <div class="col-md-12">
                    <div class="page-header">
                        <h1><small>订单详情</small></h1>
                    </div>
                    <div class="row text-muted">
                        <div class="col-md-10">
                            <p>${order.shop.shopName}外卖订单</p>
                            <p>${order.address.receiver} ${order.address.phone} ${order.address.detail}</p>
                            <c:forEach var="item" items="${order.lineItems}">
                                <p>${item.productName} ×${item.quantity}</p>
                            </c:forEach>
                        </div>
                        <div class="col-md-2">
                            支付金额: <span class="h3 text-warning">¥${order.total}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row payment-part">
                <div class="col-md-12">
                    <div class="page-header">
                        <span class="h3"><strong>请选择支付方式</strong></span>
                        <span class="text-muted">剩余支付时间</span>
                        <span class="text-warning">4分48秒</span>
                        <span class="text-muted">，逾期订单将自动取消</span>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-muted">
                            <h4>支付金额: <span class="text-warning">¥${order.total}</span></h4>
                            <div class="btn-group" data-toggle="buttons">
                                <c:if test="${'ONLINE' == order.paymentMethod}">
                                    <label class="btn btn-default payment-method-btn">
                                        <input type="radio" checked>
                                        易宝
                                    </label>
                                    <label class="btn btn-default payment-method-btn">
                                        <input type="radio">
                                        支付宝
                                    </label>
                                </c:if>
                                <c:if test="${'OFFLINE' == order.paymentMethod}">
                                    <label class="btn btn-default payment-method-btn">
                                        <input class="disabled" type="radio" checked>
                                        货到付款
                                    </label>
                                </c:if>
                            </div>
                            <hr>
                        </div>
                        <div class="col-md-12">
                            <button id="orderPaymentBtn" type="button" class="btn btn-lg btn-danger payment-confirm-btn">确认支付</button>
                        </div>
                        <form:form id="orderPaymentForm" action="${toPayUrl}/${order.id}">
                            <input type="hidden" name="pd_FrpId" value="CCB-NET">
                            <input type="hidden" name="total" value="${order.total}">
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
