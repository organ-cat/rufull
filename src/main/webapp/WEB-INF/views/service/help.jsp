<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/9
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>

    <title>帮助中心</title>

    <spring:url value="/" var="rootUrl"/>
    <spring:url value="/order" var="showOrderUrl"/>
    <spring:url value="/order/unrated" var="showUnratedOrderUrl"/>
    <spring:url value="/order/refund" var="showRefundOrderUrl"/>
    <spring:url value="#" var="showAgreementUrl"/>
    <spring:url value="/logout" var="logoutUrl"/>
    <spring:url value="#" var="showProfileUrl"/>
    <spring:url value="/cart" var="showCartUrl"/>
    <spring:url value="/favor" var="showFavorUrl"/>
    <spring:url value="/address" var="showAddressUrl"/>
    <spring:url value="/security" var="showSecurityUrl"/>
    <spring:url value="/service/gethelp" var="gethelp"/>
    <spring:url value="/service/getAccorder" var="getAccorder"/>
    <spring:url value="/service/getAgreement" var="getAgreement"/>
    <spring:url value="/service/fanAnalysis?type=0" var="fan"/>
    <spring:url value="/service/fanAnalysis?type=1" var="column"/>

    <link href="${pageContext.request.contextPath}/css/service/forward.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link href="${pageContext.request.contextPath}/css/account/login-register.css" rel="stylesheet">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/js/account/login-register.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <script type="text/javascript">
        function loginerror() {
                swal("操作失败", "用户尚未登录!", "error");
                }
            $("body").css("width", window.innerWidth);
            $(window).resize(function () {
            $("body").css("width", window.innerWidth);
        })
    </script>
</head>

<body>

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
<div>
    <div>
        <header class="topbar">
            <nav class="navbar navbar-default">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="${rootUrl}"><img class="img-responsive center-block" alt="饱了么" src=""></a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li class="hidden-sm hidden-md"><a href="${rootUrl}">首页</a></li>
                            <li ><a href="${showOrderUrl}">我的订单</a></li>
                            <li><a href="${showCooperationUrl}">加盟合作</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="hidden-sm hidden-md"><a href="${showAgreementUrl}">规则中心</a></li>
                                <c:if test="${empty account}">
                                    <li class="hidden-sm hidden-md">
                                        <a href="javascript:void(0)" style="color: indigo;" onclick="openLoginModal();">
                                            登录/注册
                                        </a></li>
                                </c:if>

                                <c:if test="${!empty account}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                                   aria-expanded="false">${account.nickname}<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${showProfileUrl}"><span class="glyphicon glyphicon-user"
                                                                          aria-hidden="true"></span>个人中心</a></li>
                                    <li><a href="${showCartUrl}"><span class="glyphicon glyphicon-shopping-cart"
                                                                       aria-hidden="true"></span>购物车</a></li>
                                    <li><a href="${showFavorUrl}"><span class="glyphicon glyphicon-star"
                                                                        aria-hidden="true"></span>我的收藏</a></li>
                                    <li><a href="${showAddressUrl}"><span class="glyphicon glyphicon-map-marker"
                                                                          aria-hidden="true"></span>我的地址</a></li>
                                    <li><a href="${showSecurityUrl}"><span class="glyphicon glyphicon-cog"
                                                                           aria-hidden="true"></span> 安全设置</a></li>
                                    <li class="divider" role="separator"></li>
                                    <li><a href="${logoutUrl}"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                                        退出登录</a></li>
                                </ul>
                            </li></c:if>
                        </ul>
                    </div>
                </div>
            </nav>

        </header>
    </div>
</div>

<div class="full-content-wrapper">
    <div class="container">
        <div class="help">
            <div class="help-site" data-spy="affix" data-offset-top="84">
            <ul class="">
                <li><a href="${gethelp}" class="active">问题答疑</a></li>
                <c:if test="${!empty account}">
                <li><a href="${getAccorder}" >我的账单</a></li>
                <li><a href="${fan}" >扇形分析</a></li>
                <li><a href="${column}">柱形分析</a></li>
                </c:if>
                <c:if test="${empty account}">
                    <li><a  href="javascript:void(0);" onclick="loginerror();" >我的账单</a></li>
                    <li><a href="javascript:void(0);" onclick="loginerror();" >扇形分析</a></li>
                    <li><a href="javascript:void(0);" onclick="loginerror();" >柱形分析</a></li>
                </c:if>
                <li><a href="${getAgreement}">网站规则</a></li>
            </ul>
        </div>
            <div class="help-content">
                <h1>热门问题</h1>
                <ul class="answer-list">
                    <li><h3>在线支付问题</h3>
                        <ul class="answer-sub-list">
                            <li><a href="#Q1">使用余额支付不了？</a></li>
                            <li><a href="#Q2">在线支付订单取消后，钱怎么返还？</a></li>
                            <li><a href="#Q3">在线支付的过程中，订单显示未支付成功，款项却被扣了，怎么办？</a></li>
                            <li><a href="#Q4">每天限制优惠两单，前面下了一个在线支付的单子，由于未付款，订单自动取消了，这单会计算我的参与活动次数吗？</a></li>
                            <li><a href="#Q5">个人账户里的款项怎么提现？</a></li>
                        </ul>
                    </li>

                    <li><h3>活动问题</h3>
                        <ul class="answer-sub-list">
                            <li><a href="#Q12">新用户定义</a></li>
                            <li><a href="#Q13">网站餐品活动规则</a></li>
                            <li><a href="#Q14">我第一次在“A”餐厅下单，“A”餐厅有参加“1st”活动，我为什么享受不到新用户的立减优惠？</a></li>
                        </ul>
                    </li>
                    <li><h3>订餐问题</h3>
                        <ul class="answer-sub-list">
                            <li><a href="#Q15">下单后，餐厅长时间未确认订单，怎么办？</a></li>
                            <li><a href="#Q16">餐厅确认订单了，我要催单，怎么办？</a></li>
                            <li><a href="#Q17">实际送餐时间跟吃货宝上显示的送餐时间有差距？</a></li>
                            <li><a href="#Q18">点餐的时候提示美食篮子失效，怎么回事？</a></li>
                        </ul>
                    </li>

                    <li><h3>其他问题</h3>
                        <ul class="answer-sub-list">
                            <li><a href="#Q19">什么是超时赔付？</a></li>
                            <li><a href="#Q20">什么是订单数？</a></li>
                            <li><a href="#Q21">美食多久内可以点评？点评后是否能修改？</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="ouranswer-list">
                    <li><h3>在线支付问题</h3>
                        <ul class="ouranswer-sub-list">
                            <li id="Q1"><h4>使用余额支付不了？</h4>
                                <p>先确认下您的吃货宝账户是否有绑定手机号码，使用余额支付必须先绑定手机号码。</p></li>
                            <li id="Q2"><h4>在线支付订单取消后，钱怎么返还？</h4>
                                <ul class="list-with-icon">
                                    <li>使用吃货宝账户余额支付（包括：余额、余额+红包、第三方支付+余额+红包、第三方支付+余额），订单无效后，所有款项（包括红包）将退到您的吃货宝账户。</li>
                                    <li>用户使用第三方支付的（包括：第三方支付+红包、第三方支付），订单无效后，支付款项将在3-10个工作日返还到您的支付账户。红包退还到吃货宝账户。</li>
                                </ul>
                            </li>
                            <li id="Q3"><h4>在线支付的过程中，订单显示未支付成功，款项却被扣了，怎么办？</h4>
                                <p>这个属于第三方（银行/支付宝/微信等）数据传输延迟问题。您可以再等待一下，
                                    如果超过半个小时，订单还是未支付状态，第三方会把款项返还到您的付款账户。到账时间依银行而定，一般会在3个工作日内。</p></li>
                            <li id="Q4"><h4>每天限制优惠两单，前面下了一个在线支付的单子，由于未付款，订单自动取消了，这单会计算我的参与活动次数吗？</h4>
                                <p>会，是由于未付款订单取消了，这个订单也会计入您使用优惠的次数。货到付款和已经付款的订单无效后是不会统计优惠次数的。</p></li>
                            <li id="Q5"><h4>个人账户里的款项怎么提现？</h4>
                                <p>目前暂不支持用户自助提现。您可以致电客服，让客服给予操作提现。操作日起3-10个工作日款项会原路返还到您的付款账户。</p></li>
                        </ul>
                    </li>
                    <li><h3>活动问题</h3>
                        <ul class="ouranswer-sub-list">
                            <li id="Q12"><h4>新用户定义</h4>
                                <p>新用户是根据吃货宝账号、手机号码、设备、支付账号、银行卡号进行判断，如果您下单时以上信息均为首次使用则是符合吃货宝定义的新用户。</p></li>
                            <li id="Q13"><h4>网站餐品活动规则</h4>
                                <ul class="list-with-icon">
                                    <li>网站所有活动，每位用户每天只限2单优惠，超过2单收取原价。</li>
                                    <li>每个订单最多享受3份活动优惠，超过3份的其余餐品收取原价。</li>
                                    <li>下单手机号码和所选择订餐的餐厅不在同一城市，不享受优惠活动。</li>
                                    <li>餐盒费和配送费不计入活动价额。</li>
                                </ul>
                            </li>
                            <li id="Q14"><h4>我第一次在“A”餐厅下单，“A”餐厅有参加“1st”活动，我为什么享受不到新用户的立减优惠？</h4>
                                <p>活动中的新用户指的是吃货宝网站的新用户，而不是指“A”餐厅的新客户。如果您不符合吃货宝网站新用户的定义则无法享受于新用户相关的活动优惠。</p></li>
                        </ul> </li>
                            <li><h3>订餐问题</h3>
                                <ul class="ouranswer-sub-list">
                                    <li id="Q15"><h4>下单后，餐厅长时间未确认订单，怎么办？</h4>
                                        <p>这个情况可能由于餐厅出现网络信号问题无法及时查看到您的订单，您可以在订单上查找到餐厅电话，致电餐厅进行确认订单。如果联系不上餐厅可以致电客服。</p>
                                    </li>
                                    <li id="Q16"><h4>餐厅确认订单了，我要催单，怎么办？</h4>
                                        <p>
                                            如果餐厅页面支持留言，您可以直接给餐厅留言催单。如果餐厅页面不支持留言，您可以到饿单中心，查找到餐厅电话，直接致电餐厅进行催单。如果联系不上餐厅可以致电客服。</p>
                                    </li>
                                    <li id="Q17"><h4>实际送餐时间跟吃货宝上显示的送餐时间有差距？</h4>
                                        <p>吃货宝上显示是最近 30
                                            天用户点评的餐厅送餐速度的平均值。这个送餐速度只是作为用户订餐时的参考,跟实际送餐速度有出入属于正常情况。遇到恶劣天气时,送餐速度会受到影响。</p>
                                    </li>
                                    <li id="Q18"><h4>点餐的时候提示美食篮子失效，怎么回事？</h4>
                                        <ul class="list-with-icon">
                                            <li>请检查您的美食篮子价格是否低于4元，网站规定参与活动下单，总下单价格必须&gt;=4元，若低于4元是无法下单的。所以显示无效。</li>
                                            <li>如果您的价格正常，美食篮子依然显示无效，建议您卸载客户端重新安装。</li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                            <li><h3>其他问题</h3>
                                <ul class="ouranswer-sub-list">
                                    <li id="Q19"><h4>什么是超时赔付？</h4>
                                        <p>
                                            餐厅页面有“赔”字icon的，则说明该餐厅有参加超时赔付。超时赔付是指：餐厅承诺一个送达时间和一个折扣,从用户下单时间开始计算,如果外卖超过了承诺时间才送到,则该份外卖按照折扣价收取费用。若餐厅有备注：由于恶劣天气、某些美食烹调时间过长、或者其他因素,餐厅可以选择性的延长承诺时间或者不做承诺。</p>
                                    </li>
                                    <li id="Q20"><h4>什么是订单数？</h4>
                                        <p>订单数是指餐厅最近30天的订单总数，这个数据是动态的，每天都会进行更新。</p></li>
                                    <li id="Q21"><h4>美食多久内可以点评？点评后是否能修改？</h4>
                                        <p>美食一旦点评就不能做修改。如果您有特殊情况需要删除点评，可以联系客服协助操作。</p></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
</html>
