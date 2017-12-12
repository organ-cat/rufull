package com.cat.rufull.domain.service.shop;

import com.cat.rufull.domain.model.Shop;

import java.util.List;

public interface ShopService {
    List<Shop> findAll();                            // 查询全部商店

    Shop findById(Integer id);                       // 通过Id查询商店

    Shop findShopByBusinessId(Integer id);           //通过business查询商家id

    int deleteById(Integer id);                     // 通过Id删除商店

    int add(Shop shop);                             // 添加商店

    int updateByIdSelective(Shop shop);             // 通过Id选择不为空的字段更新商家

    int updateById(Shop shop);                       // 通过Id更新商家

    List<Shop> fuzzyFindByShopName(String shopName);   // 通过商店名字模糊查询查找对应的商店


}
