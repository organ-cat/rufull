<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/12/5
  Time: 14:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <style>body{padding-top: 60px;}</style>

    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />

    <link href="${pageContext.request.contextPath}/css/account/login-register.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/account/login-register.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-4"></div>
        <div class="col-sm-4">
            <a class="btn big-login" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">
                登陆
            </a>
            <a class="btn big-register" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">
                注册</a>
        </div>
        <div class="col-sm-4"></div>
    </div>
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
                                <form method="post" action="<c:url value="/account/login"/>" accept-charset="UTF-8">
                                    <input class="form-control" type="text" placeholder="手机/用户名/邮箱" name="phone">
                                    <input class="form-control" type="password" placeholder="密码" name="password">
                                    <input class="btn btn-default btn-login" type="button" value="登陆" onclick="loginAjax()">
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="content registerBox" style="display:none;">
                            <div class="form">

                                <form method="post" action="<c:url value="/account/accountRegister"/>" accept-charset="UTF-8">
                                    <input id="phone" class="form-control" type="text" placeholder="手机/邮箱" name="phone">
                                    <input id="registerPassword" class="form-control" type="password" placeholder="您的密码" name="password">
                                    <input id="confirmationPassword" class="form-control" type="password" placeholder="确认密码" name="password_confirmation">
                                    <input id="checkcode" type="text" name="checkCode" placeholder="验证码">
                                    <input id="getCheckCodeButton" type="button" value="免费获取验证码">
                                    <input id="registerButton" class="btn btn-default btn-register" onclick="registerAjax()" type="submit" value="注册" >
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="forgot login-footer">
                            <span>打算
                                 <a href="javascript: showRegisterForm();">注册一个账号？</a>
                            </span>
                    </div>
                    <div class="forgot register-footer" style="display:none">
                        <span>已经有一个账号？</span>
                        <a href="javascript: showLoginForm();">登陆</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

