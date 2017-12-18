<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>投诉详情</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/system/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/js/system/jquery-1.9.0.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/js/system/exporting.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/highcharts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/jquery.form.js"></script>
    <style type="text/css">
        .pic {
            width: 200px;
            height: 200px
        }
    </style>
</head>
<script>

    function returnlast() {
        history.go(-1);
    }

</script>
<body>
<div class="col-sm-9" style="padding-left:80px;">
    <div class="col-sm-9" style="align:center;">

        <label style="font-size: 20px;">
            <h2>投诉详情</h2>
        </label>
    </div>
    <div class="col-sm-3" style="padding-top:20px;">

            <button type="button" class="btn btn-warning"
                    onclick="returnlast()">返回
            </button>

    </div>
    <div class="col-sm-6" style="padding-top: 30px;">

        <label style="font-size: 20px;">
            投诉者姓名：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.account.username}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            投诉者电话：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.account.phone}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            被投诉商家姓名：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.shop.business.account.username}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            商店名称：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.shop.shopName}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            商店地址：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.shop.address}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            投诉类型：
        </label>
        <label style="font-size: 20px;">
            <c:if test="${managecomp.type==1}">
                商家已接单但未送餐
            </c:if>
            <c:if test="${managecomp.type==2}">
                商家美食存在卫生问题
            </c:if>
            <c:if test="${managecomp.type==3}">
                其他类型
            </c:if>
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            投诉内容：
        </label>
        <label style="font-size: 20px;">
            ${managecomp.content}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            创建时间：
        </label>
        <label style="font-size: 20px;">
            <td><fmt:formatDate value="${managecomp.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
        </label>
    </div>

    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            处理人：
        </label>
        <label style="font-size: 20px;">
            <td>${solver.username}</td>
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            处理结果：
        </label>
        <label style="font-size: 20px;">
            <c:if test="${managecomp.result==1}">
                <td>情况属实</td>
            </c:if>
            <c:if test="${managecomp.result==2}">
                <td>情况作假</td>
            </c:if>
        </label>
    </div>
    <div class="col-sm-4" style="padding-top: 30px;">
        <div class="panel panel-default">
            <label style="font-size: 20px;">
                照片实例：：
            </label>
            <div class="panel-body">
                <p><label></label>
                    <img src="${pageContext.request.contextPath}/upload/complaint/${managecomp.evidence}"
                         class="img-thumbnail pic"/>
                </p>
            </div>
        </div>
    </div>

</div>

</body>
</html>
