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
    <title>�������ݷ���----����ͼ</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

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
                        text: '�����ֲ�ͼ'
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
                            ['��40',${e}],
                            {
                                name: '30~40',
                                y:${d},
                                sliced: true,
                                selected: true
                            },
                            ['20~30',${c}],
                            ['10~20', ${b}],
                            ['0~10', ${a}],
                        ]
                    }]
                });
            });


            lay('#version').html('-v'+ laydate.v);
            laydate.render({
                elem: '#end'
                ,type: 'datetime'
            });
            laydate.render({
                elem: '#begin'
                ,type: 'datetime'
            });
        });
        function findorderd() {
            document.findorders.submit();
        }

        var timeerror = "${timeerror}";

        if(timeerror!= '')
        {
            window.onload = function() {
                swal("����ʧ��", "��ʼʱ�䲻�ܴ��ڽ���ʱ��!", "error");
            };
        }
    </script>
</head>

<body>

<div style="padding:0px; margin:0px;">
    <ul class="breadcrumb" style=" padding:0px; padding-left:20px;" >
        <li ><a href="#">�������ݷ���</a></li>
        <li>���η���</li>
    </ul>
</div>
<form class="form-inline" name="findorders" action="${pageContext.request.contextPath}/manageData/getOrdersByTime?type=2"
      method="post">
    <div class="col-sm-12">
        <div class="form-group" style="padding-left: 20%;padding-top: 20px;padding-bottom: 20px;">

            <input  type="text" class="form-control input-lg" id="begin" readonly="readonly"
                    name="begin" style="min-width: 200px;max-width: 200px;" placeholder="�����뿪ʼʱ��">----
            <input type="text" class="form-control input-lg" id="end" readonly="readonly"
                   name="end" style="min-width: 200px;max-width: 200px;" placeholder="���������ʱ��">&nbsp;&nbsp;

            &nbsp;&nbsp;<button type="button" style="max-width: 150px;"
                                class="btn btn-lg" onclick="findorderd();">����
        </button>

        </div>
    </div>
</form>

<div class="row " style="padding:1px; margin:0px;"  >
    <div class="col-sm-7" >
        <div class="panel panel-default" >
            <div class="panel-heading" style=" padding:3px;height:30px;"  >
                </span>���������ηֲ�ͼ
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
                    <th>ģ��</th>
                    <th>����</th>
                </tr>

                <tr>
                    <td>�ܶ�������</td>
                    <td>40Ԫ����</td>
                    <td>${e}</td>
                </tr><tr>
                <td>�ܶ�������</td>
                <td>30��40</td>
                <td>${d}</td>
            </tr><tr>
                <td>�ܶ�������</td>
                <td>20��30</td>
                <td>${c}</td>
            </tr><tr>
                <td>�ܶ�������</td>
                <td>10��20</td>
                <td>${b}</td>
            </tr><tr>
                <td>�ܶ�������</td>
                <td>0��10</td>
                <td>${a}</td>
            </tr>
            </table>

        </div>
    </div>

</div>
</body>
</html>
