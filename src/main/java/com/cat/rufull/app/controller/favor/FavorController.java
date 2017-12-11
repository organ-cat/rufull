package com.cat.rufull.app.controller.favor;

import com.cat.rufull.domain.model.Favor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("favor")
public class FavorController {
    @ResponseBody
    @RequestMapping("addFavorShop")
    public String addFavorShop(Favor favor){

        return "添加收藏成功";
    }
}
