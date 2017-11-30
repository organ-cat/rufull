<%--
  Created by IntelliJ IDEA.
  User: Luckily
  Date: 2017/11/30
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="no-js" lang="zh">
<head>
    <meta charset="utf-8" />
    <title>首页-index.html</title>
    <meta name="description" content="欢迎使用RuFull" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="http://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/city-picker.css" rel="stylesheet" type="text/css" />
    <link class="usemin" rel="stylesheet" href="css/global.48e3a844.css" />
    <link class="usemin" rel="stylesheet" href="css/homepage.8efdfd7c.css" />
    <script>
    </script>
</head>
<body class="homepage">
<div class="homepage-container" align="center" style="width:1080px;">
    <header class="homepage-header" style="width:1050px;">
        <h1 class="header-logo"><img src="image/logo1.png" style="height:50px;width:300px;"></img></h1>
        <div class="header-account" style="margin-top:-48px;">
            <a class="link" href="login.html">登录</a> /
            <a class="link" href="register.html">注册</a>
        </div>
    </header>
    <div class="container" style="width:1080px;">
        <form class="form-inline">
            <div id="distpicker" class="form-group">
                <div class="form-group" >
                    <div style="position: relative;">
                        <input id="city" class="form-control" type="search" readonly = "readonly" value="" style = "border:0px;max-width: 320px;min-width: 320px; " vdata-toggle="city-picker" >
                    </div>
                </div>
                <div class="form-group">
                    <div style="position: relative;" style="margin-left:-10px;">
                        <input id="address" class="form-control" type="search" placeholder="请输入你的订餐地址（学校，写字楼或街道）"  onMouseOut = "searchByStationName()">
                        <button class="btn btn-danger" style="width:70px;height:48px;"  type="button"><font size="4px">搜索</font></button>
                    </div>
                    <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:250px;height:auto; display:none;"></div>
                </div>
            </div>
        </form>
    </div>
    <div id="container" style="width:1050px;height:430px;"></div>

    <footer class="homepage-footer">
        <a class="footer-nav" href="http://kaidian.ele.me" target="_blank">我要开店</a>
        <a class="footer-nav" href="http://ele.me/links" target="_blank">友情链接</a>
        <a class="footer-nav" href="http://ele.me/sitemap" target="_blank">网站地图</a>
    </footer>
</div>
</div>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=QAcuscTkuTce2GQd4iAMWs946omOlVRi"></script>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
<!--取定位信息-->
<script type="text/javascript">
    var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
    var point = new BMap.Point(120.2,30.25);    //创建点坐标
    map.centerAndZoom(point, 16);                //初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom();                //激活滚轮调整大小功能
    map.addControl(new BMap.NavigationControl());    //添加控件：缩放地图的控件，默认在左上角；
    map.addControl(new BMap.MapTypeControl());        //添加控件：地图类型控件，默认在右上方；
    map.addControl(new BMap.ScaleControl());        //添加控件：地图显示比例的控件，默认在左下方；
    map.addControl(new BMap.OverviewMapControl());  //添加控件：地图的缩略图的控件，默认在右下方；
    var search = new BMap.LocalSearch("中国", {
        onSearchComplete: function(result){
            if (search.getStatus() == BMAP_STATUS_SUCCESS){
                var res = result.getPoi(0);
                var point = res.point;
                map.centerAndZoom(point, 11);
            }
        },renderOptions: {  //结果呈现设置，
            map: map,
            autoViewport: true,
            selectFirstResult: true
        } ,onInfoHtmlSet:function(poi,html){//标注气泡内容创建后的回调函数，有了这个，可以简单的改一下返回的html内容了。
        }//这一段可以不要，只不过是为学习更深层次应用而加入的。
    });
    ///////////////////////////////////////////////////////////////////////////////////
    var $citypicker = $('#city');
    $citypicker.citypicker();

    var lng = "";
    var lat = "";
    var province = "";
    var city = "";
    var region = "";
    $(function () {
        var geolocation = new BMap.Geolocation();
        geolocation.getCurrentPosition(function (r) {
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                var myGeo = new BMap.Geocoder();
                myGeo.getLocation(new BMap.Point(r.point.lng, r.point.lat), function (result) {
                    if (result) {
                        var addComp = result.addressComponents;
                        province = addComp.province;
                        city = addComp.city;
                        region = addComp.district;
                        search.search(city);
                        var a=addComp.province + "/" + addComp.city + "/"+addComp.district;
                        $citypicker.val(a);
                        $citypicker.citypicker('refresh');
                    }
                });
            }
            else {
                alert("无法获得您的位置，请手动选择！");
            }
        }, { enableHighAccuracy: true });
    });



    $('#searcher').click(function () {
        var region = document.getElementById("city").value;
        var strs= new Array(); //定义一数组
        strs = region.split(" -- ");
        window.location.href="${pageContext.request.contextPath}/user/showshop.do?strs = "+strs;
    });

    ///////////////////////////////////////////////////////////////////////////////

    function searchByStationName() {
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport(); //允许自动调节窗体大小
        map.clearOverlays();//清空原来的标注
        var keyword = document.getElementById("address").value;
        localSearch.setSearchCompleteCallback(function (searchResult) {
            //var last=JSON.stringify(searchResult);
            //alert(last);


     /*       var q=searchResult.province + "/" + searchResult.city + "/"+null;
            //alert(q);
            var region = document.getElementById("city").value;
            var strs= new Array(); //定义一数组
            strs = region.split(" -- ");
            var name="";
            for(var a=0;a<strs.length;a++){
                name =name+strs[a];
            }
            if(name.indexOf(""+searchResult.vr[0].address)==-1){
                alert(name+searchResult.vr[0].address+"="+name.indexOf(""+searchResult.vr[0].address));
                $citypicker.val(q);
                $citypicker.citypicker('refresh');
            }
            else{
                var q=""
                for(var a=0;a<(2);a++){
                    q =q+strs[a] + "/";
                }
                q =q + strs[2];
                alert(q);
                $citypicker.val(q);
                $citypicker.citypicker('refresh');
            }*/


            var poi = searchResult.getPoi(0);
            //alert( poi.point.lng + "," + poi.point.lat);
            map.centerAndZoom(poi.point, 15);
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);
            var content = document.getElementById("address").value + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
            var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
            marker.addEventListener("click", function () { this.openInfoWindow(infoWindow);
                lng = poi.point.lng;
                lat = poi.point.lat;
            });
        });
        localSearch.search(keyword);
    }
    ///////////////////////////////////////////////////////////////////////////////
    //根据ip定位城市
    /*	function myFun(result){
     var cityName = result.name;

     document.getElementById("city").value = cityName;
     map.setCenter(cityName);
     }
     var myCity = new BMap.LocalCity();
     myCity.get(myFun);
     */
    ////////////////////////////////////////////////////////////////////////////////////
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "address"
            ,"location" : map
        });

    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
        var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;

        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value =   _value.street +  _value.business;
        }
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
        var _value = e.item.value;
        myValue =  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

        var q=_value.province + "/" + _value.city + "/"+_value.district;
        $citypicker.val(q);
        $citypicker.citypicker('refresh');
        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
            onSearchComplete: myFun
        });
        document.getElementById("address").value = myValue;
        local.search(myValue);
    }
</script>

</body>
</html>
