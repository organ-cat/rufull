package com.cat.rufull.test.evaluation;

import com.cat.rufull.domain.mapper.evaluation.EvaluationMapper;
import com.cat.rufull.domain.mapper.lineItem.LineItemMapper;
import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.model.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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


}
