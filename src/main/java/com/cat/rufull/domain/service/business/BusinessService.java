package com.cat.rufull.domain.service.business;


import com.cat.rufull.domain.model.Business;

import java.util.List;

public interface BusinessService {

    List<Business> findAll();                        // 查询全部商家

    Business findById(Integer id);                  // 通过Id查询商家

    int deleteById(Integer id);                     // 通过Id删除商家

    int add(Business business);                     // 添加商家

    int updateByIdSelective(Business business);     // 通过Id选择不为空的字段更新商家

    int updateById(Business business);              // 通过Id更新商家
}
