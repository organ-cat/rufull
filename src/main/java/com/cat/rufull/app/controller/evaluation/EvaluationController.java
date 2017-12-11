package com.cat.rufull.app.controller.evaluation;

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

    @RequestMapping("openEvaluation")
    public String openEvaluation(){
        return "evaluation/evaluation";
    }

    @RequestMapping("/findOrderEvaluation")
    public String findOrderEvaluation(Integer id, Model model) throws Exception {
        List<OrderEvaluation> orderEvaluation = evaluationService.findOrderEvaluation(id);
        model.addAttribute("orderEvaluation", orderEvaluation);
        return "evaluation/evaluation";
    }

    @RequestMapping("addOrderEvaluation")
    public String addOrderEvaluation(OrderEvaluation orderEvaluation) throws Exception{
        evaluationService.addOrderEvaluation(orderEvaluation);
        return "";
    }
}
