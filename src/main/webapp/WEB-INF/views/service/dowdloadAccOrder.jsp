<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <title>个人流水账单下载</title>

   <%-- <link href="${pageContext.request.contextPath}/css/service/forward.css" type="text/css" rel="stylesheet"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <%--时间控件--%>
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <script type="text/javascript">

        $(function () {

                lay('#version').html('-v' + laydate.v);
                laydate.render({
                    elem: '#end'
                    , type: 'datetime'
                });
                laydate.render({
                    elem: '#begin'
                    , type: 'datetime'
                });

        });
        function getbill() {
            var login = "${sessionScope.account.username}"
            if(login != '')
            {
                document.findaccorder.submit();
            }
            else{
                swal("操作失败", "您尚未登录!", "error");
                }
        }

        var timeerror = "${timeerror}";

        if(timeerror!= '')
        {
            window.onload = function() {
                swal("操作失败", "开始时间不能大于结束时间!", "error");
            };
        }

        //导出文件
        function doExport(){
            window.location.href = "${pageContext.request.contextPath}/service/exportXls";
        }

    </script>

    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order" var="showOrderUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="/service/getAgreement" var="showAgreementUrl"/>
    <spring:url value="/logout" var="logoutUrl"/>
    <spring:url value="#" var="showProfileUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>
    <spring:url value="/favor" var="showFavorUrl"/>
    <spring:url value="/address" var="showAddressUrl"/>
    <spring:url value="/security" var="showSecurityUrl"/>
    <spring:url value="/service/gethelp" var="gethelp"/>
    <spring:url value="/service/getAccorder" var="getAccorder"/>
    <spring:url value="/service/getAgreement" var="getAgreement"/>
    <spring:url value="/service/fanAnalysis?type=0" var="fan"/>
    <spring:url value="/service/fanAnalysis?type=1" var="column"/>

    <link href="${pageContext.request.contextPath}/css/service/forward.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>

    <script type="text/javascript">
        $("body").css("width", window.innerWidth);
        $(window).resize(function () {
            $("body").css("width", window.innerWidth);
        })
    </script>

</head>

<body>
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
                        <a class="navbar-brand" href="${rootUrl}"><img class="img-responsive center-block" alt="饱了么" src=""></a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="hidden-sm hidden-md"><a href="${rootUrl}">首页</a></li>
                            <li ><a href="${showOrderUrl}">我的订单</a></li>
                            <li><a href="${showCooperationUrl}">加盟合作</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="hidden-sm hidden-md"><a href="${showAgreementUrl}">规则中心</a></li>
                            <c:if test="${empty account}">
                                <li class="hidden-sm hidden-md">
                                    <a href="javascript:void(0)" style="color: indigo;" onclick="openLoginModal();">
                                        登录/注册
                                    </a></li>
                            </c:if>

                            <c:if test="${!empty account}">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                       aria-expanded="false">${account.nickname}<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="${showProfileUrl}"><span class="glyphicon glyphicon-user"
                                                                              aria-hidden="true"></span>个人中心</a></li>
                                        <li><a href="${showCartUrl}"><span class="glyphicon glyphicon-shopping-cart"
                                                                           aria-hidden="true"></span>购物车</a></li>
                                        <li><a href="${showFavorUrl}"><span class="glyphicon glyphicon-star"
                                                                            aria-hidden="true"></span>我的收藏</a></li>
                                        <li><a href="${showAddressUrl}"><span class="glyphicon glyphicon-map-marker"
                                                                              aria-hidden="true"></span>我的地址</a></li>
                                        <li><a href="${showSecurityUrl}"><span class="glyphicon glyphicon-cog"
                                                                               aria-hidden="true"></span> 安全设置</a></li>
                                        <li class="divider" role="separator"></li>
                                        <li><a href="${logoutUrl}"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                                            退出登录</a></li>
                                    </ul>
                                </li></c:if>
                        </ul>
                    </div>
                </div>
            </nav>

        </header>
    </div>
</div>

<div class="full-content-wrapper">
    <div class="container">
        <div class="help">
            <div class="help-site" data-spy="affix" data-offset-top="84">
                <ul class="">
                    <li><a href="${gethelp}">问题答疑</a></li>
                    <li><a href="${getAccorder}" class="active">我的账单</a></li>
                    <li><a href="${fan}">扇形分析</a></li>
                    <li><a href="${column}">柱形分析</a></li>
                    <li><a href="${getAgreement}">网站规则</a></li>
                </ul>
            </div>
            <div class="help-content" >
                <div style="padding-bottom: 25px;padding-top: 30px;">
                <form class="form-inline" name="findaccorder"
                      action="${pageContext.request.contextPath}/service/getAccountOrdersBetween"
                      method="post">
                    <table  width="100%">
                        <tr>
                            <th>请选择时间:</th>
                            <td colspan="2">
                                <input type="text" class="form-control input-lg" id="begin" readonly="readonly"
                                       name="beginTime" style="min-width: 200px;max-width: 200px;"
                                       placeholder="请输入开始时间">
                            </td>

                            <td>
                                <input type="text" class="form-control input-lg" id="end" readonly="readonly"
                                       name="endTime" style="min-width: 200px;max-width: 200px;" placeholder="请输入结束时间">
                            </td>
                            <td>
                                <button type="button" style="max-width: 150px;"
                                        class="btn btn-lg" onclick="getbill();">查找
                                </button>
                            </td>
                            <td>
                                <button type="button" style="max-width: 150px;"
                                        class="btn btn-lg" onclick="doExport();">导出到excel
                                </button>
                            </td>
                        </tr>
                    </table>
                </form>
                </div>
                    <table class="table table-bordered">
                        <tr>
                            <th>订单号</th>
                            <th>创建时间</th>
                            <th>商店名称</th>
                            <th>支付方式</th>
                            <th>订单总额</th>
                            <th>订单状态</th>
                        </tr>
                        <c:forEach items="${AccOrdersBetween}" var="list">
                            <tr>
                                <td>${list.orderNumber}</td>
                                <td><fmt:formatDate value="${list.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td>${list.shop.shopName}</td>
                                <c:if test="${list.paymentMethod=='ONLINE'}">
                                    <td>在线支付</td>
                                </c:if>
                                <c:if test="${list.paymentMethod=='OFFLINE'}">
                                    <td>货到付款</td>
                                </c:if>
                                <td>${list.total}</td>
                                <c:if test="${list.status=='UNPAID'}">
                                    <td>未付款</td>
                                </c:if>
                                <c:if test="${list.status=='PAID'}">
                                    <td>已付款</td>
                                </c:if>
                                <c:if test="${list.status=='CANCELED'}">
                                    <td>已取消</td>
                                </c:if>
                                <c:if test="${list.status=='ACCEPTED'}">
                                    <td>已接单</td>
                                </c:if>
                                <c:if test="${list.status=='DELIVERY'}">
                                    <td>运送中</td>
                                </c:if>
                                <c:if test="${list.status=='COMPLETED'}">
                                    <td>已完成</td>
                                </c:if>
                                <c:if test="${list.status=='AUDITING'}">
                                    <td>审核中</td>
                                </c:if>
                                <c:if test="${list.status=='UNCOMPLETED'}">
                                    <td>未完成</td>
                                </c:if>
                                <c:if test="${list.status=='EVALUATED'}">
                                    <td>已评价</td>
                                </c:if>

                            </tr>
                        </c:forEach>
                    </table>


            </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/service/help.js"></script>
</body>
</html>
