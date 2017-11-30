package com.cat.rufull.test;

import com.cat.rufull.domain.mapper.favor.FavorMapper;
import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Favor;
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
public class FavorMapperTest {
    private static Logger logger = LoggerFactory.getLogger(FavorMapperTest.class);
    @Autowired
    private FavorMapper favorMapper;

    @Test//先查询完有没有再添加
    public void testAddFavor(){
        Favor favor = new Favor();
        favor.setAccountId(1);
        favor.setShopId(1);

        favorMapper.addFavor(favor);
    }


    @Test
    public void testFindFavorByAccountId(){
        List<Favor> favor = favorMapper.findShopByAccountId(1);
        System.out.println("favor:"+favor);
    }

    @Test
    public void deleteFavorByAccountIdAndShopId(){
        favorMapper.deleteShopByAccountIdAndShopId(3,2);
    }
}
