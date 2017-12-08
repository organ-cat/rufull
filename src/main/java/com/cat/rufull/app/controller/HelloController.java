package com.cat.rufull.app.controller;

import com.cat.rufull.domain.service.shop.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {
    private static Logger logger = LoggerFactory.getLogger(HelloController.class);
    private MessageSource messageSource;

    @Autowired
    private ShopService shopService;
    @RequestMapping(method = RequestMethod.GET)
    public String index() {
        logger.info(messageSource.getMessage("name", new Object[]{}, null));
        return "hello";
    }
    @Autowired
    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }


}
