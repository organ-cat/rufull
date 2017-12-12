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
    <style type="text/css">
        .sgBtn{width: 135px; height: 35px; line-height: 35px; margin-left: 10px; margin-top: 10px; text-align: center; background-color: #0095D9; color: #FFFFFF; float: left; border-radius: 5px;}
    </style>
    <script type="text/javascript">
        function submitImgSize1Upload(){

            //发送ajax上传图片
            var option={
                type:'POST',
                url:'${pageContext.request.contextPath }/manager/resetPhoto',
                dataType:'text',
                data:{
                    fileName : 'file'
                },
                success:function(data){

                    //把json格式的字符串转换成json对象
                    var jsonObj = JSON.stringify(data);
                    //返回服务器图片路径，把图片路径设置给img标签
                    $("#imgSize1ImgSrc").attr("src",jsonObj);
                    $("#imgSize1").val(jsonObj);
                }
            };

            $("#ManagerForm").ajaxSubmit(option);
        }
    </script>
</head>

<body>
<form id="ManagerForm" action="" method="post" enctype="multipart/form-data">
<div class="col-sm-3" style="padding-top: 100px;">
    <div class="panel panel-default" >
        <div class="panel-heading" style=" padding:3px;height:30px;"  >
            我的头像
        </div>
        <div class="panel-body" id="imgSrc">
            <p><label></label>
                <img id="imgSize1ImgSrc" src="{pageContext.request.contextPath}/upload/manager/profile-pic.jpg"  height="200px" width="224px" />
                <input type="file" style="max-width:224px" id='imgSize1File' name='file' class="file" onchange='submitImgSize1Upload()' />
                <span class="pos" id="imgSize1FileSpan">请上传图片的大小不超过3MB</span>
                <input type="hidden" id="imgSize1" name="pic" value="" reg="^.+$" tip="亲！您忘记上传图片了。" />
            </p>

        </div>
    </div>
</div>


</form>

</body>
</html>
