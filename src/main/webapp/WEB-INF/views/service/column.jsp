<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <title>柱形图分析</title>
   <%-- <link href="${pageContext.request.contextPath}/css/service/forward.css" type="text/css" rel="stylesheet"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->--%>
    <link href="${pageContext.request.contextPath}/css/service/forward.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <%--时间控件--%>
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <script type="text/javascript">


        $(function () {
            var chart;
            $('#int').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: ''
                },
                xAxis: {
                    categories: ['≥40', '30~40', '20~30', '10~20', '0~10']
                },
                yAxis: {
                    title: {
                        text: '订单数量'
                    }
                },
                series: [{
                    name: '数量详情',
                    data: [${ee}, ${dd}, ${cc}, ${bb}, ${aa}]
                }]
            });

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

        var timeerror = "${timeerror}";

        if(timeerror!= '')
        {
            window.onload = function() {
                swal("操作失败", "开始时间不能大于结束时间!", "error");
            };
        }

        function getColumn() {
            var login = "${sessionScope.account.username}"
            if (login != '') {
                document.findaccorder.submit();
            }
            else {
                swal("操作失败", "您尚未登录!", "error");
            }
        }
    </script>
    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order/" var="showOrderUrl"/>
    <spring:url value="/business/joinBusiness" var="showCooperationUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="/service/getAgreement" var="showAgreementUrl"/>
    <spring:url value="/account/logout"  var="logoutUrl"/>
    <spring:url value="/account/center?id=${account.id}" var="showProfileUrl"/>
    <spring:url value="/favor/myFavor?id=${account.id}" var="showFavorUrl"/>
    <spring:url value="/address/addressManage?id=${account.id}" var="showAddressUrl"/>
    <spring:url value="/account/security?id=${account.id}" var="showSecurityUrl"/>
    <spring:url value="/service/gethelp" var="gethelp"/>
    <spring:url value="/service/getAccorder" var="getAccorder"/>
    <spring:url value="/service/getAgreement" var="getAgreement"/>
    <spring:url value="/service/fanAnalysis?type=0" var="fan"/>
    <spring:url value="/service/fanAnalysis?type=1" var="column"/>
    <spring:url value="/cart" var="showCartUrl"/>

</head>

<body>
    <script type="text/javascript">
        $("body").css("width", window.innerWidth);
        $(window).resize(function () {
            $("body").css("width", window.innerWidth);
        })
    </script>
<div class="full-content-wrapper">
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
                    <li><a href="${showOrderUrl}">我的订单</a></li>
                    <li><a href="${showCooperationUrl}">加盟合作</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden-sm hidden-md"><a href="${showAgreementUrl}">规则中心</a></li>
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
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="help">
            <div class="help-site" data-spy="affix" data-offset-top="84">
                <ul class="">
                    <li><a href="${gethelp}">问题答疑</a></li>
                    <li><a href="${getAccorder}">我的账单</a></li>
                    <li><a href="${fan}">扇形分析</a></li>
                    <li><a href="${column}" class="active">柱形分析</a></li>
                    <li><a href="${getAgreement}">网站规则</a></li>
                </ul>
            </div>

            <div class="help-content">
                <div style="padding-bottom: 25px;padding-top: 30px;">
                    <form class="form-inline" name="findaccorder"
                          action="${pageContext.request.contextPath}/service/fanAnalysis"
                          method="post">
                        <table width="100%">
                            <tr>
                                <th>请选择时间:</th>
                                <td colspan="2">
                                    <input type="text" class="form-control input-lg" id="begin" readonly="readonly"
                                           name="beginTime" style="min-width: 270px;max-width: 270px;"
                                           placeholder="请输入开始时间">
                                </td>
                                <td>
                                    <input type="text" class="form-control input-lg" id="end" readonly="readonly"
                                           name="endTime" style="min-width: 270px;max-width: 270px;"
                                           placeholder="请输入结束时间">
                                </td>
                                <td>
                                    <input type="hidden" name="type" value="1">
                                    <button type="button" style="max-width: 150px;"
                                            class="btn btn-lg" onclick="getColumn();">查找
                                    </button>
                                </td>

                            </tr>
                        </table>
                    </form>
                </div>
                <div class="row " style="padding:1px; margin:0px;">
                    <div class="col-sm-8">
                        <div class="panel panel-default">
                            <div class="panel-heading" style=" padding:3px;height:30px;">
                                订单总体分布情况
                            </div>
                            <div class="panel-body" id="int">

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="panel panel-default">
                            <div class="panel-heading" style=" padding:3px;height:30px;">
                                分布情况
                            </div>
                            <table class="table table-bordered">
                                <tr>
                                    <th>视图</th>
                                    <th>模块</th>
                                    <th>数量</th>
                                </tr>

                                <tr>
                                    <td>总订单详情</td>
                                    <td>40元以上</td>
                                    <td>${ee}</td>
                                </tr>
                                <tr>
                                    <td>总订单详情</td>
                                    <td>30至40</td>
                                    <td>${dd}</td>
                                </tr>
                                <tr>
                                    <td>总订单详情</td>
                                    <td>20至30</td>
                                    <td>${cc}</td>
                                </tr>
                                <tr>
                                    <td>总订单详情</td>
                                    <td>10至20</td>
                                    <td>${bb}</td>
                                </tr>
                                <tr>
                                    <td>总订单详情</td>
                                    <td>0至10</td>
                                    <td>${aa}</td>
                                </tr>
                            </table>

                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>
