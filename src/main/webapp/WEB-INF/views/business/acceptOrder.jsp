<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/12
  Time: 12:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/">首页</a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/business/showBusinessProfile">商家中心</a></li>
                <li><a href="${pageContext.request.contextPath}/business/joinBusiness">加盟合作</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden-sm hidden-md"><a href="${pageContext.request.contextPath}/service/getAgreement">规则中心</a></li>
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

                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-home"
                                                                  aria-hidden="true"></span>商家商店</strong></li>
                        <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showBusinessProfile">我的商店</a></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-th-list"
                                                                  aria-hidden="true"></span>商家订单</strong></li>
                        <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=PAID">未接订单</a></li>
                        <li class="list-group-item list-group-item-info"><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=ACCEPTED">已接订单</a></li>
                        <li class="list-group-item"><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=AUDITING">退单记录</a></li>
                        <li class="list-group-item "><a class="text-muted" href="${pageContext.request.contextPath}/business/showOrder?shopId=${sessionScope.shop.id}&orderStatus=COMPLETED">完成订单</a></li>
                        <li class="list-group-item"><strong><span class="glyphicon glyphicon-user"
                                                                  aria-hidden="true"></span>我的资料</strong></li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showAccountAndShopInfo">个人资料</a>
                        </li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/showBusinessSettleInfo">入驻资料</a>
                        </li>
                        <li class="list-group-item"><a class="text-muted"
                                                       href="${pageContext.request.contextPath}/business/resetPassword">修改密码</a>
                        </li>
                    </ul>
                </div>
                <!-- 显示内容 -->
                <div class="col-md-10">
                    <div class="">
                        <div class="shoptTitle">
                            <h1 class="">
                                <small><b>我的接单</b></small>
                            </h1>
                        </div>

                    </div>

                    <div class="container-fluid" id="content">
                        <div class="panel panel-collapse">

                            <table class="table table-hover text-center">
                                <thead>
                                <tr>
                                    <th class="text-center">编号</th>
                                    <th class="text-center">接单时间</th>
                                    <th class="text-center">订单内容</th>
                                    <th class="text-center">备注</th>
                                    <th class="text-center">支付金额（元）</th>
                                    <th class="text-center">状态</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${requestScope.orderList != null}">
                                    <script>
                                        var connectCallback = function () {
                                            <c:forEach items="${requestScope.orderList}" var="order">
                                            stomp.subscribe('/user/${shop.id}/${order.id}/receiveApplyUrgeMessage', displayMessage); // 订阅消息
                                            </c:forEach>
                                        }

                                    </script>
                                    <c:forEach var="order" items="${requestScope.orderList}" varStatus="st">
                                        <tr>
                                            <td>
                                                <h4><strong>${st.count}</strong></h4>

                                            </td>
                                            <td>
                                                <h4><strong>${order.createDateString}</strong></h4>
                                                <p class="text-muted"><fmt:formatDate value='${order.acceptedTime}'
                                                                                      type='date' pattern='HH:mm'/></p>
                                            </td>
                                            <td>
                                                <h4><strong>订单号: ${order.orderNumber}</strong></h4>
                                                <c:forEach var="item" items="${order.lineItems}">
                                                    <c:set var="itemDetail"
                                                           value="${item.productName}${item.quantity}份 /"/>
                                                    <c:set var="allItemDetail">${allItemDetail}${' '}${itemDetail}</c:set>
                                                </c:forEach>
                                                <c:set var="length" value="${fn:length(allItemDetail)}"/>
                                                <p class="text-muted">${fn:substring(allItemDetail, 0,length-1)}<strong>${order.totalQuantity}</strong>
                                                    个菜品</p>

                                            </td>
                                            <td>

                                                <c:if test="${order.notes == null}">
                                                    <h4><strong>无</strong></h4>
                                                </c:if>
                                                <c:if test="${order.notes != null}">
                                                    <h4><strong> ${order.notes}</strong></h4>
                                                </c:if>
                                            </td>
                                            <td>
                                                <h4><strong>${order.total}</strong></h4>
                                                <p class="text-muted">
                                                    <c:choose>
                                                        <c:when test="${'ONLINE'.equals(order.paymentMethod)}">
                                                            在线支付
                                                        </c:when>
                                                        <c:when test="${'OFFLINE'.equals(order.status)}">
                                                            货到付款
                                                        </c:when>
                                                    </c:choose>
                                                </p>
                                            </td>
                                            <td>
                                                <h4 class="text-muted">等待发货</h4>
                                            </td>

                                            <td>
                                                <div class="btn-group-vertical btn-group-sm">
                                                    <form action="${pageContext.request.contextPath}/order/order/deliver/${order.id}" method="post">
                                                        <button class="btn btn-info order-btn" role="button" type="submit">发货</button>
                                                    </form>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
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
<!-- Modal -->
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
<script src="https://d1fxtkz8shb9d2.cloudfront.net/sockjs-0.3.4.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.2/stomp.min.js"></script>

<script>
    // 声明消息对象
    var message;

    // 创建Stomp客户端
    var stomp = Stomp.over(new SockJS("/rufull/ws"));

    // 收到订阅消息后的界面变化
    // 注意: 你主要完成这里
    function displayMessage(frame) {
        message = JSON.parse(frame.body);

        $('.modal-body').html(message.content); // 设置消息内容

        $('#myModal').modal({ // 弹出模态框
            keyboard: true
        })
    }

    var errorCallback = function (error) {
        alert(error.headers.message);
    };

    // 连接服务端
    stomp.connect("guest", "guest", connectCallback, errorCallback);

    $(document).ready(function(e) {
        $('#replyBtn').click(function (e) {
            e.preventDefault();

            message.status = 'REPLIED'; // 设置消息为已读

            var jsonstr = JSON.stringify(message); // json -> str
            stomp.send("/app/replyUrgeMessage", {}, jsonstr); // 发送消息

            $('#myModal').modal('hide'); // 隐藏模态框

            return false;
        });
    });
</script>
</html>