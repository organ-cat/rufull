<%--
  Created by IntelliJ IDEA.
  User: jiang
  Date: 2017/12/5
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>登陆成功</title>
    <script type="text/javascript">
        function imgPreview(fileDom){
            //判断是否支持FileReader
            if (window.FileReader) {
                var reader = new FileReader();
            } else {
                alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
            }

            //获取文件
            var file = fileDom.files[0];
            var imageType = /^image\//;
            //是否是图片
            if (!imageType.test(file.type)) {
                alert("请选择图片！");
                return;
            }
            //读取完成
            reader.onload = function(e) {
                //获取图片dom
                var img = document.getElementById("preview");
                //图片路径设置为读取的图片
                img.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    </script>
</head>
<body>
<h1>Login Success</h1>
${account.username}<br/>
${account.phone}<br/>
${account.email}<br/>
<hr/>
<img id="preview" style="width: 100px;height: 100px;"/>
<br />
<input type="file" name="file"  />

<form method="post" enctype="multipart/form-data" action="<c:url value="/test/upload"/>">
    <input type="file" name="photo">
    <input type="submit" onchange="imgPreview(this)" value="upload"/>
</form>

<img style="width: 100px;height: 100px;" src="http://localhost:8080/rufull/upload/account/${account.photo}">

</body>
</html>
