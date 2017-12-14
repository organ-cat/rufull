package com.cat.rufull.domain.mapper.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationMapper {
    public List<OrderEvaluation> selectOrderEvaluationByBusinessId(Integer id) throws Exception;

    //插入订单评价
    public void addOrderEvaluation(OrderEvaluation orderEvaluation)throws Exception;

    //根据商店id查询评价
    public List<OrderEvaluation> findEvalByShopId(Integer id)throws Exception;
}
