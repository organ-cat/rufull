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

    <title>个人中心_订单管理|饱了么网上订餐</title>

    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order" var="showOrderUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="#" var="showCooperationUrl"/>
    <spring:url value="#" var="showAgreementUrl"/>
    <spring:url value="/account/center" var="showProfileUrl"/>
    <spring:url value="/favor/myFavor" var="showFavorUrl"/>
    <spring:url value="/account/center" var="footprintUrl"/>
    <spring:url value="/address/addressManage" var="showAddressUrl"/>
    <spring:url value="/account/security" var="showSecurityUrl"/>
    <spring:url value="/account/logout" var="logoutUrl"/>
    <spring:url value="/place" var="showPlaceUrl"/>
    <spring:url value="/home" var="homeUrl"/>
    <spring:url value="/balance" var="showBalanceUrl"/>
    <spring:url value="/account/infomation" var="infomationUrl"/>
    <spring:url value="/account/infomation" var="showInfoUrl"/>
    <spring:url value="/account/updatePasswordPage" var="changePasswordUrl"/>
    <spring:url value="/shop" var="showShopUrl"/>
    <spring:url value="/rate" var="addRateUrl"/>
    <spring:url value="/favor" var="addFavorUrl"/>
    <spring:url value="/complaint?from" var="addComplaintUrl"/>
    <spring:url value="/payment?from" var="payUrl"/>
    <spring:url value="/order/cancel" var="cancelOrderUrl"/>
    <spring:url value="/upload/business" var="showShopPhotoUrl"/>
    <spring:url value="/order/refund" var="refundOrderUrl"/>
    <spring:url value="/order/urge" var="urgeOrderUrl"/>
    <spring:url value="/order/cancelRefund" var="cancelRefundOrderUrl"/>
    <spring:url value="/order/confirm" var="confirmOrderUrl"/>
    <spring:url value="/shop/showShopDetail" var="showShopDetailUrl"/>
    <spring:url value="/favor/deleteFavor" var="deleteFavorUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>
    <script src="${pageContext.request.contextPath}/js/account/center.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
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

    <link href="../css/service/pagevendor.css" rel="stylesheet">
    <link href="../css/service/pagemain.css" rel="stylesheet">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <!-- center css -->
    <spring:url value="/resources/css/account/center.css" var="center_css_url"/>
    <link rel="stylesheet" type="text/css" href="${center_css_url}"/>
    <spring:url value="/resources/css/account/complaintList.css" var="complaintList_css_url"/>
    <link rel="stylesheet" type="text/css" href="${complaintList_css_url}"/>
    <spring:url value="/resources/upload/shop/" var="shop_photo_url"/>
    <spring:url value="/resources/upload/complaint/" var="complaint_photo_url"/>
</head>
<body>
<!-- 导航条 -->
<nav class="navbar navbar-default navo-color">
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
                    <a class="text-muted" href="${showPlaceUrl}/需要一组字符串不知道干嘛用的">麻章区广东海洋大学(点击后跳到附近商店列表页面)</a>
                    <a href="${homeUrl}">[切换地址]</a>
                </li>
                <li>个人中心(需要动态切换)</li>
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
                        <li class="list-group-item"><strong><a class="text-muted" href="${showComplaint}?id=${account.id}&currentPage=1"><span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>我的投诉</a></strong></li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="container-fluid" id="content">
                        <div class="row">
                            <div class="complaint-show">
                                <h3>投诉过的商家</h3>
                                <hr/>
                                <c:forEach items="${complaintList}" var="complaint">
                                    <div class="complaint-div">
                                        <table class="complaint-table">
                                            <tr>
                                                <td rowspan="2">
                                                    <img src="${shop_photo_url}/${complaint.shop.shopPhoto}" width="100px" height="100px">
                                                </td>
                                                <td>
                                                    <b>商店名称</b>
                                                </td>
                                                <td class="content">
                                                    <b>投诉原因</b>
                                                </td>
                                                <td class="content">
                                                    <b>投诉内容</b>
                                                </td>
                                                <td rowspan="2" class="evidence">
                                                    <img src="${complaint_photo_url}/${complaint.evidence}" width="100px" height="100px">
                                                </td>
                                                <td>
                                                    <b>投诉状态</b>
                                                </td>
                                                <td class="content">
                                                    <b>投诉结果</b>
                                                </td>
                                                <td>
                                                    <b>投诉时间</b>
                                                </td>
                                                <td>
                                                    <b>投诉处理时间</b>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                        <%--商店名--%>
                                                    <p>${complaint.shop.shopName}</p>
                                                </td>
                                                <td class="content">
                                                        <%--类型--%>
                                                    <p>
                                                        <c:if test="${complaint.type == 1}">
                                                            商店确认接单，没有送餐
                                                        </c:if>
                                                        <c:if test="${complaint.type == 2}">
                                                            商店存在卫生安全问题
                                                        </c:if>
                                                        <c:if test="${complaint.type == 3}">
                                                            其他
                                                        </c:if>
                                                    </p>
                                                </td>
                                                <td class="content">
                                                        <%--内容--%>
                                                    <p>${complaint.content}</p>
                                                </td>
                                                <td>
                                                        <%--状态--%>
                                                    <p>
                                                        <c:if test="${complaint.status == 1}">
                                                            已投诉
                                                        </c:if>
                                                        <c:if test="${complaint.status == 2}">
                                                            处理中
                                                        </c:if>
                                                        <c:if test="${complaint.status == 3}">
                                                            完成处理
                                                        </c:if>
                                                    </p>

                                                </td>
                                                <td>
                                                        <%--状态--%>
                                                    <p>
                                                        <c:if test="${complaint.result == 1}">
                                                            情况属实，已处罚商店
                                                        </c:if>
                                                        <c:if test="${complaint.result == 2}">
                                                            情况不属实
                                                        </c:if>
                                                    </p>
                                                </td>
                                                <td>
                                                        <%--创建时间--%>
                                                    <p>${complaint.createdTime.toLocaleString()}</p>
                                                </td>
                                                <td>
                                                        <%--完成时间--%>
                                                    <p>${complaint.completedTime.toLocaleString()}</p>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="page-div">
                                <c:if test="${prePage != 0}">
                                    <a href="${pageContext.request.contextPath}/complaint/showAccount?id=${account.id}&currentPage=${prePage}"><b>上一页</b></a>
                                </c:if>
                                <c:if test="${nextPage != 0}">
                                    <a href="${pageContext.request.contextPath}/complaint/showAccount?id=${account.id}&currentPage=${nextPage}"><b>下一页</b></a>
                                </c:if>
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