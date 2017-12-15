package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationService {

    //添加评价
    public void addEvaluation(OrderEvaluation orderEvaluation) throws Exception;

    //根据商店id查询评价
    public List<OrderEvaluation> findEvalByShopId(Integer id) throws Exception;

}
