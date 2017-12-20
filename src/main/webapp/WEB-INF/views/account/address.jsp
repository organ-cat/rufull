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
    <spring:url value="/complaint/showAccount" var="showComplaint"/>
    <spring:url value="/address/add" var="add_address_url"/>
    <spring:url value="/address/update" var="update_address_url"/>
    <spring:url value="/account/deleteFootprint" var="deleteFootprintUrl"/>
    <spring:url value="/account/showshowshow" var="jiangShowShopUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>
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
    <!-- jinag css -->
    <spring:url value="/resources/css/service/pagevendor.css" var="pagevendor_css_url"/>
    <link rel="stylesheet" href="${pagevendor_css_url}"/>
    <spring:url value="/resources/css/service/pagemain.css" var="pagemain_css_url"/>
    <link rel="stylesheet" href="${pagemain_css_url}"/>
    <spring:url value="/resources/css/account/font-awesome.css" var="font_awesome_css_url"/>
    <link rel="stylesheet" href="${font_awesome_css_url}"/>
    <!-- center css -->
    <spring:url value="/resources/css/account/center.css" var="center_css_url"/>
    <link rel="stylesheet" type="text/css" href="${center_css_url}"/>
    <!-- address css -->
    <spring:url value="/resources/css/account/address.css" var="address_css_url"/>
    <link rel="stylesheet" type="text/css" href="${address_css_url}"/>
    <!-- address js -->
    <spring:url value="/resources/js/account/address.js" var="address_js_url"/>
    <script src="${address_js_url}" type="text/javascript"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi"></script>
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
                        <a class="text-muted" href="${showPlaceUrl}/需要一组字符串不知道干嘛用的">麻章区广东海洋大学(点击后跳到附近商店列表页面)</a>
                        <a href="${homeUrl}">[切换地址]</a>
                    </li>
                    <li>地址管理</li>
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
                        <%--会自动调节高度--%>
                            <h3>地址管理</h3>
                            <br/>
                            <br/>
<%--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--%>
                        <div class="container-fluid" id="content">
                            <div class="row">
                                <div id="footprint">
                                    <c:forEach items="${addressList}" var="address">
                                        <div class="addressShow">
                                            <span class="addresssChange">
                                                <a href="javascript: updateAddress(${address.id})"  class="updateAddress">修改</a>
                                                <a href="${pageContext.request.contextPath}/address/delete?id=${address.id}&accountId=${account.id}" class="deleteAddress">删除</a>
                                            </span>
                                            <a href="#" target="_self">
                                                <div class="rstblock-content">
                                                    <div class="rstblock-title"><b>${address.receiver}<b/></div>
                                                    <div class="rstblock-cost">${address.detail}</div>
                                                    <span class="rstblock-monthsales">${address.phone}</span>
                                                </div>
                                            </a>
                                        </div>
                                    </c:forEach>

                                    <div class="addAddress" onclick="addAddress()">
                                            <span id="deleteLabel" class="glyphicon glyphicon-plus" >添加新地址地址</span>
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

    <div class="modal fade" id="addAddressId">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">添加地址</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form method="post" action="${add_address_url}" accept-charset="UTF-8">
                                    <input type="hidden" name="accountId" value="${account.id}"/>
                                    姓名<input class="form-control" type="text" placeholder="您的名字" name="receiver">
                                    手机<input id="receiverPhone" class="form-control" type="text" placeholder="您的手机" name="phone">
                                    <div style="display:none;" id="l-map"></div>
                                    位置<input class="form-control" id="address" type="text" placeholder="请输入小区、大厦或学校" name="location">
                                    <div>
                                        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto;z-index: 107000; display:none;"></div>
                                    </div>
                                    详细地址<input class="form-control" type="text" placeholder="单位、门牌号" name="detail">
                                    <br/>
                                    <span class="defaultSpan">是否是默认地址</span>
                                    <label for="AddYes">是</label>
                                    <input type="radio" id="AddYes" class="radioChecked" checked="checked" name="status" value="1" />
                                    <label for="AddNo">否</label>
                                    <input type="radio" id="AddNo" class="radioChecked" name="status" value="0" />
                                    <br/><br/>
                                    <input id="saveBtnAdd" class="saveBtn" type="submit" value="保存">
                                    <input class="cancelBtn" onclick="hideView()"  type="button" value="取消">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="updateAddressId">
        <div class="modal-dialog login animated">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">修改地址</h4>
                </div>
                <div class="modal-body">
                    <div class="box">
                        <div class="content">
                            <div class="error"></div>
                            <div class="form loginBox">
                                <form method="post" action="${update_address_url}" accept-charset="UTF-8">
                                    <input id="accountId" type="hidden" name="accountId" value="${account.id}"/>
                                    <input id="id" type="hidden" name="id"/>
                                    姓名<input id="receiver"  class="form-control" type="text" placeholder="您的名字" name="receiver">
                                    手机<input id="phone" class="form-control" type="text" placeholder="您的手机" name="phone">

                                    <div style="display:none;" id="l-map"></div>
                                    位置<input id="location" class="form-control" type="text" placeholder="请输入小区、大厦或学校" name="location">
                                    <div>
                                        <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto;z-index: 107000; display:none;"></div>
                                    </div>

                                    详细地址<input id="detail" class="form-control" type="text" placeholder="单位、门牌号" name="detail">
                                    <br/>
                                    <span class="defaultSpan">是否是默认地址</span>
                                    <label for="radioCheckedTrue">是</label>
                                    <input type="radio" id="radioCheckedTrue" name="status" value="1" />
                                    <label for="radioCheckedFalse">否</label>
                                    <input type="radio" id="radioCheckedFalse" name="status" value="0" />
                                    <br/>
                                    <input id="saveBtnUpdate" class="saveBtn" type="submit" value="保存">
                                    <input class="cancelBtn" onclick="hideView()"  type="button" value="取消">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        // 百度地图API功能
        function G(id) {
            return document.getElementById(id);
        }

        var map = new BMap.Map("l-map");
        map.centerAndZoom("广东",12);                   // 初始化地图,设置城市和地图级别。

        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "address"
                ,"location" : map
            });

        var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
            {"input" : "location"
                ,"location" : map
            });
        ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
            var str = "";
            var _value = e.fromitem.value;
            var value = "";
            if (e.fromitem.index > -1) {
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

            value = "";
            if (e.toitem.index > -1) {
                _value = e.toitem.value;
                value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            }
            str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
            G("searchResultPanel").innerHTML = str;
        });

        var myValue;
        ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
            var _value = e.item.value;
            myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
            G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

            setPlace();
        });

        function setPlace(){
            map.clearOverlays();    //清除地图上所有覆盖物
            function myFun(){
                var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
                map.centerAndZoom(pp, 18);
                map.addOverlay(new BMap.Marker(pp));    //添加标注
            }
            var local = new BMap.LocalSearch(map, { //智能搜索
                onSearchComplete: myFun
            });
            local.search(myValue);
        }
    </script>
</body>
</html>