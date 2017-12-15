package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;

import java.util.List;

public interface EvaluationService {
    public List<OrderEvaluation> findOrderEvaluation(Integer id) throws Exception;

    public void addOrderEvaluation(OrderEvaluation orderEvaluation) throws Exception;
}
