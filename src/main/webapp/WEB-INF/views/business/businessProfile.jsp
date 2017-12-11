<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/7
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>商家主页</title>
</head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/style.css">

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
                <li class="active"><a href="#">我的订单</a></li>
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
    <div class="container-fluid">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group text-center">
                        <li class="list-group-item"><strong><a class="text-muted" href="#" class=""><span
                                class="glyphicon glyphicon-home" aria-hidden="true"></span>商家中心</a></strong></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-home"
                                                                  aria-hidden="true"></span>商家商店</strong></li>
                        <li class="list-group-item list-group-item-info"><a class="text-muted" href="#">我的商店</a></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list"
                                                                  aria-hidden="true"></span>未接订单</strong></li>
                        <li class="list-group-item"><a class="text-muted" href="#">已接订单</a></li>
                        <li class="list-group-item"><a class="text-muted" href="#">完成订单</a></li>
                        <li class="list-group-item"><a class="text-muted" href="#">退单记录</a></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <li class="list-group-item"><a class="text-muted" href="#">个人资料</a></li>
                        <li class="list-group-item"><a class="text-muted" href="#">入驻资料</a></li>
                        <li class="list-group-item"><a class="text-muted" href="#">安全中心</a></li>
                        <li class="list-group-item"><a class="text-muted" href="#">修改密码</a></li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="">
                        <div class="shoptTitle">
                            <h1 class="">
                                <small><b>我的商店</b></small>
                            </h1>
                            <div class="addProduct">
                                <c:if test="${shop} == null">
                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/shop/addShopUI"
                                       role="button">创建商店</a>
                                </c:if>
                                <a class="btn btn-info" href="${pageContext.request.contextPath}/product/addProductUI"
                                   role="button">创建商品</a>
                            </div>
                        </div>

                    </div>

                    <div class="container-fluid" id="content">
                        <div class="panel panel-collapse">

                            <table class="table table-hover text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">商品编号</th>
                                    <th class="text-center">商品信息</th>
                                    <th class="text-center"></th>
                                    <th class="text-center">商品价格（元）</th>
                                    <th class="text-center">状态</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${shop.productList}" var="product" varStatus="s">
                                    <c:if test="${product.status == 0 || product.status == 1}">
                                        <tr>
                                            <td>
                                                <br>
                                                <h4><strong>${s.count}</strong></h4>
                                            </td>
                                            <td>

                                                <img class="img-responsive center-block img-circle" alt="商品头像"
                                                     src="${pageContext.request.contextPath}/upload/business/${product.photo}">

                                            </td>
                                            <td>
                                                <br>
                                                <h4><strong>${product.productName}</strong></h4>
                                                </a>

                                            </td>
                                            <td>
                                                <br>
                                                <h4><strong>${product.price}</strong></h4>

                                            </td>
                                            <td>
                                                <br/>
                                                <h4 class="order-status-unpaid">
                                                    <c:choose>
                                                        <c:when test="${product.status == 0}">
                                                            <b class="text-success">正常</b>
                                                        </c:when>
                                                        <c:when test="${product.status == 1}">
                                                            <b class="text-danger">售罄</b>
                                                        </c:when>
                                                    </c:choose>

                                                </h4>

                                            </td>
                                            <td>
                                                <div class="btn-group-vertical btn-group-sm">
                                                    <a class="btn btn-success order-btn" href="show.html" role="button">更改状态</a>
                                                    <a class="btn btn-warning order-btn" href="#评价订单"
                                                       role="button">更改商品</a>
                                                    <a class="btn btn-info order-btn" href="#评价订单"
                                                       role="button">商品详情</a>
                                                    <a class="btn btn-danger order-btn" href="#评价订单"
                                                       role="button">删除商品</a>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <nav aria-label="Page navigation">
                        <ul class="pagination navbar-right">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li class="disabled"><a href="#">...</a></li>
                            <li><a href="#">13</a></li>
                            <li>
                                <a href="#" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
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
