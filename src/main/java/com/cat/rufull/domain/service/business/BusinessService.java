package com.cat.rufull.domain.service.business;


import com.cat.rufull.domain.model.Business;
import com.cat.rufull.domain.model.Order;

import java.util.List;

public interface BusinessService {

    List<Business> findAll();                                       // 查询全部商家

    Business findById(Integer id);                                  // 通过Id查询商家

    int deleteById(Integer id);                                     // 通过Id删除商家

    int add(Business business);                                     // 添加商家

    int updateByIdSelective(Business business);                     // 通过Id选择不为空的字段更新商家

    int updateById(Business business);                              // 通过Id更新商家

    Business findBusinessByAccountId(Integer id);                   // 通过用户id查询对应的商家

    List<Business> findNotSettledBusiness();                        // 获取已经填写入驻信息的商家

    List<Order> findOrderListByStatus(String status,Integer shopId);               //查找对应状态下的商店

   }
