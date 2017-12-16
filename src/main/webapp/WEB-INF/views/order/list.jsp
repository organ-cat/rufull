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

    <!-- bootstrap-table css -->
    <spring:url value="/resources/css/bootstrap-table.css" var="bootstrap_table_css_url"/>
    <link rel="stylesheet" href="${bootstrap_table_css_url}"/>

    <!-- normalize css -->
    <spring:url value="/resources/css/style.css" var="normalize_css_url"/>
    <link rel="stylesheet" href="${normalize_css_url}"/>

    <!-- app css -->
    <spring:url value="/resources/css/style.css" var="app_css_url"/>
    <link rel="stylesheet" type="text/css" href="${app_css_url}"/>

    <!-- jquery -->
    <spring:url value="/resources/js/jquery-1.12.4.js" var="jquery_url"/>
    <script src="${jquery_url}" type="text/javascript"></script>

    <!-- jquery-dateFormat -->
    <spring:url value="/resources/js/jquery-dateFormat.js" var="jquery_dateFormat_url"/>
    <script src="${jquery_dateFormat_url}" type="text/javascript"></script>

    <!-- bootstrap js -->
    <spring:url value="/resources/js/bootstrap.js" var="bootstrap_js_url"/>
    <script src="${bootstrap_js_url}" type="text/javascript"></script>

    <!-- bootstrap-table js -->
    <spring:url value="/resources/js/bootstrap-table.js" var="bootstrap_table_js_url"/>
    <script src="${bootstrap_table_js_url}" type="text/javascript"></script>

    <!-- bootstrap-table-zh-CN js -->
    <spring:url value="/resources/js/bootstrap-table-zh-CN.js" var="bootstrap_table_zh_CN_js_url"/>
    <script src="${bootstrap_table_zh_CN_js_url}" type="text/javascript"></script>

    <title>个人中心_订单管理|饱了么网上订餐</title>

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
                <li class="path-header">${order_head}</li>
            </ol>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item"><strong><a class="text-muted" href="${showProfileUrl}"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>个人中心</a></strong></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list" aria-hidden="true"></span>我的订单</strong></li>
                        <li class="list-group-item list-group-item-info"><a id="list" class="text-muted" href="javascript:void(0);">近三个订单</a></li>
                        <li class="list-group-item"><a id="listUnrated" class="text-muted" href="javascript:void(0);">待评价订单</a></li>
                        <li class="list-group-item"><a id="listRefund" class="text-muted" href="javascript:void(0);">退单记录</a></li>
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
                        <h1><small>${order_head}</small></h1>
                    </div>
                    <div class="container-fluid" id="content">
                        <div class="panel panel-default">
                            <table id="table"
                                   data-classes="table table-hover table-no-bordered"
                                   data-show-refresh="true"
                                   data-show-export="true"
                                   data-pagination="true"
                                   data-id-field="id"
                                   data-page-list="[10, 25, 50, 100, ALL]"
                                   data-show-footer="false"
                                   data-side-pagination="server"
                                   data-page-size="1"
                                   data-url="${showOrderUrl}/${ordersUrl}">
                            </table>
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
<script>
    var $table = $('#table');

    function initTable() {
        $table.bootstrapTable({
            queryParams: function (params) {
                return {
                    offset: params.offset,
                    limit: params.limit,
                }
            },
            onLoadSuccess: function() {
                $('#orderCancelBtn').click(function () {
                    $('#orderCancelForm').submit();
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
            },
            columns: [{
                title: '下单时间',
                field: 'createdTime',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return [
                        '<h4><strong>' + row.createDateString + '</strong></h4>  ',
                        '<p class="text-muted">' + $.format.date(new Date(value), 'HH:mm') + '</p>  '
                    ].join('');
                }}, {
                title: '订单内容',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    return [
                        '<a href="${showShopUrl}/' + row.shop.id + '">',
                        '<img class="img-responsive center-block img-circle" alt="商店头像" src="${showShopPhotoUrl}/' + row.shop.shopPhoto + '"/>  ',
                        '</a>  '
                    ].join('');
                }}, {
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var allItemDetail = "";
                    $.each(row.lineItems, function (index, element) {
                        var itemDetail = element.productName + element.quantity + '份 /';
                        allItemDetail = allItemDetail + ' ' + itemDetail;
                    });

                    return [
                        '<a href="${showShopUrl}/' + row.shop.id + '" class="order-shop-name">',
                        '<h4><strong>' + row.shop.shopName + '</strong></h4>  ',
                        '</a>  ',
                        '<a href="${showOrderUrl}/' + row.id + '">',
                        '<p class="text-muted">' + allItemDetail.substr(0, allItemDetail.length-1) + '<strong>' + row.totalQuantity + '</strong> 个菜品</p>  ',
                        '<p class="text-muted">订单号: ' + row.orderNumber + '</p>',
                        '</a>  '
                    ].join('');
                }}, {
                title: '支付金额（元）',
                field: 'total',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var paymentMethod;
                    if       (row.paymentMethod == 'ONLINE') paymentMethod = '在线支付';
                    else if (row.paymentMethod == 'OFFLINE') paymentMethod = '货到付款';
                    return [
                        '<h4><strong>' + value + '</strong></h4>  ',
                        '<p class="text-muted">' + paymentMethod + '</p>  '
                    ].join('');
                }}, {
                title: '状态',
                field: 'status',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var statusText;
                    var statusClass = 'text-muted';
                    switch (value) {
                        case 'UNPAID':
                            statusText = '等待支付';
                            statusClass = 'order-status-unpaid';

                            // 启动倒计时
                            // ...
                            break;
                        case 'PAID':
                            statusText = '等待商家接单';
                            break;
                        case 'CANCELED':
                            statusText = '订单已取消';
                            break;
                        case 'ACCEPTED':
                            statusText = '商家已接单';
                            break;
                        case 'DELIVERY':
                            statusText = '商品运送中';
                            break;
                        case 'AUDITING':
                            statusText = '退单审核中';
                            break;
                        case 'UNCOMPLETED':
                            statusText = '已退单';
                            break;
                        case 'COMPLETED':
                            statusText = '等待评价';
                            break;
                        case 'EVALUATED':
                            statusText = '订单已完成';
                            break;
                    }
                    return [
                        '<h4 class="' + statusClass + '">' + statusText + '</h4>  ',
                        value == 'UNPAID'? '<p class="text-danger">倒计时中</p>  ' : ''
                    ].join('');
                }}, {
                title: '操作',
                field: 'status',
                align: 'center',
                valign: 'middle',
                formatter: function (value, row, index) {
                    var operations;

                    switch (value) {
                        case 'UNPAID':
                            operations = [
                                '<a class="btn btn-primary order-btn" href="${showPaymentUrl}/' + row.id + '" role="button">立即付款</a>  ',
                                '<form id="orderCancelForm" action="${cancelOrderUrl}/' + row.id + '" method="post"/>  ',
                                '<button id="orderCancelBtn" type="button" class="btn btn btn-danger order-btn">取消订单</button>  '
                            ].join('');
                            break;
                        case 'DELIVERY':
                            operations = [
                                '<form id="orderConfirmForm" action="${confirmOrderUrl}/' + row.id + '" method="post"/>  ',
                                '<button id="orderConfirmBtn" type="button" class="btn btn-success order-btn">确认收货</button>  ',
                                '<form id="orderRefundForm" action="${refundOrderUrl}/' + row.id + '" method="post"/>  ',
                                '<button id="orderRefundBtn" type="button" class="btn btn-danger order-btn">申请退单</button>  '
                            ].join('');
                            break;
                        case 'AUDITING':
                            operations = [
                                '<form id="orderCancelRefundForm" action="${cancelRefundOrderUrl}/' + row.id + '" method="post"/>  ',
                                '<button id="orderCancelRefundBtn" type="button" class="btn btn-primary order-btn">取消退单</button>  '
                            ].join('');
                            break;
                        case 'COMPLETED':
                            operations = [
                                '<a class="btn btn-info order-btn" href="${addEvaluationUrl}/' + row.id + '?form" role="button">评价订单</a>  '
                            ].join('');
                            break;
                    }
                    return [
                        '<div class="btn-group-vertical">',
                        '<a class="btn btn-default order-btn" href="${showOrderUrl}/' + row.id + '" role="button">订单详情</a>  ',
                        operations,
                        '</div>  '
                    ].join('');
                }}]
        });
    }



    $(document).ready(function () {
        initTable();

        $('#list').click(function () {
            $('.list-group-item').removeClass('list-group-item-info'); // 移除激活样式
            $(this).parent('li').addClass('list-group-item-info'); // 激活选中连接样式

            $('.path-header').text('近三个月订单');
            $('.page-header h1 small').text('近三个月订单');

            $table.bootstrapTable('refresh', {url: '${showOrderUrl}'});
        });

        $('#listUnrated').click(function () {
            $('.list-group-item').removeClass('list-group-item-info'); // 移除激活样式
            $(this).parent('li').addClass('list-group-item-info'); // 激活选中连接样式

            $('.path-header').text('待评价订单');
            $('.page-header h1 small').text('待评价订单');

            $table.bootstrapTable('refresh', {url: '${showUnratedOrderUrl}'});
        });

        $('#listRefund').click(function () {
            $('.list-group-item').removeClass('list-group-item-info'); // 移除激活样式
            $(this).parent('li').addClass('list-group-item-info'); // 激活选中连接样式

            $('.path-header').text('退单记录');
            $('.page-header h1 small').text('退单记录');

            $table.bootstrapTable('refresh', {url: '${showRefundOrderUrl}'});
        });
    });
</script>
</body>
</html>