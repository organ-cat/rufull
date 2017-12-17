package com.cat.rufull.test.evaluation;

import com.cat.rufull.domain.mapper.evaluation.EvaluationMapper;

import com.cat.rufull.domain.model.LineItem;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.model.ProductEvaluation;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.mail.FetchProfile;
import java.math.BigDecimal;
import java.util.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class EvalMapperTest {
    private static Logger logger = LoggerFactory.getLogger(EvalMapperTest.class);

    @Autowired
    private EvaluationMapper evaluationMapper;


    @Test
    public void testFindEvalByShopId() throws Exception{
        List<OrderEvaluation> orderEvaluation = evaluationMapper.findEvalByShopId(1);
       System.out.println(orderEvaluation);
    }

    @Test
    public void testFindEvalByShopId_Y() throws Exception{
        List<OrderEvaluation> orderEvaluation = evaluationMapper.findEvalByShopId_Y(1);
        System.out.println(orderEvaluation);
    }

    @Test
    public void testFindEvalByShopId_N() throws Exception{
        List<OrderEvaluation> orderEvaluation = evaluationMapper.findEvalByShopId_N(1);
        System.out.println(orderEvaluation);
    }

    @Test
    public void testAddOrderEval() throws Exception{
        OrderEvaluation orderEvaluation = new OrderEvaluation();
        Order order = new Order();
        order.setId(4);

        //初始化订单评价
        orderEvaluation.setScore(3);
        orderEvaluation.setComment("很满足");
        orderEvaluation.setReply("已送餐");
        orderEvaluation.setEvalTime(new Date());
        orderEvaluation.setOrder(order);
        orderEvaluation.setShopId(3);

        evaluationMapper.addOrderEval(orderEvaluation);
        System.out.println(orderEvaluation.getId());

        //初始化商品评价
        ProductEvaluation productEvaluation1 = new ProductEvaluation();
        ProductEvaluation productEvaluation2 = new ProductEvaluation();

        LineItem lineItem1 = new LineItem();
        LineItem lineItem2 = new LineItem();
        lineItem1.setId(7);
        lineItem2.setId(8);

        productEvaluation1.setScore(3);
        productEvaluation1.setComment("很纳闷");
        productEvaluation1.setEvalTime(new Date());
        productEvaluation1.setItem(lineItem1);
        productEvaluation1.setOrderEvalId(orderEvaluation.getId());

        productEvaluation2.setScore(5);
        productEvaluation2.setComment("很纳闷");
        productEvaluation2.setEvalTime(new Date());
        productEvaluation2.setItem(lineItem2);
        productEvaluation2.setOrderEvalId(orderEvaluation.getId());

        List<ProductEvaluation> lists = new ArrayList<ProductEvaluation>();
        lists.add(productEvaluation1);
        lists.add(productEvaluation2);

        //插入商品评价
        evaluationMapper.addProductEval(lists);
        System.out.println(lists);
    }


}
