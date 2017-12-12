<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <title>商家入驻页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/business/fileinput.css">


</head>
<body>
<div class="container">
    <fieldset>
        <legend><h1 class="text-info">商家入驻</h1></legend>
    </fieldset>
    <div class="col-md-6 col-md-offset-3">
        <form action="${pageContext.request.contextPath}/business/addBusiness"method="post" enctype="multipart/form-data">
            <div class="form-group has-feedback">
                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">商家室外图片：</h3>
                            <input name="files" type="file"   class="file "  data-show-upload="false" data-show-caption="true"/>
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">商家室内图片：</h3>
                            <input  name="files" type="file"   class="file "  data-show-upload="false" data-show-caption="true">
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">身份证正面照片：</h3>
                            <input  name="files" type="file" multiple  class="file "  data-show-upload="false" data-show-caption="true">
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">身份证背面照片：</h3>
                            <input  name="files" type="file" multiple  class="file "  data-show-upload="false" data-show-caption="true">
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">商家营业执照：</h3>
                            <input  name="files" type="file" multiple  class="file "  data-show-upload="false" data-show-caption="true">
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th">
                            <h3 class="text-info">餐厅服务营业执照：</h3>
                            <input id="" name="files" type="file" multiple  class="file"  data-show-upload="false" data-show-caption="true">
                            <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-10 tl th ">
                            <h3 class="text-info">身份证号：</h3>
                            <input  name="identifier" type="text" >
                            <p class="help-block">支持数字和字符18位</p>
                            <br/>
                            <br/>
                        </div>
                    </div>

                    <%--对应注册用户id--%>
                    <input type="hidden" name="accountId" value="${sessionScope.registerBusiness.id}">

                    <div class="form-group">
                        <input class="form-control btn btn-primary" id="submit" value="立&nbsp;&nbsp;即&nbsp;&nbsp;入&nbsp;&nbsp;驻" type="submit">
                    </div>

                    <div class="form-group">
                        <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
                    </div>
                </div>


            </form>
        </div>
    </div>
</body>

<script src="${pageContext.request.contextPath}/js/business/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/fileinput_locale_zh.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/business/index.js"></script>


</html>