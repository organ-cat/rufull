package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.mapper.evaluation.EvaluationMapper;
import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.model.ProductEvaluation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;


@Service("evaluationService")
@Transactional
public class EvaluationServiceImpl implements EvaluationService {

    @Autowired
    private EvaluationMapper evaluationMapper;

    //添加评价
    @Override
    public void addEvaluation(OrderEvaluation orderEvaluation) throws Exception {
        //添加订单评价
        orderEvaluation.setEvalTime(new Date());  //设置评价时间
        evaluationMapper.addOrderEval(orderEvaluation);

        //添加商品评价
        List<ProductEvaluation> lists = orderEvaluation.getProductEvaluations();
        for(ProductEvaluation pro : lists){
            pro.setEvalTime(orderEvaluation.getEvalTime());//设置评价时间
            pro.setOrderEvalId(orderEvaluation.getId());  //设置订单评价id
        }
        evaluationMapper.addProductEval(lists);
    }

    //根据商店id查询评价
    @Override
    public List<OrderEvaluation> findEvalByShopId(Integer id) throws Exception {
        return evaluationMapper.findEvalByShopId(id);
    }

}
