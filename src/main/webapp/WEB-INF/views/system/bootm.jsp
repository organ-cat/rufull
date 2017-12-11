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
<title>��ҳ</title>
<!-- �� Bootstrap ���� CSS �ļ� -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
<!-- ��ѡ��Bootstrap�����ļ���һ�㲻�����룩 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
<!-- jQuery�ļ��������bootstrap.min.js ֮ǰ���� -->
<script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
<!-- ���µ� Bootstrap ���� JavaScript �ļ� -->
<script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
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
						categories : ['5��', '4��', '3��','2��','1��']
					},
					yAxis : {
						title : {
							text : '�̼�����'
						}
					},
					series : [{
						name : '��������',
						data : [220,20, 33,21,11]
					}]
				});
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
                    ['�����̼�',100],
                    {
                        name: '�����̼�',
                        y:45,
                        sliced: true,
                        selected: true
                    },
                    ['�����̼�',555],
                    ['һ���̼�', 11],
                ]
            }]
        });
    });
			$('#province').highcharts({
        chart: {
            type: 'area'
        },
        title: {
            text: '���۷ֲ�ͼ'
        },
        xAxis: {
            labels: {
                formatter: function() {
                    return this.value; // clean, unformatted number for year
                }
            }
        },
        tooltip: {
            pointFormat: '<b>{point.y:,.0f}</b><br>λ��: {point.x}'
        },
        xAxis: {
			            categories: ['����', '�ӱ�', '����','���','�ձ�','����']
			       },
        series: [{
            name: 'ʡ��',
            data: [10,20,50,10,90,50]
        }]
    });
			});
</script>
</head>

<body>

<div style="padding:0px; margin:0px;">
 <ul class="breadcrumb" style=" padding:0px; padding-left:20px;" >
  <li ><a href="#">��ҳ</a></li>
  <li>����̨</li>
</ul>
</div>

<div class="row " style="padding:1px; margin:0px;"  >
	<div class="col-sm-8">
        <div class="panel panel-default" >
          <div class="panel-heading" style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>�̵������������
          </div>
              <div class="panel-body" id="int">
               
              </div>
        </div>
    </div>
 	<div class="col-sm-4">
            <div class="panel panel-default">
          <div class="panel-heading"  style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>�ؼ���ͼ
          </div>
   <table class="table table-bordered">
	<tr>
    	<th>��ͼ</th>
        <th>ģ��</th>
        <th>����</th>
    </tr>
    
    	<tr>
    	<td>��ʽѧԱ</td>
        <td>ѧԱ</td>
        <td>1523</th>
    </tr><tr>
    	<td>����ѧԱ</td>
        <td>ѧԱ</td>
        <td>1523</th>
    </tr><tr>
    	<td>����ѧԱ</td>
        <td>ѧԱ</td>
        <td>1523</th>
    </tr>
	</table>  
        </div>
    </div>

	<div class="col-sm-6">
        <div class="panel panel-default" >
          <div class="panel-heading" style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>ѧԱ�ֲ�ͼ
          </div>
              <div class="panel-body" id="distribution">
               
              </div>
        </div>
    </div>
	<div class="col-sm-6">
        <div class="panel panel-default" >
          <div class="panel-heading" style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>ѧԱ�ֲ�ͼ
          </div>
              <div class="panel-body" id="province">
               
              </div>
        </div>
    </div>
 	<div class="col-sm-4">
            <div class="panel panel-default">
          <div class="panel-heading"  style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>������ϵ
          </div>
   <table class="table table-bordered" >
	<tr >
    	<th>��ϵ��</th>
        <th>�绰����</th>
     
    </tr>
    <tr>
    	<td>����</td>
        <td>1522355214</td>
    </tr>
	</table>  
        </div>
    </div>
 	<div class="col-sm-4">
            <div class="panel panel-default">
          <div class="panel-heading"  style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>������ϵ
          </div>
   <table class="table table-bordered" >
	<tr >
    	<th>��ϵ��</th>
        <th>�绰����</th>
     
    </tr>
    <tr>
    	<td>����</td>
        <td>1522355214</td>
    </tr>
	</table>  
        </div>
    </div>
     	<div class="col-sm-4">
            <div class="panel panel-default">
          <div class="panel-heading"  style=" padding:3px;height:30px;"  >
            <span class="glyphicon glyphicon-refresh"></span>����
          </div>
		  <div class="panel-body">����</div>	
        </div>
    </div>
</div>



</body>
</html>
