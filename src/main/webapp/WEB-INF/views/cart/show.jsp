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
    <spring:url value="/order/submit" var="submitOrderUrl"/>
    <spring:url value="/cart/clearAll" var="clearAllCartUrl"/>
    <spring:url value="/cart/clear" var="clearCartUrl"/>
    <spring:url value="/cart/remove" var="removeProductUrl"/>
    <spring:url value="/cart/update" var="updateCartUrl"/>
    <spring:url value="/cart/checkout" var="checkoutUrl"/>

    <script type="text/javascript">
        $(document).ready(function() {
            $('.subtract').click(function () {
                var val = $(this).parent().next().attr('value');
                $(this).parent().next().attr('value', val - 1);
            })
            $('.plus').click(function () {
                var val = $(this).parent().prev().attr('value');
                $(this).parent().prev().attr('value', +val + 1);
            })
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${account.username}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="${showProfileUrl}?id=${account.id}"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>个人中心</a></li>
                        <li><a href="${showCartUrl}"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>购物车</a></li>
                        <li><a href="${showFavorUrl}?id=${account.id}"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>我的收藏</a></li>
                        <li><a href="${showAddressUrl}?id=${account.id}"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>我的地址</a></li>
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
                    <a class="text-muted" href="${showPlaceUrl}">${address}</a>
                    <a href="${showPlaceUrl}">[切换地址]</a>
                </li>
                <li>近三个月订单(需要动态切换)</li>
            </ol>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item"><strong><a class="text-muted" href="${showProfileUrl}?id=${account.id}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>个人中心</a></strong></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>我的订单</strong></li>
                        <li class="list-group-item"><a id="list" class="text-muted" href="${showOrderUrl}">近三个订单</a></li>
                        <li class="list-group-item"><a id="listUnrated" class="text-muted" href="${showUnratedOrderUrl}">待评价订单</a></li>
                        <li class="list-group-item"><a id="listRefund" class="text-muted" href="${showRefundOrderUrl}">退单记录</a></li>
                        <li class="list-group-item"><strong><a class="text-muted" href="${showFavorUrl}?id=${account.id}"><span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>我的收藏</a></strong></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user" aria-hidden="true"></span>我的资料</strong></li>
                        <li class="list-group-item"><a class="text-muted" href="${showInfoUrl}">个人资料</a></li>
                        <li class="list-group-item"><a class="text-muted" href="${showAddressUrl}?id=${account.id}">地址管理</a></li>
                        <li class="list-group-item"><a class="text-muted" href="${showSecurityUrl}">安全中心</a></li>
                        <li class="list-group-item"><a class="text-muted" href="${changePasswordUrl}">修改密码</a></li>
                        <li class="list-group-item"><strong><a class="text-muted" href="${footprintUrl}?id=${account.id}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>我的足迹</a></strong></li>
                        <li class="list-group-item"><strong><a class="text-muted" href="${showComplaint}?id=${account.id}"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>我的投诉</a></strong></li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="page-header">
                        <h1><small>购物车(需要动态切换)</small></h1>
                    </div>
                    <div class="container-fluid" id="content">
                        <div class="row cart-form">
                            <div class="page-header">
                                <a href="${showShopUrl}?id=${cart.shopId}">
                                    <span class="h3 text-muted"><strong>${cart.shopName}</strong></span>
                                </a>
                                <a class="text-muted" href="${clearCartUrl}/${cart.shopId}">清空此购物车</a>
                            </div>
                            <div class="row text-center">
                                <div class="col-md-12">
                                    <form:form action="${updateCartUrl}/${cart.shopId}">
                                        <table class="table table-hover">
                                            <thead>
                                            <tr>
                                                <th class="text-center">商品</th>
                                                <th class="text-center">数量</th>
                                                <th class="text-center">单价</th>
                                                <th class="text-center">总价</th>
                                                <th class="text-center"></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="item" items="${cart.cartItemList}">
                                                <tr>
                                                    <td class="col-md-6">
                                                        <h4><strong>${item.product.productName}</strong></h4>
                                                    </td>
                                                    <td class="col-md-2">
                                                        <div class="input-group form-group">
                                                                    <span class="input-group-btn">
                                                                        <button class="btn btn-default subtract">-</button>
                                                                    </span>
                                                            <input type="text" class="text-center form-control" name="quantity[${item.product.id}]" value="${item.quantity}">
                                                            <span class="input-group-btn">
                                                                        <button class="btn btn-default plus">+</button>
                                                                    </span>
                                                        </div>
                                                    </td>
                                                    <td class="col-md-2"><strong>¥${item.product.price}</strong></td>
                                                    <td class="col-md-2"><strong>¥${item.total}</strong></td>
                                                    <td class="col-md-2">
                                                        <a class="btn btn-danger" href="${removeProductUrl}/${cart.shopId}/${item.product.id}">
                                                            <span class="glyphicon glyphicon-remove"></span> 移除商品
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="text-right"><h5>小计</h5></td>
                                                <td class="text-right"><h5><strong>¥${cart.subTotal}</strong></h5></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="text-right"><h5>配送费</h5></td>
                                                <td class="text-right"><h5><strong>¥0.00</strong></h5></td>
                                            </tr>
                                            <tr><td></td>
                                                <td></td>
                                                <td></td>
                                                <td class="text-right"><h3>总共</h3></td>
                                                <td class="text-right"><h3><strong>¥${cart.subTotal}</strong></h3></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <a class="btn btn-success" href="${checkoutUrl}/${cart.shopId}">
                                                        <span class="glyphicon glyphicon-play"></span> 结算
                                                    </a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </form:form>
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
