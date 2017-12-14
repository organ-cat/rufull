<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/13
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>根据条件查询商家</title>
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
    <script type="text/javascript">
        function delShop(id) {

            window.location.href="${pageContext.request.contextPath}/manageShop/delBusiness?id="+id;
        }
        function redelShop(id) {

            window.location.href="${pageContext.request.contextPath}/manageShop/redelBusiness?id="+id;
        }
        function findshoplist() {
            document.findshop.submit();
        }

    </script>

</head>
<body>
<form class="form-inline" name="findshop" action="${pageContext.request.contextPath}/manageShop/findByCondition" method="post">
    <div class="col-sm-8">
        <div class="form-group" style="padding-left: 40%;padding-top: 50px;padding-bottom: 10px;">

            <input type="text"  class="form-control input-lg"
                   id="findname"  name="condition" style="min-width: 350px;max-width: 350px;" placeholder="请填写查找条件">
            <button type="submit" style="max-width: 150px;"
                    class="btn btn-lg" onclick="findshoplist();">查找</button>
        </div>
    </div>
</form>
<div class="col-sm-12">
    <div class="panel panel-default">

        <div class="panel-heading" style="padding-top:3px;height:40px;padding-left: 50%">
            <h4>商家列表展示</h4>
        </div>
        <table class="table table-bordered">
            <tr>
                <th>商家姓名</th>
                <th>商店名称</th>
                <th>商店电话</th>
                <th>商店地址</th>
                <th>营业时间段</th>
                <th>配送范围</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${mshoplist}" var="list">
                <tr>
                    <td>${list.business.account.username}</td>
                    <td>${list.shopName}</td>
                    <td>${list.shopPhone}</td>
                    <td>${list.address}</td>
                    <td>${list.operateTime}</td>
                    <td>${list.shippingDistance}</td>
                    <td>
                        <c:if test="${list.business.account.status==201}">
                            &nbsp;&nbsp;未创建商店
                        </c:if>
                        <c:if test="${list.business.account.status==202}">
                            &nbsp;&nbsp;正常开业
                        </c:if>
                        <c:if test="${list.business.account.status==203}">
                            &nbsp;&nbsp;停业整顿
                        </c:if>
                        <c:if test="${list.business.account.status==204}">
                            &nbsp;&nbsp;撤销入驻
                        </c:if>
                    </td>


                    <td align="center">
                        <c:if test="${list.business.account.status==201}">
                            <input type="button" class="btn btn-danger" value="撤销入驻"
                                   onclick="delShop(${list.business.id});"/>
                        </c:if>
                        <c:if test="${list.business.account.status==202}">
                            <input type="button" class="btn btn-danger" value="撤销入驻"
                                   onclick="delShop(${list.business.id});"/>
                        </c:if>
                            <c:if test="${list.business.account.status==203}">
                                <input type="button" class="btn btn-warning" value="允许开业"
                                       onclick="redelShop(${list.business.id});"/>
                            </c:if>
                        <c:if test="${list.business.account.status==204}">
                            <input type="button" class="btn btn-warning" value="重新入驻"
                                   onclick="redelShop(${list.business.id});"/>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
