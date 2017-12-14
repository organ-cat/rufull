<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员个人信息</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/system/indexJs.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/xcConfirm.css"/>
    <script src="${pageContext.request.contextPath}/js/system/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/system/promptbox.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        var editInfosuccess = "${sessionScope.editInfosuccess}";
        var editInfoerror = "${sessionScope.editInfoerror}";
    </script>
    <style type="text/css">
        .sgBtn {
            width: 135px;
            height: 35px;
            line-height: 35px;
            margin-left: 10px;
            margin-top: 10px;
            text-align: center;
            background-color: #0095D9;
            color: #FFFFFF;
            float: left;
            border-radius: 5px;
        }
    </style>
    <script type="text/javascript">
        function submitImgSize1Upload() {

            //发送ajax上传图片
            var option = {
                type: 'POST',
                url: '${pageContext.request.contextPath }/manager/resetPhoto',
                dataType: 'text',
                data: {
                    fileName: 'file'
                },
                success: function (data) {

                    //把json格式的字符串转换成json对象
                    var jsonObj = $.parseJSON(data);
                    //返回服务器图片路径，把图片路径设置给img标签
                    $("#imgSize1ImgSrc").attr("src","${pageContext.request.contextPath}/"+jsonObj.path);
                    //数据库保存相对路径
                    $("#imgSize1").val(jsonObj.relativePath);
                    var txt=  "更改头像成功！";
                    window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                }
            };

            $("#ManagerForm").ajaxSubmit(option);
        }
        function submitform() {
            document.Infoform.submit();
        }
    </script>
</head>

<body>
<form id="ManagerForm" name="Infoform" class="form-inline" action="${pageContext.request.contextPath}/manager/editManagerInfo" method="post" enctype="multipart/form-data">
    <div class="col-sm-3" style="padding-top: 100px;">
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding:3px;height:30px;">
                我的头像
            </div>
            <div class="panel-body" id="imgSrc">
                <p><label></label>
                    <img id="imgSize1ImgSrc" src="${pageContext.request.contextPath}/upload/manager/${sessionScope.manager.photo}"  height="250px" width="224px"/>
                    <input type="file" style="max-width:224px" id='imgSize1File' name='file' class="file"
                           onchange='submitImgSize1Upload()'/>
                    <span class="pos" id="imgSize1FileSpan">请上传图片的大小不超过3MB</span>
                    <input type="hidden" id="imgSize1" name="pic" value="" reg="^.+$" tip="亲！您忘记上传图片了。"/>
                </p>
            </div>
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 150px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="username">姓名:</label>
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username"
                  value="${sessionScope.manager.username}" name = "username" placeholder="请输入姓名！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone"
                   value="${sessionScope.manager.phone}" name="phone"  placeholder="1xxxxxxxxxx">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group">
            <label style="font-size: 20px;" for="exampleInputEmail2">邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="exampleInputEmail2"
                 value="${sessionScope.manager.email}" name=" email"  placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px" >
        <div class="form-group" style="padding-left: 350px;">
            <input type="button" onclick="submitform();" class="sgBtn" value="确定修改">
        </div>
    </div>
</form>

</body>
</html>
