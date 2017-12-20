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
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                <img class="img-responsive center-block" alt="饱了么" src="">
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/business/showBusinessProfile">商家中心</a></li>
                <li><a href="${pageContext.request.contextPath}/business/joinBusiness">加盟合作</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/service/getAgreement">规则中心</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">${business.nickname} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <c:if test="${shop != null}">
                            <li><a href="${pageContext.request.contextPath}/business/showBusinessProfile"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 我的商店</a></li>
                            <li><a href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID"><span class="glyphicon glyphicon-star" aria-hidden="true"></span>我的订单</a></li>
                        </c:if>
                        <li><a href="${pageContext.request.contextPath}/business/showBusinessSettleInfo"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> 入驻资料</a>
                        </li>
                        <c:if test="${shop != null}">
                            <li><a href="${pageContext.request.contextPath}/business/showAccountAndShopInfo"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>个人资料</a></li>
                        </c:if>
                        <li class="divider" role="separator"></li>
                        <li><a href="${pageContext.request.contextPath}/business/loginOut"><span class="glyphicon glyphicon-off" aria-hidden="true"></span> 退出登录</a></li>
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

                            <li class="list-group-item "><strong><span class="glyphicon glyphicon-home"
                                                                      aria-hidden="true"></span>商家商店</strong></li>
                            <li class="list-group-item list-group-item-info"><a class="text-muted" href="${pageContext.request.contextPath}/business/showBusinessProfile">我的商店</a></li>
                        <c:if test="${shop != null}">
                            <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list"
                                                                      aria-hidden="true"></span>商家订单</strong></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID">未接订单</a></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=ACCEPTED">已接订单</a></li>
                            <li class="list-group-item"><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=AUDITING">退单记录</a></li>
                            <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=COMPLETED">完成订单</a></li>
                        </c:if>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <c:if test="${shop != null}">
                            <li class="list-group-item"><a class="text-muted"
                                                           href="${pageContext.request.contextPath}/business/showAccountAndShopInfo">个人资料</a>
                            </li>
                        </c:if>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showBusinessSettleInfo">入驻资料</a>
                        </li>

                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="">
                        <div class="shoptTitle">
                            <h1 class="">
                                <small><b>我的商店</b></small>
                            </h1>
                            <h3>
                                <c:if test="${sessionScope.shop.operateState == 0}">
                                    <small><span class="btn-success">营业中</span></small>
                                </c:if>
                                <c:if test="${sessionScope.shop.operateState == 1}">
                                    <small><span class="btn-warning">休息中</span></small>
                                </c:if>
                            </h3>
                            <div class="addProduct">
                                <c:if test="${sessionScope.shop == null}">
                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/shop/addShopUI"
                                       role="button">创建商店</a>
                                </c:if>
                                <c:if test="${sessionScope.shop != null}">
                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/product/addProductUI"
                                       role="button">创建商品</a>
                                </c:if>
                                <c:if test="${sessionScope.shop != null}">
                                    <a class="btn btn-info" href="${pageContext.request.contextPath}/shop/updateShopOperateState/${sessionScope.shop.id}/${sessionScope.shop.operateState}"
                                       role="button">更换状态</a>
                                </c:if>

                            </div>
                        </div>

                    </div>

                    <div class="container-fluid" id="content">
                        <div class="panel panel-collapse">

                            <table class="table table-hover text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">商品信息</th>
                                    <th class="text-center"></th>
                                    <th class="text-center">商品价格（元）</th>
                                    <th class="text-center">状态</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.shop.productList}" var="product" varStatus="s" step='1'>
                                    <c:if test="${product.status == 0 || product.status == 1}">
                                        <tr>
                                            <td>

                                                <img class=" center-block img-circle product_img" alt="商品头像"
                                                     src="${pageContext.request.contextPath}/upload/product/${product.photo}">

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
                                                    <a class="btn btn-success order-btn" href="${pageContext.request.contextPath}/product/updateProductStatus/${sessionScope.shop.id}/${product.id}/${product.status}" role="button">更改状态</a><br>
                                                    <a class="btn btn-warning order-btn" href="${pageContext.request.contextPath}/product/updateProductUI/${product.id}"
                                                       role="button">更改商品</a><br>
                                                    <a class="btn btn-danger order-btn" href="${pageContext.request.contextPath}/product/deleteProductStatus/${sessionScope.shop.id}/${product.id}/${product.status}"
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

<%--催单请求--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">催单请求</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button id="replyBtn" type="button" class="btn btn-primary">尽早发货</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/index.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.2/stomp.min.js"></script>


<script type="text/javascript">


</script>

</html>
