<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <script type="text/javascript">

        $(function() {
            var chart;
            $('#int').highcharts({
                chart : {
                    type : 'column'
                },
                title : {
                    text : ''
                },
                xAxis : {
                    categories : ['五星', '四星', '三星','二星','一星']
                },
                yAxis : {
                    title : {
                        text : '订单数量'
                    }
                },
                series : [{
                    name : '评星详情',
                    data : [${e},${d}, ${c},${b},${a}]
                }]
            });


        });
    </script>
</head>

<body>

<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style=" padding:0px; padding-left:20px;" >
        <li ><a href="#">商店评价数据分析</a></li>
        <li>柱形分析</li>
    </ul>
</div>


<div class="row " style="padding:1px; margin:0px;"  >
    <div class="col-sm-7">
        <div class="panel panel-default" >
            <div class="panel-heading" style=" padding:3px;height:30px;"  >
                商店评星总体分布情况
            </div>
            <div class="panel-body" id="int">

            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-heading"  style=" padding:3px;height:30px;"  >
                分布情况
            </div>
            <table class="table table-bordered">
                <tr>
                    <th>视图</th>
                    <th>等级</th>
                    <th>数量</th>
                </tr>

                <tr>
                    <td>评星详情</td>
                    <td>五星</td>
                    <td>${e}</td>
                </tr><tr>
                <td>评星详情</td>
                <td>四星</td>
                <td>${d}</td>
            </tr><tr>
                <td>评星详情</td>
                <td>三星</td>
                <td>${c}</td>
            </tr><tr>
                <td>评星详情</td>
                <td>二星</td>
                <td>${b}</td>
            </tr><tr>
                <td>评星详情</td>
                <td>一星</td>
                <td>${a}</td>
            </tr>
            </table>

        </div>
    </div>


</div>
</body>
</html>
