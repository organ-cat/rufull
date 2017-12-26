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

    <!-- bootstrapValidator css -->
    <link href="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css" rel="stylesheet">

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

    <!-- bootstrapValidator js -->
    <script src="https://cdn.bootcss.com/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"></script>

    <!-- mapInfo js -->
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi
"></script>

    <spring:url value="/resources/js/service/mapInfo.js" var="mapInfo_url"/>
    <script src="${mapInfo_url}" type="text/javascript"></script>

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
    <spring:url value="/account/updatePasswordPage" var="changePasswordUrl"/>
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
    <spring:url value="/account/address" var="addAddressUrl"/>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="page-header">
                        <h3>订单详情</h3>
                    </div>
                    <table class="table text-center">
                        <thead>
                        <tr>
                            <th class="text-center">商品</th>
                            <th class="text-center">份数</th>
                            <th class="text-center">小计（元）</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${cart.cartItemList}" varStatus="status">
                            <tr>
                                <td>
                                    <p class="text-muted">${item.product.productName}</p>
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
                                <span class="text-danger">¥</span>
                                <span class="h2 text-danger">${cart.subTotal}</span>
                                <p class="text-muted">共 ${cart.totalQuantity} 份商品</p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-6 checkout-form">
                    <form:form id="orderSubmitForm" action="${submitOrderUrl}" cssClass="form-horizontal">
                        <input type="hidden" name="total" value="${cart.subTotal}">
                        <input type="hidden" name="accountId" value="${account.id}">
                        <input type="hidden" name="shop.id" value="${cart.shopId}">
                        <c:forEach var="item" items="${cart.cartItemList}" varStatus="status">
                            <input type="hidden" name="lineItems[${status.index}].productName" value="${item.product.productName}">
                            <input type="hidden" name="lineItems[${status.index}].price" value="${item.product.price}">
                            <input type="hidden" name="lineItems[${status.index}].quantity" value="${item.quantity}">
                            <input type="hidden" name="lineItems[${status.index}].productId" value="${item.product.id}">
                        </c:forEach>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">收货地址</label>
                            <div class="col-sm-10">
                                <div class="btn-group" data-toggle="buttons">
                                    <c:forEach var="address" items="${addresses}">
                                        <label class="btn btn-default">
                                            <input type="radio" name="address.id" value="${address.id}">
                                            <p>${address.receiver} ${address.phone}</p>
                                            <p class="accountAddress">${address.location}</p>
                                            <p>${address.detail}</p>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">付款方式</label>
                            <div class="col-sm-10">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default">
                                        <input type="radio" name="paymentMethod" value="ONLINE">
                                        在线支付
                                    </label>
                                    <label class="btn btn-default">
                                        <input type="radio" name="paymentMethod" value="OFFLINE">
                                        货到付款
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">配送方式</label>
                            <div class="col-sm-10">
                                本订单由 [<span class="text-info">${cart.shopName}</span>] 提供配送
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">订单备注</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" name="notes" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="submit" class="btn btn-primary">确认下单</button>
                            </div>
                        </div>
                    </form:form>
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
<script type="text/javascript">

    var accountPoints = [];
    var shopPoint = new BMap.Point();

    var localSearch;
    var address;

    // 将用户所有地址转换成定位,并添加到数组中
    <c:forEach var="address" items="${addresses}">
        localSearch = new BMap.LocalSearch(map);
        address = '${address.location}'; // 获取定位地址

        // 定位,并添加到用户定位数组中
        localSearch.setSearchCompleteCallback(
            function (searchResult) {
                var point = new BMap.Point();
                var poi = searchResult.getPoi(0);
                point.lng = poi.point.lng;
                point.lat = poi.point.lat;
                accountPoints['${address.id}'] = point;
            });

        localSearch.search(address);
    </c:forEach>

    // 定位商店地址
    localSearch = new BMap.LocalSearch(map);
    address = '${cart.address}';

    localSearch.setSearchCompleteCallback(
        function (searchResult) {
            var poi = searchResult.getPoi(0);
            shopPoint.lng = poi.point.lng;
            shopPoint.lat = poi.point.lat;
        });

    localSearch.search(address);

    $(document).ready(function() {
        $('#orderSubmitForm').bootstrapValidator({
            message: '输入的值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                'address.id': {
                    validators: {
                        notEmpty: {
                            message: '请选择收货地址'
                        },
                        callback: {
                            message: '您的收货地址不在商家配送范围内',
                            callback: function(value, validator) {
                                return isWithinShippingScope(accountPoints[value], shopPoint, ${shop.shippingDistance});
                            }
                        }
                    }
                },
                paymentMethod: {
                    validators: {
                        notEmpty: {
                            message: '请选择支付方式'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>
