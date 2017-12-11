<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/10
  Time: 16:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>商家登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/css/account/login-register.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/account/index.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/business/style.css" rel="stylesheet" />
</head>

<body class="bodybox">
        <div class="indexfont">
            <b>加入rufull 开店赚大钱</b>
        </div>

        <div class="statistics">
            <div class="statistic">
                <div class="data">
                    <span class="number ng-binding">12</span>
                    <span class="unit">小时</span>
                </div>
                <div class="description">极速开店</div>
            </div>

            <div class="statistic">
                <div class="data">
                    <span class="number ng-binding">130</span>
                    <span class="unit">万</span>
                </div>
                <div class="description">优质商家</div>
            </div>

            <div class="statistic">
                <div class="data">
                    <span class="number ng-binding">2000</span>
                    <span class="unit">城市</span>
                </div>
                <div class="description">全国覆盖</div>
            </div>

            <div class="statistic">
                <div class="data">
                    <span class="number ng-binding">2.6</span>
                    <span class="unit">亿</span></div>
                <div class="description">累计用户
                </div>
            </div>

            <div class="btn-join-wrapper">
                <div class="fl">
                    <button class="btn-join-immediate" href="javascript:void(0)" onclick="openLoginModal();">欢迎登陆</button>
                </div>
                <div class="fr">
                    <button class="btn-join-immediate" href="javascript:void(0)" onclick="openRegisterModal();">点击注册</button>
                </div>
            </div>
        </div>

        <div class="container">

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
                                        <form method="post" accept-charset="UTF-8" action="${pageContext.request.contextPath}/account/businessLogin">
                                            <input id="username" class="form-control loi" type="text" placeholder="手机/用户名/邮箱"
                                                   name="username">

                                            <input id="loginPassword" class="form-control loi" type="password" placeholder="密码"
                                                   name="password">
                                            <input id="loginButton" class="btn btn-default loi btn-login" type="button"
                                                   value="登陆">
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="box">
                                <div class="content registerBox" style="display:none;">
                                    <div class="form">
                                        <%--<form method="post" action="<c:url value="/account/accountRegister"/>" accept-charset="UTF-8"> -->--%>
                                        <form method="post" action="${pageContext.request.contextPath}/account/businessRegister">
                                            <input id="phone" class="form-control loi" type="text" placeholder="手机/邮箱"
                                                   name="phone">
                                            <input id="registerPassword" class="form-control loi" type="password"
                                                   placeholder="您的密码" name="password">
                                            <input id="confirmationPassword" class="form-control loi" type="password"
                                                   placeholder="确认密码" name="password_confirmation">
                                            <input id="checkcode" type="text" class="loh" name="checkCode" placeholder="验证码">
                                            <input id="getCheckCodeButton" class="loh" type="button" value="免费获取验证码">
                                            <input id="registerButton" class="btn btn-default btn-register  loi" type="submit"
                                                   value="注册">
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
</body>


<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/business/joinBusiness.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/account/index.js" type="text/javascript"></script>
</html>
