package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationService {
    public List<OrderEvaluation> findOrderEvaluation(Integer id) throws Exception;

    List<OrderEvaluation> findByShopName(String shopname);
}
