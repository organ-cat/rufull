//商品信息排序
/*
    1.默认排序
    2.按照价格排序
    3.按照评分排序
 */


$(function () {
    addProduct(productList);
});

// //获取对应商店的所有product
// function getProductList() {
//         var url = "/rufull/shop/findProductListById?shopId="+shopId
//         var sendData = null;
//         $.get(url,sendData,function(backData,textStatus,ajax){
//             var jsonProductList = ajax.responseText;
//             productList = eval('('+jsonProductList+')');
//
//         });
//
// }
//为不同查询类型的商品排序
function sortProduct(tab_a) {
    var id = $(tab_a).attr("id");
    var suitableProductList;
    if(id == 'defaultSort'){
        console.log("1");
       suitableProductList = productList;

    }else if(id == 'pricesSort'){
        console.log("2");
        suitableProductList =   productList.sort(function (a,b) {
            return b.price - a.price;
        })
    }else {
        console.log("3");
        suitableProductList =   productList.sort(function (a,b) {
            return b.salesVolume - a.salesVolume;
        })
    }

    addProduct(suitableProductList);
}

function addProduct(commonProductList) {
    var productSelect = $("#productSelect");
    productSelect.empty();
    // 将对应的元素添加上select中

    for (var i = 0; i <commonProductList.length; i++){
        if (commonProductList[i].status == 0){
            productSelect.append("<div class=\"rst-block rst-rating-block\">\n" +
                "                            <div class=\"product_img\">\n" +
                "                                <a href=\"/zb-eamonn\" itemprop=\"url\">\n" +
                "                                    <img class=\"rst-img\"\n" +
                "                                         src=\""+contextPath+"/upload/product/"+commonProductList[i].photo
                +"\"\n" +
                "                                         alt=\"\""+commonProductList[i].productName+"\"\n" +
                "                                    />\n" +
                "                                </a>\n" +
                "                            </div>\n" +
                "                            <div class=\"product_name\">\n" +
                "                                <h4><b>"+commonProductList[i].productName+"</b></h4>\n" +
                "                                <p class=\"produce_name_comments\">\n" +
                "                                    <span class=\"produce_name_font\">评分："+productEvaluationMap[0][commonProductList[i].id]+"</span>\n" +
                "                                    <div class='rating-star r"+productEvaluationMap[0][commonProductList[i].id]*2+"'></div>\n" +
                "                                    <span>月售："+commonProductList[i].salesVolume+"</span>\n" +
                "                                </p>\n" +
                "                            </div>\n" +
                "                            <div class=\"product_price\">\n" +
                "                                <span class=\"product_price_symbol\">¥</span>\n" +
                "                                <span class=\"product_price_digital\">"+commonProductList[i].price+"</span>\n" +
                "                            </div>\n" +
                "                            <div class=\"product_cart\">\n" +
                "                                <a href=\""+contextPath+"/cart/add/"+shopId+"/"+commonProductList[i].id+"?shopName="+shopName+"\">\n" +
                "                                    <button class=\"product_cart_button\">加入购物车</button>\n" +
                "                                </a>\n" +
                "                            </div>\n" +
                "                        </div>");
        }

    }
}

