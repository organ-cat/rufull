<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/5
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html class="no-js" lang="zh">
<head>
    <meta charset="utf-8" />
    <title>首页-index.html</title>
    <meta name="description" content="欢迎使用RuFull" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="${pageContext.request.contextPath}/css/service/main.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/service/bootstrap3/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/service/city-picker.css" rel="stylesheet" type="text/css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/global.css" />
    <link class="usemin" rel="stylesheet" href="${pageContext.request.contextPath}/css/service/homepage.css" />
    <link href="${pageContext.request.contextPath}/css/service/login-register.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/account/index.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/normalize.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/service/bootstrap3/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/service/jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/css/service/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/account/login-register.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/account/index.js" type="text/javascript"></script>
    <script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
    <script src="${pageContext.request.contextPath}/css/service/xcComfirm/js/xcConfirm.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/service/xcComfirm/css/xcConfirm.css">

    <spring:url value="/account/center?id=${account.id}" var="center_url"/>
    <spring:url value="/favor/myFavor?id=${account.id}" var="favor_url"/>
    <spring:url value="/address/addressManage?id=${account.id}" var="address_url"/>
    <spring:url value="/account/security" var="security_url"/>
    <spring:url value="/account/logout" var="logout_url"/>
    <spring:url value="/nologin/forgotPasswordPage" var="forgot_password_url"/>
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
                            <c:if test="${account.photo == null}">
                                <li class="usernameLiImg">
                                    <a href="#" class="aLabel">
                                    <img class="photoShow" src="${pageContext.request.contextPath}/upload/account/rufull.png" alt="头像" />
                                        <c:if test="${account.nickname == null}">
                                            <span >Hi,美食家</span>
                                        </c:if>
                                        <c:if test="${account.nickname != null}">
                                            <span >Hi,${account.nickname}</span>
                                        </c:if>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${account.photo != null}">
                                <li class="usernameLiImg">
                                    <a href="#" class="aLabel"><img class="photoShow" src="${pageContext.request.contextPath}/upload/account/${account.photo}" alt="头像" />
                                        <c:if test="${account.nickname == null}">
                                            <span >Hi,美食家</span>
                                        </c:if>
                                        <c:if test="${account.nickname != null}">
                                            <span >Hi,${account.nickname}</span>
                                        </c:if>
                                    </a>
                                </li>
                            </c:if>
                            <li class="hideImg"><a href="${center_url}" class="aLabel"><span class="glyphicon glyphicon-user"></span> 个人中心</a></li>
                            <li class="hideImg"><a href="${favor_url}" class="aLabel"><span class="glyphicon glyphicon-star"></span> 我的收藏</a></li>
                            <li class="hideImg"><a href="${address_url}" class="aLabel"><span class="glyphicon glyphicon-map-marker"></span> 我的地址</a></li>
                            <li class="hideImg"><a href="${security_url}" class="aLabel"><span class="glyphicon glyphicon-cog"></span> 安全设置</a></li>
                            <li class="divider" role="separator"></li>
                            <li class="hideImg"><a href="${logout_url}" class="aLabel"><span class="glyphicon glyphicon-off"></span> 退出登录</a></li>
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
                        <input id="address" class="form-control" style="min-width: 630px;max-width: 630px" type="search" placeholder="请输入你的订餐地址（学校，写字楼或街道）"  onMouseOut = "searchByStationName()"/>
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
                                    <input id="phone" class="form-control loi" type="text" placeholder="手机/邮箱" name="phone">
                                    <input id="registerPassword" class="form-control loi" type="password" placeholder="您的密码" name="password">
                                    <input id="confirmationPassword" class="form-control loi" type="password" placeholder="确认密码" name="password_confirmation">
                                    <input id="checkcode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                    <input id="getCheckCodeButton" class="loh" type="button" value="免费获取验证码">
                                    <input id="registerButton" class="btn btn-default btn-register  loi" type="button" value="注册"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="forgot login-footer">
                            <span>打算
                                <a href="javascript: showRegisterForm();" class="alink">注册一个账号？</a>
                                 <a href="${forgot_password_url}" class="alink">忘记密码？</a>
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
        <a class="footer-nav" href="${pageContext.request.contextPath}/business/joinBusiness" >我要开店</a>
        <a class="footer-nav" href="${pageContext.request.contextPath}/service/gethelp" >问题答疑</a>
        <a class="footer-nav" href="${pageContext.request.contextPath}/service/getAgreement"  >规则中心</a>
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
