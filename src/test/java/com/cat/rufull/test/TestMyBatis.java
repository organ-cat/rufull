package com.cat.rufull.test;

import com.cat.rufull.domain.model.User;
import com.cat.rufull.domain.service.user.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class TestMyBatis {
    private static Logger logger = LoggerFactory.getLogger(TestMyBatis.class);
    //  private ApplicationContext ac = null;
    @Autowired
    private IUserService userService;

//  @Before
//  public void before() {
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//      userService = (IUserService) ac.getBean("userService");
//  }

    @Test
    public void test1() {
        User user = userService.findById(1);
        // System.out.println(user.getUserName());
        // logger.info("值："+user.getUserName());
        logger.info(user.toString());
    }
}
