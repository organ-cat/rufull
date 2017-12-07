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

    <title>个人中心_订单详情|饱了么网上订餐</title>

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
    <spring:url value="/evaluation" var="addEvaluationUrl"/>
    <spring:url value="/favor" var="addFavorUrl"/>
    <spring:url value="/complaint?from" var="addComplaintUrl"/>
    <spring:url value="/payment" var="showPaymentUrl"/>
    <spring:url value="/order/cancel" var="cancelOrderUrl"/>
    <spring:url value="/upload/business" var="showShopPhotoUrl"/>
    <spring:url value="/order/refund" var="refundOrderUrl"/>
    <spring:url value="/order/urge" var="urgeOrderUrl"/>
    <spring:url value="/order/cancelRefund" var="cancelRefundOrderUrl"/>
    <spring:url value="/order/confirm" var="confirmOrderUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>

    <script type="text/javascript">
        $(document).ready(function(e) {
//            if (window.history && window.history.pushState) {
//                $(window).on('popstate', function () {
//                    window.history.pushState('forward', null);
//                    window.history.forward(1);
//                    location.replace(document.referrer); // 刷新
//                });
//            }
//
//            window.history.pushState('forward', null); // 在IE中必须得有这两行
//            window.history.forward(1);

            $('#orderRateBtn').click(function () {
                $('#orderRateForm').submit();
            });
            $('#payBtn').click(function () {
                $('#payForm').submit();
            });
            $('#orderCancelBtn').click(function () {
                $('#orderCancelForm').submit();
            });
            $('#orderUrgeBtn').click(function () {
                $('#orderUrgeForm').submit();
            });
            $('#orderConfirmBtn').click(function () {
                $('#orderConfirmForm').submit();
            });
            $('#orderRefundBtn').click(function () {
                $('#orderRefundForm').submit();
            });
            $('#orderCancelRefundBtn').click(function () {
                $('#orderCancelRefundForm').submit();
            });
        });
    </script>
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
                    <li class="active"><a href="${showOrderUrl}">我的订单</a></li>
                    <li><a href="${showCooperationUrl}">加盟合作</a></li>
                </ul>
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
        <div class="container-fluid">
            <!-- 路径导航 -->
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li>当前位置: </li>
                    <li>
                        <a class="text-muted" href="${showPlaceUrl}/需要一组字符串不知道干嘛用的">麻章区广东海洋大学(点击后跳到附近商店列表页面)</a>
                        <a href="${homeUrl}">[切换地址]</a>
                    </li>
                    <li>近三个月订单(需要动态切换)</li>
                </ol>
            </div>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2">
                        <ul class="list-group text-center">
                            <li class="list-group-item"><strong><a class="text-muted" href="${showProfileUrl}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>个人中心</a></strong></li>
                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>我的订单</strong></li>
                            <li class="list-group-item list-group-item-info"><a class="text-muted" href="${showOrderUrl}">近三个订单</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${showUnratedOrderUrl}">待评价订单</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${showRefundOrderUrl}">退单记录</a></li>
                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-yen" aria-hidden="true"></span>我的资产</strong></li>
                            <li class="list-group-item"><a class="text-muted" href="${showBalanceUrl}">账户余额</a></li>
                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-user" aria-hidden="true"></span>我的资料</strong></li>
                            <li class="list-group-item"><a class="text-muted" href="${showInfoUrl}">个人资料</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${showAddressUrl}">地址管理</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${showSecurityUrl}">安全中心</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${changePasswordUrl}">修改密码</a></li>
                            <li class="list-group-item"><strong><a class="text-muted" href="${showFavorUrl}"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>我的收藏</a></strong></li>
                        </ul>
                    </div>
                    <!-- 显示内容 -->
                    <div class="col-md-10">
                        <div class="page-header">
                            <h1><small>订单详情(需要动态切换)</small></h1>
                        </div>
                        <div class="container-fluid" id="content">
                            <div class="row main-time-line">
                                <div class="col-md-12">
                                    <section class="main-timeline-section">
                                        <div class="conference-center-line"></div>
                                        <div class="conference-timeline-content">
                                            <div class="timeline-article">
                                                <div class="content-date">
                                                    <span>已送达</span>
                                                </div>
                                                <div class="meta-date"></div>
                                            </div>
                                            <div class="timeline-article">
                                                <div class="content-date">
                                                    <span>商家已接单</span>
                                                </div>
                                                <div class="meta-date"></div>
                                            </div>
                                            <div class="timeline-article">
                                                <div class="content-date">
                                                    <span>订单已取消</span>
                                                </div>
                                                <div class="meta-date"></div>
                                            </div>

                                            <div class="timeline-article">
                                                <div class="content-date">
                                                    <span>订单已提交</span>
                                                </div>
                                                <div class="meta-date"></div>
                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <div class="row order-status">
                                <div class="col-sm-6">
                                    <c:choose>
                                        <c:when test="${'UNPAID'.equals(order.status)}">
                                            <h4>等待支付</h4>
                                            <p class="text-muted">逾期未支付订单将自动取消</p>
                                        </c:when>
                                        <c:when test="${'PAID'.equals(order.status)}">
                                            <h4><strong>等待商家接单</strong></h4>
                                            <p></p>
                                        </c:when>
                                        <c:when test="${'CANCELED'.equals(order.status)}">
                                            <h4 class="text-muted">订单已取消</h4>
                                            <p></p>
                                        </c:when>
                                        <c:when test="${'ACCEPTED'.equals(order.status)}">
                                            <h4 class="text-muted">商家已接单</h4>
                                            <p class="text-muted">商家于<fmt:formatDate value='${order.acceptedTime}' type='date' pattern='HH:mm'/>接单</p>
                                        </c:when>
                                        <c:when test="${'DELIVERY'.equals(order.status)}">
                                            <h4 class="text-muted">商品运送中</h4>
                                            <p class="text-muted">商家于<fmt:formatDate value='${order.acceptedTime}' type='date' pattern='HH:mm'/>接单</p>
                                        </c:when>
                                        <c:when test="${'AUDITING'.equals(order.status)}">
                                            <h4 class="text-muted">退单审核中</h4>
                                            <p></p>
                                        </c:when>
                                        <c:when test="${'UNCOMPLETED'.equals(order.status)}">
                                            <h4 class="text-muted">已退单</h4>
                                            <p></p>
                                        </c:when>
                                        <c:when test="${'COMPLETED'.equals(order.status) or 'EVALUATED'.equals(order.status)}">
                                            <h4><strong>订单已完成</strong></h4>
                                            <p class="text-muted"><fmt:formatDate value='${order.completedTime}' type='date' pattern='HH:mm'/>确认送达</p>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="col-md-6">
                                    <c:if test="${'UNPAID'.equals(order.status)}">
                                        <form:form id="orderCancelForm" action="${cancelOrderUrl}/${order.id}"/>
                                        <form:form id="payForm" action="${showPaymentUrl}/${order.id}" method="get">
                                            <input type="hidden" name="form">
                                        </form:form>
                                    </c:if>
                                    <c:if test="${'PAID'.equals(order.status) or 'ACCEPTED'.equals(order.status) or 'DELIVERY'.equals(order.status)}">
                                        <form:form id="orderUrgeForm" action="${urgeOrderUrl}/${order.id}"/>
                                    </c:if>
                                    <c:if test="${'DELIVERY'.equals(order.status)}">
                                        <form:form id="orderConfirmForm" action="${confirmOrderUrl}/${order.id}"/>
                                        <form:form id="orderRefundForm" action="${refundOrderUrl}/${order.id}"/>
                                    </c:if>
                                    <c:if test="${'AUDITING'.equals(order.status)}">
                                        <form:form id="orderCancelRefundForm" action="${cancelRefundOrderUrl}/${order.id}"/>
                                    </c:if>
                                    <c:if test="${'COMPLETED'.equals(order.status)}">
                                        <form:form id="orderRateForm" action="${addEvaluationUrl}/${order.id}" method="get">
                                            <input type="hidden" name="form">
                                        </form:form>
                                    </c:if>
                                    <div class="btn-group" role="group">
                                        <c:if test="${'UNPAID'.equals(order.status)}">
                                            <button id="orderCancelBtn" type="button" class="btn btn-danger">取消订单</button>
                                            <button id="payBtn" type="button" class="btn btn-primary">去支付</button>
                                        </c:if>
                                        <c:if test="${'PAID'.equals(order.status) or 'ACCEPTED'.equals(order.status) or 'DELIVERY'.equals(order.status)}">
                                            <button id="orderUrgeBtn" type="button" class="btn btn-info">催单</button>
                                        </c:if>
                                        <c:if test="${'DELIVERY'.equals(order.status)}">
                                            <button id="orderConfirmBtn" type="button" class="btn btn-success">确认收货</button>
                                            <button id="orderRefundBtn" type="button" class="btn btn-danger">申请退单</button>
                                        </c:if>
                                        <c:if test="${'AUDITING'.equals(order.status)}">
                                            <button id="orderCancelRefundBtn" type="button" class="btn btn-primary">取消退单</button>
                                        </c:if>
                                        <c:if test="${'COMPLETED'.equals(order.status)}">
                                            <button id="orderRateBtn" type="button" class="btn btn-info">评价订单</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <div class="row order-detail">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="col-sm-2">
                                            <a href="${showShopUrl}/${order.shop.id}">
                                                <img class="img-responsive center-block" alt="商店头像" src="${showShopPhotoUrl}/${order.shop.shopPhoto}">
                                            </a>
                                        </div>
                                        <div class="col-sm-6">
                                            <h4><strong>${order.shop.shopName}</strong></h4>
                                            <p class="text-muted">
                                                订单号：${order.orderNumber} 商家电话：${order.shop.shopPhone}
                                            </p>
                                        </div>
                                        <div class="col-sm-4">
                                            <a class="text-muted" href="${addFavorUrl}/${order.shop.id}"><span class="glyphicon glyphicon-star-empty"></span>收藏</a>
                                            <a class="text-muted" href="${addComplaintUrl}"><span class="glyphicon glyphicon-thumbs-down"></span>投诉</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 order-item">
                                        <table class="table text-center">
                                            <thead>
                                            <tr>
                                                <th class="text-center">菜品</th>
                                                <th class="text-center">数量</th>
                                                <th class="text-center">小计（元）</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${order.lineItems}">
                                                <tr>
                                                    <td>
                                                        <p class="text-muted">${item.productName}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-muted">${item.quantity}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-muted">${item.total}</p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td colspan="3" class="text-right">
                                                    <p>
                                                        实际支付: <span class="h2 text-danger">${order.total}</span>
                                                    </p>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-sm-6 order-info">
                                        <div class="row">
                                            <h4><strong>配送信息</strong></h4>
                                        </div>
                                        <div class="row">
                                            <p class="text-muted">联系人: ${order.address.receiver}</p>
                                            <p class="text-muted">联系电话: ${order.address.phone}</p>
                                            <p class="text-muted">收货地址: ${order.address.detail}</p>
                                        </div>
                                        <div class="row">
                                            <p class="text-muted">备注: ${order.notes}</p>
                                        </div>
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
</html>
