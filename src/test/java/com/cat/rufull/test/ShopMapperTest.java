package com.cat.rufull.test;

import com.cat.rufull.domain.mapper.product.ProductMapper;
import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.model.Shop;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class ShopMapperTest {
    private static Logger logger = LoggerFactory.getLogger(ShopMapperTest.class);



    @Autowired
    private ShopMapper shopMapper;
    //    商店测试
    @Test
    public void testaddShop(){
        Shop shop = new Shop();
        shop.setShopName("测试商店");
        shop.setShopType(1);
        shop.setShopPhoto("测试商店.jpg");
        shop.setShopPhone("18934218413");
        shop.setAddress("广东海洋大学海浪A616");
        shop.setOperateTime("7:30-12:30,13:30-23:30");
        shop.setOperateState(1);
        shop.setLat("500.00");
        shop.setLon("530.00");
        shop.setSupportPayment(3);
        shop.setShippingDistance(8);
        shop.setShippingPrice(new BigDecimal("8"));
        shop.setShippingFee(new BigDecimal("8.30"));
        shop.setAnnouncement("开业啦！！！！");

        Business business = new Business();
        business.setId(1);


    }

    public void  testFindById(){
//        Shop shop = shopMapper.findById(2);
//       if(shop.getProductList() != null){
//           logger.info(shop.getProductList().toString());
//       }else {
//           logger.info("productList为空。。。。");
//       }
    }

    @Test
    public void testUpdate(){
//        Shop shop = new Shop();
//        shop.setShopName("曹欣");
//        shop.setId(4);
//        shopMapper.updateByIdSelective(shop);
    }

    @Test
    public void testDelete(){
//        shopMapper.deleteById(4);
    }
}
