package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationService {

    //添加评价
    public void addEvaluation(OrderEvaluation orderEvaluation) throws Exception;

    //根据商店id查询全部评价
    public List<OrderEvaluation> findEvalByShopId(Integer id) throws Exception;

    //根据商店id查询满意的评价
    public List<OrderEvaluation> findEvalByShopId_Y(Integer id) throws Exception;

    //根据商店id查询不满意的评价
    public List<OrderEvaluation> findEvalByShopId_N(Integer id) throws Exception;

}
