package com.cat.rufull.test.business;

import com.cat.rufull.domain.mapper.product.ProductMapper;
import com.cat.rufull.domain.model.Product;
import com.cat.rufull.domain.service.product.ProductService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class ProductMapperTest {
    private static Logger logger = LoggerFactory.getLogger(ProductMapperTest.class);

    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private ProductService productService;
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
        logger.info(all.toString());
    }

    @Test
    public void  testFindById(){

        Product productById = productMapper.findProductById(3);
        logger.info(productById.toString());
    }

    @Test
    public void testUpdate(){
        Product product = new Product();

        product.setId(16);
        product.setPhoto("你妈妈.jpg");

        productService.updateByIdSelective(product);
    }

    @Test
    public void testDelete(){
        productMapper.deleteById(16);
    }

    @Test
    public  void  testFuzzyFindProductNameAndDesc(){
        List<Product> productList = productMapper.fuzzyFindByProductNameAndProductDesc("虾");
        System.out.println("productList:"+productList.size());
    }


}
