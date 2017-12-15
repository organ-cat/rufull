<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/12
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商家主页</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/businessInfo.css">

<body>

<nav class="navbar navbar-default">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
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
                <li class="hidden-sm hidden-md"><a href="#">首页</a></li>
                <li class="active"><a href="#">商家中心</a></li>
                <li><a href="#">加盟合作</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-sm hidden-md"><a href="">规则中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">用户名 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 个人中心</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 我的收藏</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 我的地址</a>
                        </li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 安全设置</a></li>
                        <li class="divider" role="separator"></li>
                        <li><a href="#"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 主界面 -->
<div id="main">
    <div class="container-fluid ">
        <div class="container-fluid ">
            <div class="row ">
                <div class="col-md-2 bg-warning">
                    <ul class="list-group text-center ">

                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-home"
                                                                  aria-hidden="true"></span>商家商店</strong></li>
                        <li class="list-group-item "><a class="text-muted"
                                                        href="${pageContext.request.contextPath}/business/showBusinessProfile">我的商店</a>
                        </li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list"
                                                                  aria-hidden="true"></span>商家订单</strong></li>
                        <li class="list-group-item "><a class="text-muted"
                                                        href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID">未接订单</a>
                        </li>
                        <li class="list-group-item "><a class="text-muted"
                                                        href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=ACCEPTED">已接订单</a>
                        </li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=AUDITING">退单记录</a>
                        </li>
                        <li class="list-group-item "><a class="text-muted"
                                                        href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=COMPLETED">完成订单</a>
                        </li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showAccountAndShopInfo">个人资料</a>
                        </li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showBusinessSettleInfo">入驻资料</a>
                        </li>
                        <li class="list-group-item list-group-item-info"><a class="text-muted"
                                                                            href="${pageContext.request.contextPath}/business/resetPassword">修改密码</a>
                        </li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10 bg-warning resetpassword">
                    <div class="page-header">
                        <div class=" shoptTitle">
                            <h1><span class="label label-default">重置密码</span></h1>
                        </div>
                    </div>
                    <!-- 头像 -->
                    <div class="col-md-2">
                        <a href="#" class="photo_a">
                            <img class="businessPhoto img-circle"
                                 src="${pageContext.request.contextPath}/upload/account/${sessionScope.shop.shopPhoto}">
                            <p>头像</p>
                        </a>
                    </div>
                    <div class="col-md-10">
                        <form>
                            <nav class="row">
                                <div class="form-group col-md-7">
                                    <h4><label>旧密码:</label></h4>
                                    <input type="email" class="form-control" id="exampleInputEmail1"
                                           placeholder="password">
                                </div>

                                <div class="form-group col-md-7">
                                    <h4><label>新密码:</label></h4>
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                           placeholder="Password">
                                </div>

                                <div class="form-group col-md-7">
                                    <h4><label>重复密码:</label></h4>
                                    <input type="password" class="form-control" id="exampleInputPassword1"
                                           placeholder="Password">
                                </div>

                                <div class="offset-md-4 col-md-6 ">
                                    <button type="submit" class="btn btn-default">提交</button>
                                    <button type="reset" class="btn btn-default">重置</button>
                                </div>
                            </nav>
                        </form>
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

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>
</html>