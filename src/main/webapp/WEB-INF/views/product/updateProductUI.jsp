<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/12/4
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>


<head>
    <title>商品添加页面</title>



    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/fileinput.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/bootstrap-select.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/css/business/bootstrapValidator.min.css">


</head>
<body>

<div class="container">
    <fieldset>
        <legend><h1 class="text-info">商品更改</h1></legend>
    </fieldset>

    <div>
        <form action="${pageContext.request.contextPath}/product/updateProduct" method="post" class="form-horizontal" enctype="multipart/form-data">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商品名称:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="productName" value="${requestScope.product.productName}" class="form-control">
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商品价格:</label>
                <div class="col-sm-4 ">
                    <input type="text" name="price" value="${requestScope.product.price}" class="form-control">
                </div>
            </div>

            <input type="hidden" name="status" value="${requestScope.product.status}"/>
            <input type="hidden" name="salesVolume" value="${requestScope.product.salesVolume}"/>
            <input type="hidden" name="shop_Id" value="${sessionScope.shop.id}">
            <input type="hidden" name="id" value="${requestScope.product.id}">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商品描述:</label>
                <div class="col-md-4 tl th">
                    <textarea name="description" rows="15" cols="50">${requestScope.product.description}</textarea>
                </div>
            </div>

            <input type="hidden" name="operateState" class="form-control" value="0">
            <div class="form-group">
                <label class="col-sm-4 control-label text-info">商品照片:</label>
                <div class="col-md-4 tl th">
                    <input name="file" type="file" multiple  class="file"  data-show-upload="false" data-show-caption="true">
                    <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-6 col-md-offset-3">
                    <input class="form-control btn btn-primary"  value="立&nbsp;&nbsp;即&nbsp;&nbsp;创&nbsp;&nbsp;建" type="submit">
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-6 col-md-offset-3">
                    <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
                </div>
            </div>


        </form>

    </div>


</div>

<div id="container" style="height:0px;width:0px;"></div>
</body>
<%--bootstrap--%>
<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrap.js"></script>
<%--文件上传--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput_locale_zh.js"></script>

<%--下拉列表--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/bootstrap-select.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/defaults-zh_CN.js"></script>
<script src="${pageContext.request.contextPath}/js/business/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/js/business/productSettleValidator.js"></script>

</html>