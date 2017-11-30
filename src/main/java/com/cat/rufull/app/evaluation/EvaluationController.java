package com.cat.rufull.app.evaluation;

import com.cat.rufull.domain.model.OrderEvaluation;
import com.cat.rufull.domain.service.evaluation.EvaluationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/evaluation")
public class EvaluationController {
    @Resource
    private EvaluationService evaluationService;

    @RequestMapping("/findOrderEvaluation")
    public String findOrderEvaluation(Integer id, Model model) throws Exception {
        List<OrderEvaluation> orderEvaluation = evaluationService.findOrderEvaluation(id);
        model.addAttribute("orderEvaluation", orderEvaluation);
        return "evaluation/evaluation";
    }
}
