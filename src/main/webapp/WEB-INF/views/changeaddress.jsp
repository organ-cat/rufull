<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/5
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zh">
<head>
    <meta charset="utf-8" />
    <title>切换地址-changeaddress.html</title>
    <meta name="description" content="欢迎使用RuFull" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${pageContext.request.contextPath}/css/service/main.css" rel="stylesheet" type="text/css" />
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/service/city-picker.css" rel="stylesheet" type="text/css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/global.css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/homepage.css" />

    <link href="${pageContext.request.contextPath}/css/service/login-register.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/js/service/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/service/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/service/login-register.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/service/xcComfirm/js/xcConfirm.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/service/xcComfirm/css/xcConfirm.css">

</head>
<body class="homepage">
    <div class="homepage-container" align="center" style="width:1080px;">
        <header  style="width:1050px;">
            <div class="header-account">
                <a class="link" href="javascript:history.go(-1);"><font size="4px;" >返回</font></a>
            </div>
        </header>
    <div class="container" style="width:1080px;"><br><br>
        <form class="form-inline">
            <div id="distpicker" class="form-group">
                <div class="form-group" >
                    <div style="position: relative;">
                        <input id="city" class="form-control" type="search" readonly = "readonly" value="" style = "border:0px;max-width: 320px;min-width: 320px; " vdata-toggle="city-picker" >
                    </div>
                </div>
                <div class="form-group">
                    <div style="position: relative;" style="margin-left:-10px;">
                        <input id="address" class="form-control" type="search" placeholder="请输入你的订餐地址（学校，写字楼或街道）"  onMouseOut = "searchByStationName()">
                        <button id="submit" class="btn btn-danger" style="width:70px;height:48px;"  type="button"><font size="4px">确定</font></button>
                    </div>
                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:250px;height:auto; display:none;"></div>
                </div>
            </div>
        </form>
    </div><br>
    <div id="container" style="width:1050px;height:370px;"></div>

    <footer class="homepage-footer" style="margin-top: 30px;">
        <a class="footer-nav" href="" target="_blank">我要开店</a>
        <a class="footer-nav" href="" target="_blank">友情链接</a>
        <a class="footer-nav" href="" target="_blank">网站地图</a>
    </footer>
</div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi"></script>

<script src="${pageContext.request.contextPath}/js/service/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/service/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/service/city-picker.data.js"></script>
<script src="${pageContext.request.contextPath}/js/service/city-picker.js"></script>
<!--取定位信息-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi
"></script>
<script src="${pageContext.request.contextPath}/js/service/mapInfo.js"></script>



</body>
</html>
