package com.cat.rufull.test;

import com.cat.rufull.domain.mapper.order.OrderMapper;
import com.cat.rufull.domain.mapper.product.ProductMapper;
import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.model.Shop;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

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

    @Autowired
    private ProductMapper productMapper;
    //    商店测试
    @Test
    public void testaddProduct(){

        Product product = new Product();
        product.setProductName("AA");
        product.setPhoto("Aa.jpg");
        product.setDescription("AA");
        product.setPrice(new BigDecimal(3.2));
        product.setSalesVolume(100);
        product.setStatus(1);
        product.setShopId(3);

        productMapper.add(product);

    }

    @Test
    public void testFindAll(){
        List<Product> all = productMapper.findAll();
    }

    @Test
    public void  testFindById(){
//        Shop shop = shopMapper.findById(2);
//       if(shop.getProductList() != null){
//           logger.info(shop.getProductList().toString());
//       }else {
//           logger.info("productList为空。。。。");
//       }
    }

    @Test
    public void testUpdate(){
//        Shop shop = new Shop();
//        shop.setShopName("曹欣");
//        shop.setId(4);
//        shopMapper.updateByIdSelective(shop);
    }

    @Test
    public void testDelete(){
//        shopMapper.deleteById(4);
    }
}
