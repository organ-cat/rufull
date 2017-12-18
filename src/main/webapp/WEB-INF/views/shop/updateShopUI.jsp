<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/18
  Time: 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>


<head>
    <title>商店创建页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/fileinput.css">

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/business/bootstrap-datetimepicker.css">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/bootstrap-select.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/city-picker.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/business/bootstrapValidator.min.css">


</head>
<body>
<div class="container">
    <fieldset>
        <legend><h1 class="text-info">商家创建</h1></legend>
    </fieldset>

    <div>
        <form id="shopForm" action="${pageContext.request.contextPath}/shop/updateShop" method="post" class="form-horizontal"
              enctype="multipart/form-data">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店名称:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shopName" class="form-control" value="${requestScope.shop.shopName}">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店类型:</label>
                <div class="col-sm-4 ">
                    <select class="selectpicker" id="shopTypeSelect" name="shopType">
                        <option value="0">美食、异国料理、特色菜</option>
                        <option value="1">甜品、饮品、小吃</option>
                        <option value="2">午餐、晚餐、早餐、下午茶、夜宵</option>
                        <option value="3">快餐、便当</option>
                        <option value="4">果蔬生鲜</option>
                        <option value="5">超市商店</option>
                        <option value="6">鲜花绿植</option>
                        <option value="7">医药健康</option>
                    </select>
                </div>

            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店电话:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shopPhone" class="form-control" value="${requestScope.shop.shopPhone}">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">配送时间:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shippingTime" class="form-control" value="${requestScope.shop.shippingTime}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">营业时间:</label>
                <div class="col-sm-1 ">
                    <input type="text" name="shippingTimePart" class="form-control" id="morningshippingTimeStart">
                </div>
                <div class="col-sm-1 ">
                    <input type="text" name="shippingTimePart" class="form-control" id="morningshippingTimeEnd">
                </div>
                <div class="col-sm-1 ">
                    <input type="text" name="shippingTimePart" class="form-control" id="noonshippingTimeStart">

                </div>
                <div class="col-sm-1 ">
                    <input type="text" name="shippingTimePart" class="form-control" id="noonshippingTimeEnd">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">支持支付方式:</label>
                <div class="col-sm-4 ">
                    <!-- <input type="text" name="" class="form-control"> -->
                    <select class="selectpicker" id="supportPaySelect" name="supportPayment">
                        <option value="0">在线支付和货到付款</option>
                        <option value="1">在线支付</option>
                        <option value="2">货到付款</option>
                    </select>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">配送距离:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shippingDistance" class="form-control" value="${requestScope.shop.shippingDistance}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">配送起价:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shippingPrice" class="form-control" value="${requestScope.shop.shippingPrice}">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">配送费用:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="shippingFee" class="form-control" value="${requestScope.shop.shippingFee}">
                </div>
            </div>
            <%--<div class="form-group">--%>
            <%--<label class="col-sm-4 control-label text-info">营业状态:</label>--%>
            <%--<div class="col-sm-4 ">--%>
            <%--<input type="hidden" name="" class="form-control" value="0">--%>
            <%--</div>--%>
            <%--</div>--%>
            <input type="hidden" name="operateState" class="form-control" value="0">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商家头像:</label>
                <div class="col-md-4 tl th">
                    <input name="file" type="file" multiple class="file" data-show-upload="false"
                           data-show-caption="true" >
                    <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商家公告:</label>
                <div class="col-md-4 tl th">
                    <textarea name="announcement" rows="15" cols="60">${shop.announcement}</textarea>
                </div>
            </div>

            <%--用户定位--%>
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">请输入用户详细地址进行定位:</label>
                <div id="distpicker" class="col-md-4 tl th">
                    <div class="form-group">
                        <div style="position: relative;" class="col-md-12 tl th">
                            <input name="detailAddress" id="address" class="form-control" type="text" value=""
                                   onblur="searchByStationName()">
                        </div>
                        <div id="searchResultPanel"
                             style="border:1px solid #C0C0C0;width:250px;height:auto; display:none;"></div>
                    </div>

                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店详细地址:</label>
                <div class="col-sm-4 ">
                    <input id="detailAddress" type="text" name="address" class="form-control" readonly="true" value="{${shop.address}" >
                </div>
            </div>

            <input type="hidden" name="businessId" value="${shop.business.id}">
            <input type="hidden" name="id" value="${shop.id}">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店在地图上维度:</label>
                <div class="col-sm-4 ">
                    <input id="lat" type="text" name="lat" class="form-control" readonly="true">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商店在地图上经度:</label>
                <div class="col-sm-4 ">
                    <input id="lon" type="text" name="lon" class="form-control" readonly="true">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6 col-md-offset-3">
                    <input class="form-control btn btn-primary" id=""
                           value="立&nbsp;&nbsp;即&nbsp;&nbsp;创&nbsp;&nbsp;建" type="submit">
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-6 col-md-offset-3">
                    <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
                </div>
            </div>


        </form>

    </div>


</div>

<div id="container" style="height:0px;width:0px;"></div>
</body>
<%--bootstrap--%>
<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<%--文件上传--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput_locale_zh.js"></script>
<%--时间组件--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/moment-with-locales.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/business/bootstrap-datetimepicker.js"></script>

<%--下拉列表--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/defaults-zh_CN.js"></script>

<%--百度地图、用户定位--%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi"></script>
<script src="${pageContext.request.contextPath}/js/business/shopSettle.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/shopSettleValidator.js"></script>
