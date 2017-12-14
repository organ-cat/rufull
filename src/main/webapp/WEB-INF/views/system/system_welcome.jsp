<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

  <html class="no-js">
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>欢迎 &mdash; RuFull最称心如意! </title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<!-- <link href='http://fonts.useso.com/css?family=Playfair+Display:400,700,400italic,700italic|Merriweather:300,400italic,300italic,400,700italic' rel='stylesheet' type='text/css'>
	 -->
	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/simple-line-icons.css">
	<!-- Datetimepicker -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-datetimepicker.min.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/flexslider.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/style.css">


	</head>
	<body>

		<div id="fh5co-home" class="js-fullheight" data-section="home">

			<div class="flexslider">
				
				<!-- <div class="fh5co-overlay"></div> -->
				<div class="fh5co-text">
					<div class="container">
						<div class="row">
							<h1 class="to-animate" style="font-size: 125px;">Welcome</h1>
							<h2 class="to-animate">Welcome to<span> use</span> RuFull!</h2>
						</div>
					</div>
				</div>
			  	<ul class="slides">
			   	<li style="background-image: url(${pageContext.request.contextPath}/image/system/slide_1.jpg);" data-stellar-background-ratio="0.5"></li>
			   	<li style="background-image: url(${pageContext.request.contextPath}/image/system/slide_2.jpg);" data-stellar-background-ratio="0.5"></li>
			   	<li style="background-image: url(${pageContext.request.contextPath}/image/system/slide_3.jpg);" data-stellar-background-ratio="0.5"></li>
			  	</ul>

			</div>
			<!-- <div style="text-align: center;"><h2 class="to-animate">Welcome to RuFull!</h2></div>
			<h2 class="to-animate">RuFull的系统用户可以方便地通过手机、电脑搜索周边餐厅，
			在线订餐、享受美食，在线支付完成交易。我们追求的是向用户传达一种健康、年轻化的饮食习惯和生活方式!</h2> -->
		</div>

	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/system/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/system/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/system/bootstrap.min.js"></script>
	<!-- Bootstrap DateTimePicker -->
	<script src="${pageContext.request.contextPath}/js/system/moment.js"></script>
	<script src="${pageContext.request.contextPath}/js/system/bootstrap-datetimepicker.min.js"></script>
	<!-- Waypoints -->
	<!-- <script src="${pageContext.request.contextPath}/js/system/jquery.waypoints.min.js"></script> -->
	<!-- Stellar Parallax -->
	<script src="${pageContext.request.contextPath}/js/system/jquery.stellar.min.js"></script>

	<!-- Flexslider -->
	<script src="${pageContext.request.contextPath}/js/system/jquery.flexslider-min.js"></script>
	<script>
		$(function () {
	       $('#date').datetimepicker();
	   });
	</script>
	<!-- Main JS -->
	<script src="${pageContext.request.contextPath}/js/system/main.js"></script>

	</body>
</html>