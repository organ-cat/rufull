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
    <title>�̵��������ݷ���----����ͼ</title>
    <!-- �� Bootstrap ���� CSS �ļ� -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- ��ѡ��Bootstrap�����ļ���һ�㲻�����룩 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery�ļ��������bootstrap.min.js ֮ǰ���� -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <%--ʱ��ؼ�--%>
    <script src="${pageContext.request.contextPath }/js/system/laydate/laydate.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <script type="text/javascript">

        $(function() {
            var chart;
            $(document).ready(function () {

                // Build the chart
                $('#distribution').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    },
                    title: {
                        text: '���۷ֲ�ͼ'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: false
                            },
                            showInLegend: true
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: '��ռ����',
                        data: [
                            ['����',${e}],
                            {
                                name: '����',
                                y:${d},
                                sliced: true,
                                selected: true
                            },
                            ['����',${c}],
                            ['����', ${b}],
                            ['һ��', ${a}],
                        ]
                    }]
                });
            });


        });
    </script>
</head>

<body>

<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style=" padding:0px; padding-left:20px;" >
        <li ><a href="#">�̵��������ݷ���</a></li>
        <li>���η���</li>
    </ul>
</div>


<div class="row " style="padding:1px; margin:0px;"  >
    <div class="col-sm-7" >
        <div class="panel panel-default" >
            <div class="panel-heading" style=" padding:3px;height:30px;"  >
                </span>�̵����۵����ηֲ�ͼ
            </div>
            <div class="panel-body" id="distribution">

            </div>
        </div>
    </div>

    <div class="col-sm-4">
        <div class="panel panel-default">
            <div class="panel-heading"  style=" padding:3px;height:30px;"  >
                �ֲ����
            </div>
            <table class="table table-bordered">
                <tr>
                    <th>��ͼ</th>
                    <th>�ȼ�</th>
                    <th>����</th>
                </tr>

                <tr>
                    <td>��������</td>
                    <td>����</td>
                    <td>${e}</td>
                </tr><tr>
                <td>��������</td>
                <td>����</td>
                <td>${d}</td>
            </tr><tr>
                <td>��������</td>
                <td>����</td>
                <td>${c}</td>
            </tr><tr>
                <td>��������</td>
                <td>����</td>
                <td>${b}</td>
            </tr><tr>
                <td>��������</td>
                <td>һ��</td>
                <td>${a}</td>
            </tr>
            </table>

        </div>
    </div>


</div>
</body>
</html>
