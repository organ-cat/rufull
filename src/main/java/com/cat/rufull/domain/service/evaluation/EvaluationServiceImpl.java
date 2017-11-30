package com.cat.rufull.domain.service.evaluation;

import com.cat.rufull.domain.mapper.evaluation.EvaluationMapper;
import com.cat.rufull.domain.model.OrderEvaluation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("evaluationService")
@Transactional
public class EvaluationServiceImpl implements EvaluationService {

    @Autowired
    private EvaluationMapper orderEvaluatiomMapper;

    @Override
    public List<OrderEvaluation> findOrderEvaluation(Integer id) throws Exception {
        return orderEvaluatiomMapper.selectOrderEvaluationByBusinessId(id);
    }
}
