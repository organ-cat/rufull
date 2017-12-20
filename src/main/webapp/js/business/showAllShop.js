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


//计算用户到商家距离
function compto(userLat,userLon,shopLon,shopLat){
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


//维护一个变量记录商家的id，用于查询是缩小商家搜索的范围
var shopArray = [];
//添加用户查看到的商家，这段js添加不进js文件。
$(function(){
    for(var i = 0; i < shopList.length; i++){
        var account2ShopDistance = compto(uLat,uLon,shopList[i].lat,shopList[i].lon);
        //在测试中先把判断用户到商家的距离去掉  shippingDistanced单位是公里所以要 * 1000;
            if(account2ShopDistance < (shopList[i].shippingDistance * 1000)){
        //把商家添加到商家
        $("#shopListDiv").append(function () {
                if(shopList[i].operateState == 0){
                    return  "<a href='"+contextPath+"/shop/showShopDetail?id="+shopList[i].id+"'"+
                        "target='blank' class='rstblock'>" +
                        "<div class='rstblock-logo'>" +
                        "<img " +"src='"+contextPath+"/upload/shop/"+shopList[i].shopPhoto+"'"+
                        "width='70' height='70' alt='"+shopList[i].shopName+"'class='rstblock-logo-icon'/>"+
                        "<span class='rstblock-left-timeout'>"+shopList[i].shippingTime+ "分钟</span>"+
                        "</div>"+

                        "<div class='rstblock-content'>"+
                        "<div class='rstblock-title'>"+shopList[i].shopName+"</div>"+
                        "<div class='rating-star r"+shopEvaluation[0][shopList[i].id]*2+"'></div>"+
                        "<span class='rstblock-monthsales'>月售"+shopSales[0][shopList[i].id]+"单</span>"+

                        "<div class='rstblock-cost'>"+
                        "￥ "+shopList[i].shippingFee+
                        "</div>"+
                        "<div class='rstblock-activity'></div>"+
                        "</div>"+
                        "</a>";
                }else if(shopList[i].operateState == 1){
                    return  "<a href='"+contextPath+"/shop/showShopDetail?id="+shopList[i].id+"'"+
                        "target='blank' class='rstblock'>" +
                        "<div class='rstblock-logo'>" +
                        "<img " +"src='"+contextPath+"/upload/shop/"+shopList[i].shopPhoto+"'"+
                        "width='70' height='70' alt='"+shopList[i].shopName+"'class='rstblock-logo-icon'/>"+
                        "<span class='rstblock-left-timeout'>"+shopList[i].shippingTime+ "分钟</span>"+
                        "</div>"+

                        "<div class='rstblock-content'>"+
                        "<div class='rstblock-title'>"+shopList[i].shopName+"</div>"+
                        "<div class='rating-star r"+shopEvaluation[0][shopList[i].id]*2+"'></div>"+
                        "<span class='rstblock-monthsales'>月售"+shopSales[0][shopList[i].id]+"单</span>"+

                        "<div class='rstblock-cost'>"+
                        "￥ "+shopList[i].shippingFee+
                        "</div>"+
                        "<div class='rstblock-relaxing'>商家休息,暂不接单</div>"+
                        "</div>"+
                        "</a>";
                }
            }
           );
        shopArray.push(shopList[i]);
    }
        }
});

// 查询不同类型的美食：通过前端输入的不同商家类型来查找对应不同的商家
//在第一次已经赛选出来的情况下已经得到一个shop类型的数组：shopArray

function getDifferentTypeShop(type,tab) {
    // 添加点击后底色
    $("#shopType a").removeClass("focus");
    $(tab).addClass("focus");

    /*    商家类型：

        美食、异国料理、特色菜 ：0
        甜品、饮品、小吃：1
        午餐、晚餐：早餐、下午茶、夜宵：2
        快餐、便当：3
        果蔬生鲜：4
        超市商店：5
        鲜花绿植：6
        医药健康：7
        全部    : 8
    */
    console.log(type);
    if(type == 8){
        addShopList(shopArray);
    }else {
        var sameShopTypeList = [];
        for(var i = 0; i < shopArray.length; i++){
            if (type == shopArray[i].shopType){
                sameShopTypeList.push(shopArray[i]);
            }
        }
        console.log(sameShopTypeList);
        addShopList(sameShopTypeList);
    }


}

//添加对应的元素
function addShopList(typeShopList) {
    //先删除所有元素
    $("#shopListDiv").empty();
    //再添加所需要的元素
    for(var i = 0; i < typeShopList.length; i++){
        $("#shopListDiv").append(function () {
            if(typeShopList[i].operateState == 0){
                return  "<a href='"+contextPath+"/shop/showShopDetail?id="+typeShopList[i].id+"'"+
                    "target='blank' class='rstblock'>" +
                    "<div class='rstblock-logo'>" +
                    "<img " +"src='"+contextPath+"/upload/shop/"+typeShopList[i].shopPhoto+"'"+
                    "width='70' height='70' alt='"+typeShopList[i].shopName+"'class='rstblock-logo-icon'/>"+
                    "<span class='rstblock-left-timeout'>"+typeShopList[i].shippingTime+ "分钟</span>"+
                    "</div>"+

                    "<div class='rstblock-content'>"+
                    "<div class='rstblock-title'>"+typeShopList[i].shopName+"</div>"+
                    "<div class='rating-star r"+shopEvaluation[0][typeShopList[i].id]*2+"'></div>"+
                    "<span class='rstblock-monthsales'>月售"+shopSales[0][typeShopList[i].id]+"单</span>"+

                    "<div class='rstblock-cost'>"+
                    "￥ "+typeShopList[i].shippingFee+
                    "</div>"+
                    "<div class='rstblock-activity'></div>"+
                    "</div>"+
                    "</a>";
            }else if(typeShopList[i].operateState == 1){
                return  "<a href='"+contextPath+"/shop/showShopDetail?id="+typeShopList[i].id+"'"+
                    "target='blank' class='rstblock'>" +
                    "<div class='rstblock-logo'>" +
                    "<img " +"src='"+contextPath+"/upload/shop/"+typeShopList[i].shopPhoto+"'"+
                    "width='70' height='70' alt='"+typeShopList[i].shopName+"'class='rstblock-logo-icon'/>"+
                    "<span class='rstblock-left-timeout'>"+typeShopList[i].shippingTime+ "分钟</span>"+
                    "</div>"+

                    "<div class='rstblock-content'>"+
                    "<div class='rstblock-title'>"+typeShopList[i].shopName+"</div>"+
                    "<div class='rating-star r"+shopEvaluation[0][typeShopList[i].id]*2+"'></div>"+
                    "<span class='rstblock-monthsales'>月售"+shopSales[0][typeShopList[i].id]+"单</span>"+

                    "<div class='rstblock-cost'>"+
                    "￥ "+typeShopList[i].shippingFee+
                    "</div>"+
                    "<div class='rstblock-relaxing'>商家休息,暂不接单</div>"+
                    "</div>"+
                    "</a>";
            }
        });

    }
}

//通过查询对应的美食和商店查询出全部的商店
function searchShopAndFood() {
    // $("#searchShopAndFoodImg").click(function () {

        var searchContext = $("#globalsearch").val();

        var url = "/rufull/shop/findFuzzySearchShop?searchContext="+searchContext;
        console.log(searchContext);
        var sendData = null;
        $.get(url,sendData,function(backData,textStaut,ajax){
            var jsonShopList = ajax.responseText;

            var searchShopList = eval('('+jsonShopList+')');

            addShopList(searchShopList);

            shopArray = searchShopList;
        });
    // });

}




