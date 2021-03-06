<%@ page language="java" import="java.util.*" pageEncoding="gbk" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>订单数据分析----柱形图</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <%--时间控件--%>
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
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
                    data: [${e}, ${d}, ${c}, ${b}, ${a}]
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
        function findorderd() {
            document.findorders.submit();
        }

        var timeerror = "${timeerror}";

        if (timeerror != '') {
            window.onload = function () {
                swal("操作失败", "开始时间不能大于结束时间!", "error");
            };
        }
    </script>
</head>

<body>

<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style=" padding:0px; padding-left:20px;">
        <li><a href="#">订单数据分析</a></li>
        <li>柱形分析</li>
    </ul>
</div>
<form class="form-inline" name="findorders"
      action="${pageContext.request.contextPath}/manageData/getOrdersByTime?type=1"
      method="post">
    <div class="col-sm-12">
        <div class="form-group" style="padding-left: 20%;padding-top: 20px;padding-bottom: 20px;">

            <input type="text" class="form-control input-lg" id="begin" readonly="readonly"
                   name="begin" style="min-width: 200px;max-width: 200px;" placeholder="请输入开始时间">----
            <input type="text" class="form-control input-lg" id="end" readonly="readonly"
                   name="end" style="min-width: 200px;max-width: 200px;" placeholder="请输入结束时间">&nbsp;&nbsp;

            &nbsp;&nbsp;<button type="button" style="max-width: 150px;"
                                class="btn btn-lg" onclick="findorderd();">查找
        </button>

        </div>
    </div>
</form>

<div class="row " style="padding:1px; margin:0px;">
    <div class="col-sm-7">
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
                    <td>${e}</td>
                </tr>
                <tr>
                    <td>总订单详情</td>
                    <td>30至40</td>
                    <td>${d}</td>
                </tr>
                <tr>
                    <td>总订单详情</td>
                    <td>20至30</td>
                    <td>${c}</td>
                </tr>
                <tr>
                    <td>总订单详情</td>
                    <td>10至20</td>
                    <td>${b}</td>
                </tr>
                <tr>
                    <td>总订单详情</td>
                    <td>0至10</td>
                    <td>${a}</td>
                </tr>
            </table>

        </div>
    </div>


</div>
</body>
</html>
