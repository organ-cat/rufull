<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/5
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>

<head>

    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="麻章区广东海洋大学美食，麻章区广东海洋大学商家，麻章区广东海洋大学外卖">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/css/service/pagevendor.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/service/pagemain.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/business/showAllShop.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/account/login-register.css" rel="stylesheet">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

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
<div class="container">
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

                                <form method="post" accept-charset="UTF-8">
                                    <input id="username" class="form-control loi" type="text" placeholder="手机/用户名/邮箱" name="username">
                                    <input id="loginPassword" class="form-control loi" type="password" placeholder="密码" name="password">

                                    <div id="hideDiv">
                                        <input id="remoteCode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                        <input id="loginCodeBtn" class="loh" type="button" readonly value="免费获取验证码">
                                    </div>

                                    <input id="loginButton" class="btn btn-default loi btn-login" type="button" value="登陆">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">
                                <!--使用了c标签-->
                                <!--<form method="post" action="<c:url value="/account/accountRegister"/>" accept-charset="UTF-8"> -->
                                <form method="post" action="">
                                    <input id="phone" class="form-control loi" type="text" placeholder="手机/邮箱" name="phone">
                                    <input id="registerPassword" class="form-control loi" type="password" placeholder="您的密码" name="password">
                                    <input id="confirmationPassword" class="form-control loi" type="password" placeholder="确认密码" name="password_confirmation">
                                    <input id="checkcode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                    <input id="getCheckCodeButton" class="loh" type="button" value="免费获取验证码">
                                    <input id="registerButton" class="btn btn-default btn-register  loi" type="submit" value="注册" >
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>打算
                                 <a href="javascript: showRegisterForm();" class="alink">注册一个账号？</a>
                            </span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已经有一个账号？</span>
                        <a href="javascript: showLoginForm();" class="alink">登陆</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <div>
        <header class="topbar">
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
                            <li class="hidden-sm hidden-md"><a href="">规则中心</a></li>
                            <c:if test="${empty account}">
                                <li class="hidden-sm hidden-md">
                                    <a href="javascript:void(0)" style="color: indigo;" onclick="openLoginModal();">
                                        登录/注册
                                    </a></li>
                            </c:if>

                            <c:if test="${!empty account}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-haspopup="true" aria-expanded="false">${sessionScope.account.nickname}
                                        <span class="caret"></span>
                                    </a>
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
                                                                 href=""> ${address}</a>
            </span>

            <span
                    class="location-change"><a ubt-click="400" hardjump=""
                                               href="${pageContext.request.contextPath}/changeAddressUI">[切换地址]</a><ul
                    class="dropbox location-dropbox" ubt-visit="398">
				<li class="arrow"></li>
				<li class="changelocation"><a href="/home">修改收货地址<span
                        class="icon-location"></span></a></li></ul>
            </span>
        </div>

        <div class="place-search" role="search">
            <label
                    for="globalsearch">搜索商家或美食
            </label>
            <input id="globalsearch"
                   class="place-search-input ng-pristine ng-valid" autocomplete=""
                   placeholder="搜索商家,美食...">

            <a  href="#" onclick="searchShopAndFood()">
                <img id="searchShopAndFoodImg"  src="${pageContext.request.contextPath}/image/service/search.png"
                     style="width:15px;height:15px;margin-right:20px"/>
            </a>
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
            <div id="shopType" class="excavator-filter"><span class="excavator-filter-name">商店分类:</span>
                <a class="excavator-filter-item  focus"
                   href="javascript:"
                   onclick="getDifferentTypeShop(8,this)">全部商家</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(0,this)">美食</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(3,this)">快餐</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(0,this)">特色菜系</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(0,this)">异国料理</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(2,this)">夜宵</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(1,this)">甜饮</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(4,this)">蔬果</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(5,this)">商店超市</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(6,this)">鲜花</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(2,this)">早餐</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(2,this)">午餐</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(2,this)">晚餐</a>

                <a class="excavator-filter-item"
                   href="javascript:"
                   onclick="getDifferentTypeShop(7,this)">医药健康</a>
            </div>
        </div>
        <div class="place-rstbox clearfix">
            <div id="shopListDiv" class="clearfix"
                 style="height:auto;">
            </div>

        </div>
    </div>
</div>

<footer class="footer" role="contentinfo">
    <div class="container clearfix">
        <div class="footer-link">
            <h3 class="footer-link-title">用户帮助</h3>
            <a class="footer-link-item" href=" "
               target="_blank">常见问题
            </a>
            <a class="footer-link-item" href=" " target="_blank">服务中心</a>
        </div>

        <div class="footer-link">
            <h3 class="footer-link-title">商务合作</h3>
            <a class="footer-link-item" href=" "
               target="_blank">我要开店</a> <a
                class="footer-link-item" href=" " target="_blank">加盟协议
            </a>
        </div>

        <div class="footer-link">
            <h3 class="footer-link-title">关于我们</h3>
            <a class="footer-link-item" href=" "
               target="_blank">RuFull介绍</a>
            <a class="footer-link-item" href=" " target="_blank">一起开店</a>
            <a class="footer-link-item">规则中心</a>
        </div>

        <div class="footer-contect">
            <div class="footer-contect-item">24小时客服热线 :
                <a class="inherit" href="">*******</a>
            </div>
        </div>
    </div>
</footer>
<%--百度地图需要使用到的组件--%>
<div id="container" style="height:0px;width:0px;"></div>
</body>

<%--bootstrap/Jquery--%>
<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>

<%--百度地图--%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi"></script>
<script src="${pageContext.request.contextPath}/js/business/showAllShop.js"></script>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script src="${pageContext.request.contextPath}/js/account/login-register.js"></script>
<script>
    //获取经纬度
    var uLat = "${lng}";
    var uLon = "${lon}";
    //获取到所有的商家，将商家信息放置到页面中
    var shopList = ${requestScope.shopList};
    //项目路径
    var contextPath = "${pageContext.request.contextPath}";
    //商家评价
    var shopEvaluation = ${requestScope.shopEvaluation};
    //商家销售量
    var shopSales = ${requestScope.ShopSales};

    console.log(shopSales[0]);

</script>
</html>


