<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>审核投诉详情</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

    <style type="text/css">
        .pic {
            width: 200px;
            height: 200px
        }

        .picbtn {
            width: 120px;
            height: 60px;
            font-size: 20px;
        }

        .picbtn:hover {
            width: 160px;
            margin-top: -20px;
            margin-left: -20px;
            height: 80px;
            font-size: 30px;
        }
    </style>
</head>
<script>
    function passcomp(id) {
        swal({
                title: "确定操作吗？",
                text: "你确定要一键审核吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#00FF00',
                confirmButtonText: 'sure'
            },
            function () {
        window.location.href = "${pageContext.request.contextPath}/ManageCom/replyComp?id=" + id;
    });
    }
    function notpasscomp(id) {
        swal({
                title: "确定操作吗？",
                text: "你确定要一键审核吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: '#00FF00',
                confirmButtonText: 'sure'
            },
            function () {
        window.location.href = "${pageContext.request.contextPath}/ManageCom/replyfalseComp?id=" + id;
    });
    }
    var replyerror = "${replyerror}";
    if(replyerror!='') {
        window.onload = function() {
            swal("操作失败", "回复用户的投诉信息失败!", "error");
        };
    }
</script>
<body>
<div class="col-sm-9">
    <div class="col-sm-12" style="align:center;">

        <label style="font-size: 20px;">
            <h2>审核投诉</h2>
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">

        <label style="font-size: 20px;">
            投诉者姓名：
        </label>
        <label style="font-size: 20px;">
            ${account.username}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            投诉者电话：
        </label>
        <label style="font-size: 20px;">
            ${account.phone}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            被投诉商家姓名：
        </label>
        <label style="font-size: 20px;">
            ${shop.business.account.username}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            商店名称：
        </label>
        <label style="font-size: 20px;">
            ${shop.shopName}
        </label>
    </div>
    <div class="col-sm-6" style="padding-top: 30px;">
        <label style="font-size: 20px;">
            商店地址：
        </label>
        <label style="font-size: 20px;">
            ${shop.address}
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

    <div class="col-sm-4" style="padding-top: 30px;">
        <div class="panel panel-default">
            <label style="font-size: 20px;">
                照片实例：：
            </label>
            <div class="panel-body">
                <p><label></label>
                    <img src="${pageContext.request.contextPath}/upload/complaint/${managecomp.evindence}"
                         class="img-thumbnail pic"/>
                </p>
            </div>
        </div>
    </div>
</div>
    <div class="col-sm-3">

        <div class="col-sm-3" style="padding-top:200px;">
            <div class="col-sm-12">
                <button type="button" class="btn btn-primary picbtn"
                        onclick="passcomp(${managecomp.id})">符合事实
                </button>
            </div>
            <div class="col-sm-12" style="margin-top: 160px;">
                <button type="button" class="btn btn-warning picbtn"
                        onclick="notpasscomp(${managecomp.id})">违背事实
                </button>
            </div>
        </div>
    </div>
</body>
</html>
