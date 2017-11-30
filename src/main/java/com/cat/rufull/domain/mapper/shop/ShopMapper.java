package com.cat.rufull.domain.mapper.shop;

import com.cat.rufull.domain.model.Shop;

import java.util.List;

public interface ShopMapper {
    List<Shop> findAll();                            // 查询全部商店

    Shop findById(Integer id);                       // 通过Id查询商店

    int deleteById(Integer id);                     // 通过Id删除商店

    int add(Shop shop);                             // 添加商店

    int updateByIdSelective(Shop shop);             // 通过Id选择不为空的字段更新商家

    int updateById(Shop shop);                       // 通过Id更新商家
}
