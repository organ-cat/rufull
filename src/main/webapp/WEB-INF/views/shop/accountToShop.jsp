<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <meta charset="UTF-8">
    <title>用户查看商家</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/restaurant.92731b91.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/global.2730d877.css">

</head>
<body>

<!-- 留着用来作导航条 -->
<header>

</header>


<!-- 商店图标 -->
<div class="restaurant-header">

    <div class="container">
        <article class="rst-header-main rst-header-toggle rst_info_header"
                 itemscope=""
                 itemtype="http://schema.org/Restaurant">

            <header class="rst-header-info group">
                <!-- 商店图标 图片-->
                <a class="rst-logo" href="/zb-eamonn" itemprop="url">
                    <img class="rst-logo-img" src="${pageContext.request.contextPath}/upload/business/${shop.shopPhoto}"

                         alt="${shop.shopName}"
                         itemprop="logo" />
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
                        <span class="rst-flavor text-overflow" title="中式,西式,港式,韩式">
                            ${shop.shopType}
                        </span>
                    </div>
                </div>
            </header>

            <!-- 商店图标下拉的时候打开的框-->
            <div class="rst-header-detail rst-header-dropdown">

                <section class="rst-header-rating group">
                    <div class="rating-point header" itemprop="aggregateRating" itemscope="" itemtype="http://schema.org/AggregateRating">
                    </div>

                   ${shop.shopPhone}<br>
                   ${shop.operateState}
                </section>

                <!-- 公告 -->
                <section class="rst-header-intro">
                    商家公告:${shop.announcement}
                </section>
                <!-- 服务时间、地址 -->
                <ul class="rst-header-list">
                    <li>
                        <span class="item">时间：</span>
                        ${shop.operateTime}
                    </li>
                    <li>
                        <span class="item">地址：</span>
                        <span itemprop="address">  ${shop.address}</span>
                    </li>
                </ul>
            </div>
        </article>

        <div class="rst-header-info-shipping_price">

            <h3>起送价</h3>
            <b>${shop.shippingPrice}</b>
        </div>

        <div class="rst-header-info-shipping_fee">

            <h3>配送费</h3>
            <b>${shop.shippingFee}</b>
        </div>

        <div class="rst-header-info-shipping_time">
            <h3>平均送达时间</h3>
            <b>${shop.shippingTime}</b>
        </div>
    </div>
</div>


<!-- 商家头部下面导航 -->
<div class="restaurant-subheader">
    <div>
        <nav class="rst-subheader-nav">
            <ul class="nav nav-pills">
                <li class="active">
                    <a class="rst-header-nav-item"  href="/zb-eamonn">菜单列表</a>
                </li>

                <li>
                    <a class="rst-header-nav-item" href="">商家评价</a>
                </li>
                <li>
                    <a class="rst-header-nav-item" href="/zb-eamonn/comment">商家资质</a>
                </li>
            </ul>
        </nav>
    </div>



    <!-- 商家下面的导航 -->
    <div>
        <nav class="rst-subheader-nav-middle">
            <ul class="nav nav-tabs">
                <li>
                    <a class="rst-header-nav-item" href="/zb-eamonn">搜索1</a>
                </li>

                <li>
                    <a class="rst-header-nav-item" href="">搜索2</a>
                </li>
                <li>
                    <a class="rst-header-nav-item" href="/zb-eamonn/rating">搜索3</a>
                </li>
                <li>
                    <a class="rst-header-nav-item" href="/zb-eamonn/comment">搜索4</a>
                </li>
            </ul>
        </nav>
    </div>

    <div class="rst-subheader-nav-right " >
        <div id="topbar_search" class="topbar-search" role="search">
            <form id="tsearch_form" class="tsearch-form group" action="http://ele.me/search" method="get">
                <i id="" class="glyphicon glyphicon-search"></i>
                <input id="" class="tsearch-input" type="text" name="kw" autocomplete="off" placeholder="搜索餐厅，美食…" />

            </form>
        </div>
    </div>
</div>




<div class="container">

    <article id="rst_menus" class="restaurant-main">
        <nav class="rst-block rst-cate-wrapper">
            <h2 class="rst-cate-title">美食分类</h2>
            <ul class="rst-cate-list">
                <li class="cate_item cate-item" data-cateid="847669"><a class="cate_name cate-name" data-cateid="847669" title="餐盒费（必点）">餐盒费（必点）</a>(1) </li>
                <li class="cate_item cate-item" data-cateid="1379591"><a class="cate_name cate-name" data-cateid="1379591" title="扫码领红包，最高领6元！新用户立减15元">扫码领红包，最高领6…</a>(1) </li>
                <li class="cate_item cate-item" data-cateid="920304"><a class="cate_name cate-name" data-cateid="920304" title="点套餐送冰红茶">点套餐送冰红茶</a>(0) </li>
                <li class="cate_item cate-item" data-cateid="887172"><a class="cate_name cate-name" data-cateid="887172" title="A套餐（12元）">A套餐（12元）</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="847380"><a class="cate_name cate-name" data-cateid="847380" title="B套餐（15元）">B套餐（15元）</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="847458"><a class="cate_name cate-name" data-cateid="847458" title="C套餐（18元）">C套餐（18元）</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="847141"><a class="cate_name cate-name" data-cateid="847141" title="素美套餐  18元">素美套餐 18元</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="847280"><a class="cate_name cate-name" data-cateid="847280" title="金领豪华套餐">金领豪华套餐</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="887211"><a class="cate_name cate-name" data-cateid="887211" title="1元类">1元类</a>(44) </li>
                <li class="cate_item cate-item" data-cateid="887209"><a class="cate_name cate-name" data-cateid="887209" title="2元类">2元类</a>(25) </li>
                <li class="cate_item cate-item" data-cateid="887208"><a class="cate_name cate-name" data-cateid="887208" title="3元类">3元类</a>(27) </li>
                <li class="cate_item cate-item" data-cateid="887206"><a class="cate_name cate-name" data-cateid="887206" title="4元类">4元类</a>(3) </li>
                <li class="cate_item cate-item" data-cateid="887204"><a class="cate_name cate-name" data-cateid="887204" title="5元类">5元类</a>(2) </li>
                <li class="cate_item cate-item" data-cateid="847580"><a class="cate_name cate-name" data-cateid="847580" title="自选调料（免费）">自选调料（免费）</a>(10) </li>
            </ul>
            <ul class="rst-activity-list"></ul>
        </nav>


        <!-- 餐厅收藏 -->
        <div class="rst-fav-wrapper">
            <div id="rst_fav" class="rst-block rst-fav">
                <i class="glyph">♥</i>
                <span class="status" data-unfaved="收藏 餐厅" data-faved="已收藏">收藏 餐厅</span>
            </div>
        </div>


        <c:if test="shop.productList != null">
            有商品可以显示。。。。
        </c:if>
        <!-- 商品列表 -->
        <div class="restaurant-main">
            <div id="rating_wrap" class="rst-rating-wrapper">
                <section class="rst-rating-column rst_rating_wrap">
                    <c:forEach items="${shop.productList}" var="product">
                        <div class="rst-block rst-rating-block">
                                <div class="product_img">
                                    <a href="/zb-eamonn" itemprop="url">
                                        <img class="rst-img" src="${product.photo}" alt="${shop.shopName}"
                                        />
                                    </a>
                                </div>
                                <div class="product_name">
                                    <p class="text-primary">${product.productName}</p>
                                    <br>
                                    <p class="text-primary">评分</p>
                                </div>
                                <div class="product_price">
                                    <p>${product.price}</p>
                                </div>
                                <div class="product_cart">
                                    <p>加入购物车</p>
                                </div>
                            </div>
                    </c:forEach>


                </section>
            </div>
        </div>
    </article>

    <!-- 餐厅公告 -->
    <aside id="rst_aside" class="restaurant-aside">
        <section class="rst-block restaurant-board">
            <h3 class="rst-aside-title">餐厅公告</h3>
            <p class="rst-deliver-detail"> <i class="icon-rst-deliver"></i>起送价<span class="rst_deliver_amount"></span>元。 </p>
            <ul class="rst-badge-list">
                <li class="rst-badge-item"> <i class="icon-rst-badge v v-person"></i> 该商家已通过个人身份认证 </li>
                <li class="rst-badge-item"><i class="icon-rst-badge online-payment"></i>该餐厅支持在线支付</li>
                <li class="rst-badge-item"><i class="icon-rst-badge new-user-discount"></i>饿了么新用户首次订餐，可立减15元。(不与其他活动同享)</li>
                <li class="rst-badge-item"><i class="icon-rst-badge extra-discount"></i>在线支付满20减10</li>
            </ul>
        </section>
        <section id="favor_food" class="rst-block"></section>
        <section id="rec_food" class="rst-block hide">
            <h3 class="rst-aside-title">本周热卖</h3>
            <ul id="weekly_ranking" class="rst-aside-menu-list"></ul>
        </section>

        <section class="rst-block restaurant-board fixed rst_fix_panel">
            <h3 class="rst-aside-title">餐厅公告</h3>
            <p class="rst-deliver-detail"> <i class="icon-rst-deliver"></i>起送价<span class="rst_deliver_amount"></span>元。 </p>
        </section>
    </aside>
</div>






<!-- 页脚 -->

<footer class="index_footer">

</footer>
</body>

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>

</html>
