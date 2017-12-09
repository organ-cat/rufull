<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/5
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html ng-app="eleme" perf-error="desktop/" class="ng-scope">
<html ng-app="eleme" perf-error="desktop/" class="ng-scope">
<head>

    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="format-detection" content="telephone=no, email=no">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <link rel="apple-touch-icon-precomposed" href="">

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/service/pagevendor.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/service/pagemain.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/service/login-register.css" rel="stylesheet"/>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/js/service/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/service/bootstrap3/js/bootstrap.js"
            type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/service/login-register.js" type="text/javascript"></script>
    <meta name="keywords" content="麻章区广东海洋大学美食，麻章区广东海洋大学商家，麻章区广东海洋大学外卖">
    <script type="text/javascript">
        $("body").css("width", window.innerWidth);
        $(window).resize(function () {
            $("body").css("width", window.innerWidth);
        })
    </script>
</head>
<body>
<div class="container">
    <script type="text/javascript">
        $("body").css("width", window.innerWidth);
        $(window).resize(function () {
            $("body").css("width", window.innerWidth);
        })
    </script>
    <div class="modal fade login" id="loginModal">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">登陆方式</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">

                            <div class="division">
                                <div class="line l"></div>
                                <span>其中一个方式</span>
                                <div class="line r"></div>
                            </div>
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form method="post" action="/login" accept-charset="UTF-8">
                                    <input id="email" class="form-control loi" type="text" placeholder="手机/用户名/邮箱"
                                           name="email">
                                    <input id="password" class="form-control loi" type="password" placeholder="密码"
                                           name="password">
                                    <input class="btn btn-default btn-login loi" type="button" value="登陆"
                                           onclick="loginAjax()">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <form method="post" action="/login" accept-charset="UTF-8">
                                    <input id="email" class="form-control loi" type="text" placeholder="手机/用户名/邮箱"
                                           name="email">
                                    <input id="password" class="form-control loi" type="password" placeholder="密码"
                                           name="password">
                                    <input id="password_confirmation" class="form-control loi" type="password"
                                           placeholder="确认密码" name="password_confirmation">
                                    <input class="btn btn-default btn-register loi" type="submit" value="注册"
                                           name="commit" onclick="loginAjax()">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>打算
                                 <a href="javascript: showRegisterForm();">注册一个账号？</a>
                            </span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已经有一个账号？</span>
                        <a href="javascript: showLoginForm();">登陆</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <div>
        <header class="topbar">
            <%--<div class="container clearfix">
                <a href="/" class="topbar-item topbar-homepage focus">首页</a>
                <a href="" class="topbar-item">我的订单</a>
                <a href="" target="_blank" class="topbar-item cooperation">我想开店</a>
                <nav class="topbar-nav"><a class="topbar-nav-link" style="color:blue;" target="_blank" href="">规则中心</a>
                    <div class="topbar-nav-link" style="color:blue;">
                        <img src="../image/service/cart.png" style="height:20px;width:20px;margin-right:10px;"></img>
                        购物车
                        <div class="dropbox topbar-mobile-dropbox"><a href=""><img src="../image/service/fukuan.png"
                                                                                   style="height:50px;width:50px;"
                                                                                   class="topbar-nav-qrcode"
                                                                                   alt="我的购物车"></a></div>
                    </div>
                    <div class="topbar-profilebox">
                        <div class="topbar-profilebox">
                            <img src="../image/service/account.png" style="height:20px;width:20px; margin-right:10px;"/>
                            <a href="javascript:void(0)" onclick="openLoginModal();">
                                <c:if test="${empty user}">
                                    登录/注册
                                </c:if>
                            </a>
                            <c:if test="${!empty user}">
                                <font color="#4b0082">${sessionScope.user.nickname}</font>
                            </c:if>
                            <span class="topbar-profilebox-wrapper"><span
                                    class="topbar-profilebox-username"></span>
                               <img src="../image/service/infor.png" style="height:20px;width:20px;margin-left:5px;"/>

                               <div class="dropbox topbar-profilebox-dropbox">
							   <a href=" "><img src="../image/service/me.png"
                                                style="height:13px;width:13px;margin-right:5px;"/>个人中心</a>
							   <a href=" "><img src="../image/service/coll.png"
                                                style="height:13px;width:13px;margin-right:5px;"/>我的收藏</a>
							   <a href=" "><img src="../image/service/add.png"
                                                style="height:13px;width:13px;margin-right:5px;"/>我的地址</a>
							   <a href=" "><img src="../image/service/safe.png"
                                                style="height:13px;width:13px;margin-right:5px;"/>安全设置</a>
							   <a href=" "><img src="../image/service/service.png"
                                                style="height:13px;width:13px;margin-right:5px;"/>自助服务</a>
							   <a href="JavaScript:" ng-click="logout()"><img src="../image/service/out.png"
                                                                              style="height:13px;width:13px;margin-right:5px;"/>退出登录</a>
							   </div>
							 </span>
                        </div>
                    </div>
                </nav>
            </div>--%>


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
                            <li class="hidden-sm hidden-md "><a href="#">我的订单</a></li>
                            <li><a href="#">加盟合作</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="hidden-sm hidden-md"><a href="">规则中心</a></li>
                            <c:if test="${empty user}">
                                <li class="hidden-sm hidden-md">
                                    <a href="javascript:void(0)" style="color: indigo;" onclick="openLoginModal();">
                                        登录/注册
                                    </a></li>
                            </c:if>
                            <c:if test="${!empty user}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">${sessionScope.user.nickname}
                                        <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><span class="glyphicon glyphicon-user"
                                                              aria-hidden="true"></span> 个人中心</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-star"
                                                              aria-hidden="true"></span> 我的收藏</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-map-marker"
                                                              aria-hidden="true"></span> 我的地址</a></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                                            安全设置</a></li>
                                        <li class="divider" role="separator"></li>
                                        <li><a href="#"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                                            退出登录</a></li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>
</div>

<div role="main">
    <div class="container clearfix">
        <div class="location" ng-style="{visibility: geohash ? '' : 'hidden'}" role="navigation" location="">
            <span>当前位置:</span> <span class="location-current"><a class="inherit ng-binding" ng-href="/place/w7y2mfr4g2x"
                                                                 ubt-click="401" ng-bind="place.name || place.address"
                                                                 href=""> ${requestScope.address}</a></span> <span
                class="location-change"><a ubt-click="400" hardjump=""
                                           href="${pageContext.request.contextPath}/changeAddressUI">[切换地址]</a><ul
                class="dropbox location-dropbox" ubt-visit="398">
				<li class="arrow"></li>
				<li class="changelocation"><a href="/home">修改收货地址<span
                        class="icon-location"></span></a></li></ul></span></div>
        <div class="place-search" role="search"><label
                for="globalsearch">搜索商家或美食</label><input id="globalsearch"
                                                         class="place-search-input ng-pristine ng-valid" autocomplete=""
                                                         placeholder="搜索商家,美食..."><a href=""><img
                src="../image/service/search.png" style="width:15px;height:15px;margin-right:20px"></a>
            <div class="searchbox">
                <div class="searchbox-list searchbox-rstlist">
                    <ul>
                    </ul>
                </div>
                <div class="searchbox-list searchbox-foodlist ">
                    <ul></ul>
                </div>
            </div>
        </div>
    </div>
    <div class="place-tab clearfix container">
        <div class="place-fetchtakeout"></div>
    </div>
    <div class="container">
        <div class="excavator" style="width:100%">
            <div class="excavator-filter"><span class="excavator-filter-name">商店分类:</span>
                <a class="excavator-filter-item  focus"
                   href="javascript:" ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)"
                   ubt-click="380">全部商家</a>
                <a class="excavator-filter-item  active" href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name" ng-click="changeCategory(category)" ubt-click="380">美食</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">快餐</a>

                <a class="excavator-filter-item "
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">特色菜系</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">异国料理</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">夜宵</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">甜饮</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">蔬果</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">商店超市</a>
                <a class="excavator-filter-item"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">鲜花</a>
                <a class="excavator-filter-item ng-binding"
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">早餐</a>
                <a class="excavator-filter-item "
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">午餐</a>
                <a class="excavator-filter-item "
                   href="javascript:"
                   ng-repeat="category in rstCategories"
                   ng-class="{'focus': clickedCategory === category.id &amp;&amp; (!clickedCategory || clickedCategory < 0) , 'active': activeCategory === category.id, 'premium': category.id === -10001 &amp;&amp; !pumStream}"
                   ng-bind="category.name"
                   ng-click="changeCategory(category)" ubt-click="380">晚餐</a>
            </div>
        </div>
        <div class="place-rstbox clearfix">
            <div class="clearfix"
                 style="height:auto;"><a href=" " data-bidding="" target="_blank" class="rstblock">
                <div class="rstblock-logo"><img
                        src="//fuss10.elemecdn.com/e/07/2a9f3e50201db18a7702638958e5ajpeg.jpeg?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                        width="70" height="70" alt="麻辣煮题" class="rstblock-logo-icon"><span
                        class="rstblock-left-timeout">45+ 分钟</span></div>
                <div class="rstblock-content">
                    <div class="rstblock-title">麻辣煮题</div>
                    <div class="rating-star r8"></div>
                    <span class="rstblock-monthsales">月售1612单</span>
                    <div class="rstblock-cost">免配送费</div>
                    <div class="rstblock-activity"></div>
                </div>
            </a><a href="/shop/1423546" data-bidding="" target="_blank" class="rstblock">
                <div class="rstblock-logo"><img
                        src=" //fuss10.elemecdn.com/7/fb/ef04af49d56f2507523164760acc7png.png?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                        width="70" height="70" alt="royaltea 皇茶" class="rstblock-logo-icon">
                    <span class="rstblock-left-timeout">38 分钟</span></div>
                <div class="rstblock-content">
                    <div class="rstblock-title">royaltea 皇茶</div>
                    <div class="rating-star"></div>
                    <span class="rstblock-monthsales">月售1558单</span>
                    <div class="rstblock-cost">免配送费</div>
                    <div class="rstblock-activity"></div>
                </div>
            </a><a href="" data-bidding="" target="_blank" class="rstblock">
                <div class="rstblock-logo"><img
                        src=" //fuss10.elemecdn.com/b/6b/f92672d6cdbb3c483fc5b28b11e6dpng.png?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                        width="70" height="70" alt="台湾贡茶" class="rstblock-logo-icon">
                    <span class="rstblock-left-timeout">38 分钟</span></div>
                <div class="rstblock-content">
                    <div class="rstblock-title">台湾贡茶</div>
                    <div class="rating-star"></div>
                    <span class="rstblock-monthsales">月售681单</span>
                    <div class="rstblock-cost">免配送费</div>
                    <div class="rstblock-activity"></div>
                </div>
            </a><a href=" " data-bidding="" target="_blank" class="rstblock">
                <div class="rstblock-logo"><img
                        src=" //fuss10.elemecdn.com/3/ee/eec80831f7fcdad79fb6c112523c1jpeg.jpeg?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                        width="70" height="70" alt="约吗" class="rstblock-logo-icon">
                    <span class="rstblock-left-timeout">37 分钟</span></div>
                <div class="rstblock-content">
                    <div class="rstblock-title">约吗</div>
                    <div class="rating-star r10"></div>
                    <span class="rstblock-monthsales">月售401单</span>
                    <div class="rstblock-cost">免配送费</div>
                    <div class="rstblock-activity"></div>
                </div>
            </a>
                <a href=" " data-bidding="" target="_blank" class="rstblock">
                    <div class="rstblock-logo"><img
                            src="//fuss10.elemecdn.com/b/a6/e517cd1d2ebdd6b77c0d3f8ad888fjpeg.jpeg?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                            width="70" height="70" alt="川味凉拌菜" class="rstblock-logo-icon"><span
                            class="rstblock-left-timeout">45+ 分钟</span></div>
                    <div class="rstblock-content">
                        <div class="rstblock-title">川味凉拌菜</div>
                        <div class="rating-star r0"></div>
                        <span class="rstblock-monthsales">月售160单</span>
                        <div class="rstblock-cost">免配送费</div>
                        <div class="rstblock-activity"></div>
                    </div>
                </a>
                <a href=" " data-bidding="" target="_blank"
                   class="rstblock-closed rstblock">
                    <div class="rstblock-logo"><img
                            src="//fuss10.elemecdn.com/4/88/1e047c43a1650bc2a99ac1e7fc87ejpeg.jpeg?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                            width="70" height="70" alt="重庆小面" class="rstblock-logo-icon"><span
                            class="rstblock-left-timeout">45+ 分钟</span></div>
                    <div class="rstblock-content">
                        <div class="rstblock-title">重庆小面</div>
                        <div class="rating-star r9"></div>
                        <span class="rstblock-monthsales">月售2559单</span>
                        <div class="rstblock-cost">免配送费</div>
                        <div class="rstblock-relaxing">商家休息,暂不接单</div>
                    </div>
                </a>
                <a href=" " data-bidding="" target="_blank"
                   class="rstblock-closed rstblock">
                    <div class="rstblock-logo"><img
                            src="//fuss10.elemecdn.com/8/ea/177684647c2dbdb4bf42329e8de31jpeg.jpeg?imageMogr2/thumbnail/70x70/format/webp/quality/85"
                            width="70" height="70" alt="味厨" class="rstblock-logo-icon"><span
                            class="rstblock-left-timeout">45+ 分钟</span>
                    </div>
                    <div class="rstblock-content">
                        <div class="rstblock-title">味厨</div>
                        <div class="rating-star r5"></div>
                        <span class="rstblock-monthsales">月售3177单</span>
                        <div class="rstblock-cost">免配送费</div>
                        <div class="rstblock-relaxing">商家休息,暂不接单</div>
                    </div>
                </a>

            </div>

        </div>
    </div>
</div>
</div>
<footer class="footer" role="contentinfo">
    <div class="container clearfix">
        <div class="footer-link"><h3 class="footer-link-title">用户帮助</h3><a class="footer-link-item" href=" "
                                                                           target="_blank">常见问题</a>
            <a class="footer-link-item" href=" " target="_blank">服务中心</a></div>
        <div class="footer-link"><h3 class="footer-link-title">商务合作</h3><a class="footer-link-item" href=" "
                                                                           target="_blank">我要开店</a> <a
                class="footer-link-item" href=" " target="_blank">加盟协议</a></div>
        <div class="footer-link"><h3 class="footer-link-title">关于我们</h3><a class="footer-link-item" href=" "
                                                                           target="_blank">RuFull介绍</a> <a
                class="footer-link-item" href=" " target="_blank">一起开店</a>
            <a class="footer-link-item">规则中心</a></div>
        <div class="footer-contect">

            <div class="footer-contect-item">24小时客服热线 : <a class="inherit" href="">*******</a></div>

        </div>
    </div>
</footer>

</body>
</html>


