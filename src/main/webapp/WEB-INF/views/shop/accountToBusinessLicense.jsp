<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户查看商家资质</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/style.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/business/restaurant.92731b91.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/global.2730d877.css">

</head>
<body>
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
<spring:url value="/complaint/showAccount" var="showComplaintUrl"/>
<spring:url value="/account/infomation" var="showInfoUrl"/>
<spring:url value="/account/updatePasswordPage" var="changePasswordUrl"/>
<spring:url value="/cart" var="showCartUrl"/>
<!-- 留着用来作导航条 -->
<div class="my-header-nav">
    <nav class="mynav navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${rootUrl}">
                    <img class="img-responsive center-block" alt="饱了么" src="">
                </a>
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
</div>


<div class="restaurant-header">

    <div class="container">
        <article class="rst-header-main rst-header-toggle "
                 itemscope=""
                 itemtype="http://schema.org/Restaurant">

            <header class="rst-header-info group">
                <!-- 商店图标 图片-->

                <a class="rst-logo" href="${pageContext.request.contextPath}/shop/showShopDetail?id=${shop.id}" itemprop="url">
                    <%--商家图片--%>
                    <img class="rst-logo-img" src="${pageContext.request.contextPath}/upload/shop/${shop.shopPhoto}"
                         alt="${shop.shopName}"
                         itemprop="logo"/>
                </a>
                <!-- 商店图标 文字-->
                <div class="rst-basic-info">
                    <div class="">
                        <a class="rst-name text-overflow" href="${pageContext.request.contextPath}/shop/showShopDetail?id=${shop.id}"
                           data-toggle="bs-tooltip" href="${pageContext.request.contextPath}/shop/showShopDetail?id=${shop.id}">
                            ${shop.shopName}
                        </a>
                        <!-- span对应的类需要将:before去掉 -->
                        <span class="rst-name-wrapper caret"></span>
                    </div>
                    <!-- 商店图标 类型-->
                    <div class="rst-misc">
                        <span class="rst-flavor text-overflow" title="${shop.shopType}">
                            <c:choose>
                                <c:when test="${shop.shopType == 0}">
                                    美食、异国料理、特色菜
                                </c:when>
                                <c:when test="${shop.shopType == 1}">
                                    甜品、饮品、小吃
                                </c:when>
                                <c:when test="${shop.shopType == 2}">
                                    午餐、晚餐：早餐、下午茶、夜宵
                                </c:when>
                                <c:when test="${shop.shopType == 3}">
                                    快餐、便当
                                </c:when>
                                <c:when test="${shop.shopType == 4}">
                                    果蔬生鲜
                                </c:when>
                                <c:when test="${shop.shopType == 5}">
                                    超市商店
                                </c:when>
                                <c:when test="${shop.shopType == 6}">
                                    鲜花绿植
                                </c:when>
                                <c:otherwise>
                                    医药健康
                                </c:otherwise>
                            </c:choose>

                        </span>
                        <br>
                        <span>
                            <h4><b>评分：<div class="rating-star r${requestScope.shopEvaluation * 2}"></div></b></h4>

                        </span>
                    </div>
                </div>
            </header>

            <!-- 商店图标下拉的时候打开的框-->
            <div class="rst-header-detail rst-header-dropdown">
                <section class="rst-header-intro">

                </section>
                <!-- 服务时间、地址 -->
                <ul class="rst-header-list">
                    <li>
                        <span class="item">时间：</span>
                        ${shop.operateTime}
                    </li>
                    <li>
                        <span class="item">地址：</span>
                        <span itemprop="address"> ${shop.address}</span>
                    </li>
                </ul>
            </div>
        </article>

        <div class="rst-header-info-shipping_price">

            <h3>起送价</h3>
            <b>¥ ${shop.shippingPrice}</b>
        </div>

        <div class="rst-header-info-shipping_fee">
            <h3>配送费</h3>
            <c:if test="${shop.shippingFee == '0.00'}">
                <b>免费配送</b>
            </c:if>
            <c:if test="${shop.shippingFee != '0.00'}">
                <b>¥${shop.shippingFee }</b>
            </c:if>
        </div>

        <div class="rst-header-info-shipping_time">
            <h3>平均送达时间</h3>
            <b>${shop.shippingTime}分钟</b>
        </div>
    </div>
</div>


<!-- 商家头部下面导航 -->
<div class="restaurant-subheader">
    <div class="container">
        <div class="rst-subheader-nav">
            <a class="rst-subheader-nav-left "
               href="${pageContext.request.contextPath}/shop/showShopDetail?id=${shop.id}">
                菜单列表
            </a>

            <a class="rst-subheader-nav-left  "
               href="${pageContext.request.contextPath}/shop/showShopComments?id=${shop.id}">
                商家评价
            </a>

            <a class="rst-subheader-nav-left active "
               href="${pageContext.request.contextPath}/shop/showBusinessLicense?id=${shop.id}">
                商家资质
            </a>
        </div>

        <%--<div class="rst-subheader-nav-search ">--%>
            <%--<div id="topbar_search" class="topbar-search" role="search">--%>
                <%--<form id="tsearch_form" class="tsearch-form group" action="http://ele.me/search" method="get">--%>
                    <%--<i id="" class="glyphicon glyphicon-search"></i>--%>
                    <%--<input id="" class="tsearch-input" type="text" name="kw" autocomplete="off" placeholder="搜索餐厅，美食…"/>--%>

                <%--</form>--%>
            <%--</div>--%>
        <%--</div>--%>

    </div>


    <div class="container">

        <article id="rst_menus" class="restaurant-main-licence">


            <!-- 餐厅收藏 -->
            <div class="rst-fav-wrapper">
                <div id="rst_fav" class="rst-block rst-fav">
                    <a href="#"><i class="glyph">♥</i></a>
                    <span class="status" data-unfaved="收藏 餐厅" data-faved="已收藏">收藏 餐厅</span>
                </div>
                <div id="rst_complain" class="rst-block rst-fav">
                    <a href="${pageContext.request.contextPath}/complaint/page/?shopId=${shop.id}"><i class="glyph">✘</i></a>
                    <span class="status" data-unfaved="投诉 餐厅" data-faved="已投诉">投诉 餐厅</span>
                </div>
            </div>
            <br>

            <!-- 商家资历 -->
            <div class="restaurant-main">

                <div class="jumbotron">
                    <div class="container">
                        <hgroup>
                            <h1 style="color: #000000">商家资历</h1>
                        </hgroup>
                    </div>
                </div>
                <div class="shop_qa_left_photo rst-block rst-rating-block">
                    <img src="${pageContext.request.contextPath}/upload/business/${shop.business.businessLicence}"
                         alt="${shop.business.businessLicence}">
                </div>

                <div class="shop_qa_right_photo rst-block rst-rating-block">
                    <img src="${pageContext.request.contextPath}/upload/business/${shop.business.cateringServiceLicense}"
                         alt="${shop.business.cateringServiceLicense}">
                </div>
            </div>
        </article>

        <!-- 餐厅公告 -->
        <aside id="rst_aside" class="restaurant-aside">
            <section class="rst-block restaurant-board">
                <h3 class="rst-aside-title">餐厅公告</h3>
                <ul class="rst-badge-list">
                    <li class="rst-badge-item"><i class="icon-rst-badge v v-person"></i> 该商家已通过个人身份认证</li>
                    <li class="rst-badge-item"><i class="icon-rst-badge online-payment"></i>该餐厅支持在线支付</li>
                    <div class="shopAccountment">
                        <li class="rst-badge-item">
                            <p>${shop.announcement}</p>
                        </li>
                    </div>
                </ul>
            </section>
            <section id="favor_food" class="rst-block"></section>
            <section id="rec_food" class="rst-block hide">
                <h3 class="rst-aside-title">本周热卖</h3>
                <ul id="weekly_ranking" class="rst-aside-menu-list"></ul>
            </section>

            <section class="rst-block restaurant-board fixed rst_fix_panel">
                <h3 class="rst-aside-title">餐厅公告</h3>
                <p class="rst-deliver-detail"><i class="icon-rst-deliver"></i>起送价<span
                        class="rst_deliver_amount"></span>元。 </p>
            </section>
        </aside>
    </div>


    <!-- 页脚 -->
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
</div>
</body>
<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>
<script src="${pageContext.request.contextPath}/js/business/accountToBus    inessLicence.js"></script>

<script type="text/javascript">

    var shopId ="${shop.id}";
    var accountId =  "${sessionScope.account.id}";


</script>
</html>

