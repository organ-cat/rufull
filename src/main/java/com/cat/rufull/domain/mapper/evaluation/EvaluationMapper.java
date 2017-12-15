package com.cat.rufull.domain.mapper.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.model.ProductEvaluation;

import java.util.List;

public interface EvaluationMapper {
    //插入订单评价
    public void addOrderEval(OrderEvaluation orderEvaluation)throws Exception;

    //根据订单评价id插入商品评价评价
    public void addProductEval(List<ProductEvaluation> productEvaluation)throws Exception;

    //根据商店id查询评价
    public List<OrderEvaluation> findEvalByShopId(Integer id)throws Exception;
}
