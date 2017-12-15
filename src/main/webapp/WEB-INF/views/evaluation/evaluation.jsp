<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>进行评论页面</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

</head>
<body>
<div>

    <h2>待评价订单</h2>

    <table style="width: 85%; background: #909090; text-align:center;">
        <tr>
            <td rowspan="2" style="width: 100px;"><img src="商家图片.PNG"/></td>
            <td>商店名</td>
            <td rowspan="2">下单时间：</td>
            <td rowspan="2">总金额：</td>
        </tr>
        <tr>

            <td>订单项</td>
        </tr>
    </table>

    <br/>
    <form>
        <input type="hidden" name="account_id" value="1" />
        <input type="hidden" name="order_id" value="1" />
        <input type="hidden" name="business_id" value="1" />
        订单评价：<input type="text" name="comment"/><br/>
        订单评分：<input type="text"name="score"/>分<br/>
        评价商品：<br/>
        商品名称：xxx分<br/>
        商品评价：<input  type="text"/><br/>
        <input type="submit" value="提交评价"/>
    </form>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script
            src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
</body>
</html>
