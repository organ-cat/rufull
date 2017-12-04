var map = new BMap.Map("container");        //在container容器中创建一个地图,参数container为div的id属性;
var point = new BMap.Point(120.2,30.25);    //创建点坐标

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
////////////////
///////////////////////////////////////////////////////////////////////////////////
var $citypicker = $('#city');
$citypicker.citypicker();

var lng = "";
var lat = "";
var province = "";
var city = "";
var region = "";




$(function () {
    // 商店时间组件的初始化
    var picker1 = $('#morningshippingTimeStart').datetimepicker({
        format: 'HH:ss',
        locale: moment.locale('zh-cn')
    });
    var picker2 = $('#morningshippingTimeEnd').datetimepicker({
        format: 'HH:ss',
        locale: moment.locale('zh-cn')
    });
    var picker3 = $('#noonshippingTimeStart').datetimepicker({
        format: 'HH:ss',
        locale: moment.locale('zh-cn'),
        //minDate: '2016-7-1'
    });
    var picker4 = $('#noonshippingTimeEnd').datetimepicker({
        format: 'HH:ss',
        locale: moment.locale('zh-cn')
    });
    // 商店四个时间的控制
    //动态设置最小值
    //动态设置最大值
    picker2.on('dp.change', function (e) {
        picker1.data('DateTimePicker').maxDate(e.date);
    });

    picker4.on('dp.change', function (e) {
        picker3.data('DateTimePicker').maxDate(e.date);
    });

});
///////////////////////////////////////////////////////////////////////////////
//onchange事件，直接自动获取位置坐标
    function searchByStationName() {
        var name="";
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport(); //允许自动调节窗体大小
        map.clearOverlays();//清空原来的标注
        var keyword = document.getElementById("address").value;
        localSearch.setSearchCompleteCallback(function (searchResult) {


            var poi = searchResult.getPoi(0);
            //弹出坐标信息
            alert(name+keyword+poi.point.lng + "," + poi.point.lat);
            $("#lat").val(poi.point.lat);
            $("#lon").val(poi.point.lng);
            $("#detailAddress").val(keyword);
            map.centerAndZoom(poi.point, 15);
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);
            var content = document.getElementById("address").value + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
            var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p >");
            marker.addEventListener("click", function () { this.openInfoWindow(infoWindow);
                lng = poi.point.lng;
                lat = poi.point.lat;
            });
        });
        localSearch.search(keyword);
    }

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
// 百度地图API功能，自动获取下拉框的地址信息提示
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
        value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    }
    str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
    G("searchResultPanel").innerHTML = str;
});

var myValue;
ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
    var _value = e.item.value;
    myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
    G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;

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
    local.search(myValue);
}






