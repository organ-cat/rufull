package com.cat.rufull.test;

import com.cat.rufull.domain.mapper.account.AccountMapper;
import com.cat.rufull.domain.mapper.business.BusinessMapper;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Favor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:META-INF/spring/root-context.xml"})
public class BusinessMapperTest {
    private static Logger logger = LoggerFactory.getLogger(BusinessMapperTest.class);
    @Autowired
    private BusinessMapper businessMapper;

    @Autowired
    private AccountMapper accountMapper;
    //
    @Test
    public void testCRUD(){
        Business business = new Business();
        Account account = new Account();
        account.setId(3);
        business.setFrontPhoto("D商家正面照片.jpg");
        business.setInsidePhoto("D商家反面照片.jpg");
        business.setIdBackPhoto("D商家身份证反面.jpg");
        business.setIdFrontPhoto("D商家身份证正面.jpg");
        business.setIdentifier("46003319940911117");
        business.setBusinessLicence("D商家营业执照.jpg");
        business.setCateringServiceLicense("D商家餐厅营业服务.jpg");
        business.setAccount(account);
        businessMapper.add(business);
    }

    //测试查询全部
    @Test
    public void testFindAll(){
        List<Business> businessList = businessMapper.findAll();
        System.out.println("businessList:"+businessList);
    }

    //测试通过Id查询
    @Test
    public void testFindById(){
        Business business = businessMapper.findById(2);
        System.out.println("business:"+business);
    }


    //测试通过id更新
    @Test
    public void testUpdateById(){
        Business business = new Business();
        Account account = new Account();
        account.setId(3);
        business.setId(5);
        business.setFrontPhoto("E商家正面照片.jpg");
        business.setInsidePhoto("D商家反面照片.jpg");
        business.setIdBackPhoto("D商家身份证反面.jpg");
        business.setIdFrontPhoto("D商家身份证正面.jpg");
        business.setIdentifier("46003319940911117");
        business.setBusinessLicence("D商家营业执照.jpg");
        business.setCateringServiceLicense("D商家餐厅营业服务.jpg");
        business.setAccount(account);
        businessMapper.updateById(business);
    }

    @Test
    public void testUpdateByIdSelective(){
        Business business = new Business();
        business.setId(5);
        business.setIdFrontPhoto("商家身份证正面照");
        System.out.println(business.getAccount());
        businessMapper.updateByIdSelective(business);
    }
}
