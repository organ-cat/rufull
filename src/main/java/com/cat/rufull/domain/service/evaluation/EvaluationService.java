package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationService {

    //添加评价
    public void addEvaluation(OrderEvaluation orderEvaluation);

    //根据商店id查询全部评价
    public List<OrderEvaluation> findEvalByShopId(Integer id);

    //根据商店id查询满意的评价
    public List<OrderEvaluation> findEvalByShopId_Y(Integer id);

    //根据商店id查询不满意的评价
    public List<OrderEvaluation> findEvalByShopId_N(Integer id);

    //根据商店id查询评价平均分
    public Double findAvarageByShopId(Integer shopId);

    //根据商品id查询评价平均分
    public Double findAvarageByProductId(Integer productId);
}
