//放置屏幕左右跳动
$("body").css("width", window.innerWidth);
$(window).resize(function () {
    $("body").css("width", window.innerWidth);
})
//百度地图需要用到的东西
var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
var point = new BMap.Point(120.2,30.25);    //创建点坐标
map.centerAndZoom("重庆",12);  //初始化地图,设置城市和地图级别。

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

function compto(userLat,userLon,shopLat,shopLon){
    //lng经,lat纬
//        console.log(new Number(userLat));
//        console.log(new Number(userLon));
//        console.log(new Number(shopLat));
//        console.log(new Number(shopLon));

    var userPoint = new BMap.Point(new Number(userLat),new Number(userLon));  // 创建点坐标A--用户坐标
    var shopPoint = new BMap.Point(new Number(shopLat),new Number(shopLon));  // 创建点坐标B--商家坐标
    //距离
    var distance = (map.getDistance(userPoint,shopPoint)).toFixed(2);
//        alert(distance);
//        alert('商家到用户的距离是：'+distance+' 米。');  //获取两点距离,保留小数点后两位
//        var polyline = new BMap.Polyline([pointA,pointB], {strokeColor:"blue", strokeWeight:6, strokeOpacity:0.5});  //定义折线
//        map.addOverlay(polyline);     //添加折线到地图上
    return distance;
}




