<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户查看商家</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/style.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/business/restaurant.92731b91.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/global.2730d877.css">

</head>
<body>

<!-- 留着用来作导航条 -->
<!-- 导航条 -->
<div class="my-header-nav">
    <nav class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img class="img-responsive center-block" alt="饱了么" src="">
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="hidden-sm hidden-md active"><a href="#">首页</a></li>
                    <li><a href="#">我的订单</a></li>
                    <li><a href="#">加盟合作</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-sm hidden-md"><a href="">规则中心</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">用户名 <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 个人中心</a>
                            </li>
                            <li><a href="#"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 我的收藏</a>
                            </li>
                            <li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 我的地址</a>
                            </li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 安全设置</a>
                            </li>
                            <li class="divider" role="separator"></li>
                            <li><a href="#"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>


<!-- 商店图标 -->
<div class="restaurant-header">

    <div class="container">
        <article class="rst-header-main rst-header-toggle "
                 itemscope=""
                 itemtype="http://schema.org/Restaurant">

            <header class="rst-header-info group">
                <!-- 商店图标 图片-->

                <a class="rst-logo" href="/zb-eamonn" itemprop="url">
                    <%--商家图片--%>
                    <img class="rst-logo-img" src="${pageContext.request.contextPath}/upload/business/${shop.shopPhoto}"
                         alt="${shop.shopName}"
                         itemprop="logo"/>
                </a>
                <!-- 商店图标 文字-->
                <div class="rst-basic-info">
                    <div class="">
                        <a class="rst-name text-overflow" href="/zb-eamonn"
                           data-toggle="bs-tooltip" href="/zb-eamonn">
                            ${shop.shopName}
                        </a>
                        <!-- span对应的类需要将:before去掉 -->
                        <span class="rst-name-wrapper caret"></span>
                    </div>
                    <!-- 商店图标 类型-->
                    <div class="rst-misc">
                        <span class="rst-flavor text-overflow" title="${shop.shopType}">${shop.shopType}</span>
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
            <c:if test="0 == ${shop.shippingFee}">
                <b>免费配送</b>
            </c:if>
            <c:if test="0 != ${shop.shippingFee}">
                <b>${shop.shippingFee}</b>
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
            <a class="rst-subheader-nav-left active" href="/zb-eamonn">
                菜单列表
            </a>

            <a class="rst-subheader-nav-left" href="">
                商家评价
            </a>

            <a class="rst-subheader-nav-left" href="/zb-eamonn/comment">
                商家资质
            </a>

            <span class="rst-subheader-nav-right">
					<a class="rst-subheader-nav-right-span" href="">默认排序
						<i class="rst-name-wrapper caret"></i>
					</a>
					<a class="rst-subheader-nav-right-span" href="">评分
						<i class="rst-name-wrapper caret"></i>
					</a>
					<a class="rst-subheader-nav-right-span" href="">销量
						<i class="rst-name-wrapper caret"></i>
					</a>
					<a href="">价格
						<i class="rst-name-wrapper caret"></i>
					</a>
				</span>
        </div>

        <div class="rst-subheader-nav-search ">
            <div id="topbar_search" class="topbar-search" role="search">
                <form id="tsearch_form" class="tsearch-form group" action="http://ele.me/search" method="get">
                    <i class="glyphicon glyphicon-search"></i>
                    <input class="tsearch-input" type="text" name="kw" autocomplete="off" placeholder="搜索餐厅，美食…"/>

                </form>
            </div>
        </div>


    </div>

</div>


<div class="container">

    <article id="rst_menus" class="restaurant-main">
        <nav class="rst-block rst-cate-wrapper">
            <h2 class="rst-cate-title">美食分类</h2>
            <ul class="rst-cate-list">
                <li class="cate_item cate-item" data-cateid="847669"><a class="cate_name cate-name" data-cateid="847669"
                                                                        title="餐盒费（必点）">餐盒费（必点）</a>(1)
                </li>
                <li class="cate_item cate-item" data-cateid="1379591"><a class="cate_name cate-name"
                                                                         data-cateid="1379591"
                                                                         title="扫码领红包，最高领6元！新用户立减15元">扫码领红包，最高领6…</a>(1)
                </li>
                <li class="cate_item cate-item" data-cateid="920304"><a class="cate_name cate-name" data-cateid="920304"
                                                                        title="点套餐送冰红茶">点套餐送冰红茶</a>(0)
                </li>
                <li class="cate_item cate-item" data-cateid="887172"><a class="cate_name cate-name" data-cateid="887172"
                                                                        title="A套餐（12元）">A套餐（12元）</a>(2)
                </li>
                <li class="cate_item cate-item" data-cateid="847380"><a class="cate_name cate-name" data-cateid="847380"
                                                                        title="B套餐（15元）">B套餐（15元）</a>(2)
                </li>
                <li class="cate_item cate-item" data-cateid="847458"><a class="cate_name cate-name" data-cateid="847458"
                                                                        title="C套餐（18元）">C套餐（18元）</a>(2)
                </li>
                <li class="cate_item cate-item" data-cateid="847141"><a class="cate_name cate-name" data-cateid="847141"
                                                                        title="素美套餐  18元">素美套餐 18元</a>(2)
                </li>
                <li class="cate_item cate-item" data-cateid="847280"><a class="cate_name cate-name" data-cateid="847280"
                                                                        title="金领豪华套餐">金领豪华套餐</a>(2)
                </li>

            </ul>

        </nav>


        <!-- 餐厅收藏 -->
        <div class="rst-fav-wrapper">
            <div id="rst_fav" class="rst-block rst-fav">
                <i class="glyph">♥</i>
                <span class="status" data-unfaved="收藏 餐厅" data-faved="已收藏">收藏 餐厅</span>
            </div>
        </div>

        <!-- 商品列表 -->
        <div class="restaurant-main">
            <div id="rating_wrap" class="rst-rating-wrapper">
                <section class="rst-rating-column rst_rating_wrap">
                    <div class="rst-block rst-rating-block">

                        <c:forEach items="${shop.productList}" var="product">
                            <div class="product_img">
                                <a href="/zb-eamonn" itemprop="url">
                                    <img class="rst-img" src="${pageContext.request.contextPath}/upload/product/${product.photo}"
                                         alt=""${shop.shopName}"
                                    />
                                </a>

                            </div>

                            <div class="product_name">

                                <h4><b>${product.productName}</b></h4>
                                <p class="produce_name_comments">
                                    <span class="produce_name_font">评分：${查询到的商品评价}</span>
                                    <span>♥♥♥♥♥</span>
                                    <span>月售：${product.salesVolume}</span>
                                </p>
                            </div>

                            <div class="product_price">

                                <span class="product_price_symbol">¥</span>
                                <span class="product_price_digital">${product.price}</span>

                            </div>
                            <div class="product_cart">
                                <button class="product_cart_button">加入购物车</button>
                            </div>
                        </c:forEach>

                    </div>
                </section>
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
                <li class="rst-badge-item"><i class="icon-rst-badge extra-discount"></i>${shop.announcement}</li>
            </ul>
        </section>
        <section id="favor_food" class="rst-block"></section>
        <section id="rec_food" class="rst-block hide">
            <h3 class="rst-aside-title">本周热卖</h3>
            <ul id="weekly_ranking" class="rst-aside-menu-list"></ul>
        </section>

        <section class="rst-block restaurant-board fixed rst_fix_panel">
            <h3 class="rst-aside-title">餐厅公告</h3>
            <p class="rst-deliver-detail"><i class="icon-rst-deliver"></i>起送价<span class="rst_deliver_amount"></span>元。
            </p>
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
</body>

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>

</html>
