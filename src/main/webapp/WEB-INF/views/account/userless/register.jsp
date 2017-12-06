<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/11/29
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>注册界面</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $(":input[name='phone']").change(function () {
                var val = $(this).val();
                val = $.trim(val);
                if(val != "") {
                    var url = "${pageContext.request.contextPath}/check/registerWays";
                    var args = {"phone":val,"time":new Date()};
                    $.post(url,args, function (data) {
                        $("#message").html(data);
                        $("#submitqqq").setAttribute("disabled", true);
                        $("#submitqqq").value("哈哈哈");
                    });
                }
            })
        });

        $(function () {
            $(":input[id='sendCheckCode']").click(function () {
                var val = $("#phone").val();
                val = $.trim(val);
                if(val != "") {
                    var url = "${pageContext.request.contextPath}/check/sendRegisterCode";
                    var args = {"phone":val,"time":new Date()};
                    $.post(url,args, function (data) {
                        $("#getCheckCode").html(data);
                    });
                }
            })
        });
    </script>
    <script type="text/javascript">
        var countdown=10;
        function settime(val) {
            if (countdown == 0) {
                val.removeAttribute("disabled");
                val.value="免费获取验证码";
                countdown = 10;
                return;
            } else {
                val.setAttribute("disabled", true);
                val.value="重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function() {
                settime(val)
            },1000)
        }
    </script>
</head>
<body>
    <h1>注册界面</h1>
    <form method="post" action="<c:url value="/account/register"/>">
        手机：<input id="phone" type="text" name="phone"><div id="message"></div>
        密码：<input type="password" name="password"/><br/>
        验证：<input type="text" name="checkCode"/><input id="sendCheckCode" type="button" onclick="settime(this)" value="免费获取验证码" />
        <div id="getCheckCode"></div><br/>
        <input id="submitqqq" type="submit" name="提交"/>
    </form>
</body>
</html>
