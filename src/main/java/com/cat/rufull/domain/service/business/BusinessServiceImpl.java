package com.cat.rufull.domain.service.business;

import com.cat.rufull.domain.mapper.business.BusinessMapper;
import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Order;
import com.cat.rufull.domain.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Transactional
@Service("businessService")
public class BusinessServiceImpl implements BusinessService{

    @Autowired
    private BusinessMapper businessMapper;

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    private OrderService orderService;
    @Override
    public List<Business> findAll() {
        /**
         *@Author:Caoxin
         *@Description:查询全部商家，返回一个List<Business>
         *@Date:23:58 2017/12/3
         *@param[]
         *@userAdministrator
         */
        return businessMapper.findAll();
    }
    

    @Override
    public Business findById(Integer id) {
        /**
         *@Author:Caoxin
         *@Description：通过Id查询商家
         *@Date:0:09 2017/12/4
         *@param:id:商家id
         *@return：Business
         */
        return businessMapper.findById(id);
    }


    @Override
    public int deleteById(Integer id) {
        /**
         *@Author:Caoxin
         *@Description:通过Id删除商家,该方法可能比较少用，如果需要将商家删除的话，改变用户的状态
         *@Date:0:10 2017/12/4
         *@param[id]:商家id
         *@return：int
         */
        return businessMapper.deleteById(id);
    }


    @Override
    public int add(Business business) {
        /**
         *@Author:Caoxin
         *@Description:添加商家:所有值都要填，除了id
         *@Date:0:12 2017/12/4
         *@param[business]
         *@return:int
         */
        businessMapper.add(business);
        return 0;
    }

    @Override
    public int updateByIdSelective(Business business) {
        /**
        *@Author:Caoxin
        *@Description:可以输入任何值和id去更新部分的字段，不需要全部写
        *@Date:0:15 2017/12/4
        *@param[business]
        *@return:int
        */
        return 0;
    }

    @Override
    public int updateById(Business business) {
        /**
        *@Author:Caoxin
        *@Description：商家所有的值都需要输入
        *@Date:0:16 2017/12/4
        *@param[business]
        *@return：int
        */
        businessMapper.updateById(business);
        return 0;
    }

    @Override
    public Business findBusinessByAccountId(Integer id) {
        /**
        *@Author:Caoxin
        *@Description：用过用户id查询商家
        *@Date:9:11 2017/12/7
        *@param[id]输入用户的id
        *@returncom.cat.rufull.domain.model.Business
        */
        return businessMapper.findBusinessByAccountId(id);
    }

    @Override
    public List<Business> findNotSettledBusiness() {
        /**
        *@Author:Caoxin
        *@Description:查询出所有填写了入驻信息的商家，但是没有通过管理员验证
        *@Date:8:57 2017/12/11
        *@param[]
        *@returnjava.util.List<com.cat.rufull.domain.model.Business>
        */
        List<Business> allBusiness = findAll();
        List<Business> businessList = new ArrayList<Business>();
        for (Business business : allBusiness) {
            if (business.getAccount().getStatus().equals(Business.BUSINESS_STATUS_SETTLED)){
                businessList.add(business);
            }
        }
        return businessList;
    }

    @Override
    public List<Order> findOrderListByStatus(String status,Integer shopId) {
        List<Order> orderList = new ArrayList<Order>();
        if(status.equals("ACCEPTED")){
            orderList =  orderService.findShopAcceptedOrders(shopId);
        }else if (status.equals("AUDITING")){
            orderList =  orderService.findShopRefundOrders(shopId);
        }else {
            orderList = orderService.findShopCompletedOrders(shopId);
        }

       return orderList;
    }
}
