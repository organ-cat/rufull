package com.cat.rufull.test;

import com.cat.rufull.domain.mapper.order.OrderMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class TestEverything {
    private static Logger logger = LoggerFactory.getLogger(TestEverything.class);
    //  private ApplicationContext ac = null;
    @Autowired
    private MailSender mailSender;
    @Autowired
    private SimpleMailMessage mailMessage;
    @Autowired
    private OrderMapper orderMapper;

//  @Before
//  public void before() {
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//      userService = (IUserService) ac.getBean("userService");
//  }

    @Test
    public void testMybatis() {
        orderMapper.findOrderByAccountId(1);
    }

    @Test
    public void testSendEmail() {
        mailMessage.setTo("916524724@qq.com");
        mailMessage.setSubject("注册");
        mailMessage.setText("请点击XXX");
        mailSender.send(mailMessage);
    }
}
