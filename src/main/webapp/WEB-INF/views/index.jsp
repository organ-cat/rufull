<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/5
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="no-js" lang="zh">
<head>
    <meta charset="utf-8" />
    <title>首页-index.html</title>
    <meta name="description" content="欢迎使用RuFull" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${pageContext.request.contextPath}/css/service/main.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/service/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/service/city-picker.css" rel="stylesheet" type="text/css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/global.css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/homepage.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/service/bootstrap3/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/service/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/service/bootstrap3/js/bootstrap.js" type="text/javascript"></script>

    <link href="${pageContext.request.contextPath}/css/account/login-register.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/account/index.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/account/login-register.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/account/index.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js"></script>

    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
</head>
<body class="homepage">
<div class="homepage-container" align="center">

    <header>
        <div class="header-account" style="margin-top:-48px;">
            <div style="widht:1080px;margin-right:50px;align:right;">
                <div class="row">
                    <c:if test="${empty account}">
                        <div class="col-sm-4"></div>

                        <div class="col-sm-4">
                            <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">
                                登陆
                            </a>
                        </div>
                        <div class="col-sm-4">
                            <a class="btn big-register" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">
                                注册
                            </a>
                        </div>
                    </c:if>
                    <c:if test="${!empty account}">
                        <ul id="ulSize">
                            <c:if test="${account.photo == null &&account.nickname == null}">
                                <li class="usernameLiImg"><a href="#" class="aLabel"><img class="photoShow" src="http://localhost:8080/rufull/upload/account/rufull.png" alt="头像" /> <span >Hi,美食家</span></a></li>
                            </c:if>
                            <c:if test="${account.photo != null}">
                                <li class="usernameLiImg"><a href="#" class="aLabel"><img class="photoShow" src="http://localhost:8080/rufull/upload/account/${account.photo}" alt="头像" /><span >${account.nickname}</span></a></li>
                            </c:if>
                            <li class="hideImg"><a href="${pageContext.request.contextPath}/account/center?id=${account.id}" class="aLabel"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
                            <li class="hideImg"><a href="#" class="aLabel"><span class="glyphicon glyphicon-star"></span> 我的收藏</a></li>
                            <li class="hideImg"><a href="${pageContext.request.contextPath}/address/addressManage?id=${account.id}" class="aLabel"><span class="glyphicon glyphicon-map-marker"></span> 我的地址</a></li>
                            <li class="hideImg"><a href="#" class="aLabel"><span class="glyphicon glyphicon-cog"></span> 安全设置</a></li>
                            <li class="divider" role="separator"></li>
                            <li class="hideImg"><a href="${pageContext.request.contextPath}/account/logout" class="aLabel"><span class="glyphicon glyphicon-off"></span> 退出登录</a></li>
                        </ul>
                    </c:if>
                </div>
            </div>
        </div>
    </header>
    <div class="container" style="width:1080px;"><br><br><br><br><br><br><br>
        <form class="form-inline">
            <div id="distpicker" class="form-group">
                <div class="form-group" >
                    <div style="position: relative;">
                        <input id="city" class="form-control" type="search" readonly = "readonly" value="" style = "border:0px;max-width: 280px;min-width: 280px; " vdata-toggle="city-picker" >
                    </div>
                </div>
                <div class="form-group">
                    <div style="position: relative;" style="margin-left:-10px;">
                        <input id="address" class="form-control" type="search" placeholder="请输入你的订餐地址（学校，写字楼或街道）"  onMouseOut = "searchByStationName()"/>
                        <button id="searcher" class="btn btn-danger" style="width:70px;height:48px;"  type="button"><font size="4px">搜索</font></button>
                    </div>
                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:250px;height:auto; display:none;"></div>
                </div>
            </div>
        </form>
    </div>
    <div id="container" style="width:0px;height:0px;"></div>
    <div class="container">
        <script type="text/javascript">
            $("body").css("width", window.innerWidth);
            $(window).resize(function () {
                $("body").css("width", window.innerWidth);
            })
        </script>
        <div class="modal fade login" id="loginModal">
            <div class="modal-dialog login animated">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">登陆方式</h4>
                    </div>
                    <div class="modal-body">
                        <div class="box">
                            <div class="content">

                                <div class="division">
                                    <div class="line l"></div>
                                    <span>其中一个方式</span>
                                    <div class="line r"></div>
                                </div>
                                <div class="error"></div>
                                <div class="form loginBox">
                                    <form method="post" accept-charset="UTF-8">
                                        <input id="username" class="form-control loi" type="text" placeholder="手机/用户名/邮箱" name="username">
                                        <input id="loginPassword" class="form-control loi" type="password" placeholder="密码" name="password">

                                        <div id="hideDiv">
                                            <input id="remoteCode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                            <input id="loginCodeBtn" class="loh" type="button" readonly value="免费获取验证码">
                                        </div>
                                        <input id="loginButton" class="btn btn-default loi btn-login" type="button" value="登陆">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="box">
                            <div class="content registerBox" style="display:none;">
                                <div class="form">
                                    <!--使用了c标签-->
                                    <!--<form method="post" action="<c:url value="/account/accountRegister"/>" accept-charset="UTF-8"> -->
                                    <form method="post" action="">
                                        <input id="phone" class="form-control loi" type="text" placeholder="手机/邮箱" name="phone">
                                        <input id="registerPassword" class="form-control loi" type="password" placeholder="您的密码" name="password">
                                        <input id="confirmationPassword" class="form-control loi" type="password" placeholder="确认密码" name="password_confirmation">
                                        <input id="checkcode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                        <input id="getCheckCodeButton" class="loh" type="button" value="免费获取验证码">
                                        <input id="registerButton" class="btn btn-default btn-register  loi" type="submit" value="注册" >
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>打算
                                 <a href="javascript: showRegisterForm();" class="alink">注册一个账号？</a>
                            </span>
                        </div>
                        <div class="forgot register-footer" style="display:none">
                            <span>已经有一个账号？</span>
                            <a href="javascript: showLoginForm();" class="alink">登陆</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="homepage-footer" style="background-color: #00000000">
        <a class="footer-nav" href="${pageContext.request.contextPath}/business/joinBusiness" target="_blank">我要开店</a>
        <a class="footer-nav" href="" target="_blank">问题答疑</a>
        <a class="footer-nav" href="" target="_blank">规则中心</a>
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
