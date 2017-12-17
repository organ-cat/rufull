<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/12/12
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!DOCTYPE html>
<html lang="zh-cn">
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/example.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/system/sweet-alert.css">
    <script src="${pageContext.request.contextPath}/js/system/sweet-alert.min.js"></script>

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
                    $("#imgSize1ImgSrc").attr("src", "${pageContext.request.contextPath}/" + jsonObj.path);
                    //数据库保存相对路径
                    $("#imgSize1").val(jsonObj.relativePath);
                    swal("操作成功", "成功更新头像!", "success");
                }
            };

            $("#ManagerForm").ajaxSubmit(option);
        }
        function submitform() {
            swal({
                    title: "确定操作吗？",
                    text: "你确定要更新个人信息吗？",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: '#00FF00',
                    confirmButtonText: 'sure'
                },
                function () {
                    document.Infoform.submit();
                });
        }
        var editInfosuccess = "${editInfosuccess}";
        var editInfoerror = "${editInfoerror}";
        var editpwdsuccess = "${editpwdsuccess}";
        if (editpwdsuccess != '') {
            window.onload = function () {
                swal("操作成功", "成功修改登陆密码!", "success");
            };
        }
        if (editInfosuccess != '') {
            window.onload = function () {
                swal("操作成功", "成功修改个人信息!", "success");
            };
        }

        if (editInfoerror != '') {
            window.onload = function () {
                swal("操作失败", "修改个人信息失败!", "error");
            };
        }

        phone.oninvalid=function(){
            phone.setCustomValidity("请输正确的手机号码？");
        };
    </script>
</head>

<body>
<form id="ManagerForm" name="Infoform" class="form-inline"
      action="${pageContext.request.contextPath}/manager/editManagerInfo" method="post" enctype="multipart/form-data">
    <div class="col-sm-3" style="padding-top: 100px;">
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding:3px;height:30px;">
                我的头像
            </div>
            <div class="panel-body" id="imgSrc">
                <p><label></label>
                    <img id="imgSize1ImgSrc"
                         src="${pageContext.request.contextPath}/upload/manager/${sessionScope.manager.photo}"
                         height="250px" width="224px"
                         class="img-thumbnail"/>
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
            <input type="text" class="form-control input-lg" style="min-width: 450px;" id="username" required
                   value="${sessionScope.manager.username}" name="username" placeholder="请输入姓名！">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="phone">手机:</label>
            <input type="number" class="form-control input-lg" style="min-width: 450px;" id="phone" required pattern="^1[3-9]\d{9}$"
                   value="${sessionScope.manager.phone}" name="phone" placeholder="1xxxxxxxxxx">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group">
            <label style="font-size: 20px;" for="exampleInputEmail2">邮箱:</label>
            <input type="email" class="form-control input-lg" style="min-width: 450px;" id="exampleInputEmail2" required
                   value="${sessionScope.manager.email}" name=" email" placeholder="xxxxxxxxx@xxx.com">
        </div>
    </div>
    <div class="col-sm-8" style="padding-top: 20px;padding-left: 150px">
        <div class="form-group" style="padding-left: 350px;">
            <input type="button" onclick="submitform();" class="sgBtn" value="确定修改">
        </div>
    </div>
</form>

</body>
</html>
