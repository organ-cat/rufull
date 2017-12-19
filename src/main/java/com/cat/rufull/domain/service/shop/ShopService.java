package com.cat.rufull.domain.service.shop;

import com.cat.rufull.domain.model.Shop;

import java.util.List;
import java.util.Map;

public interface ShopService {
    List<Shop> findAll();                            // 查询正常营业的商店

    List<Shop> findAllShop();                        //查询所有商店

    Shop findById(Integer id);                       // 通过Id查询商店

    Shop findShopByBusinessId(Integer id);           //通过business查询商家id

    int deleteById(Integer id);                     // 通过Id删除商店

    int add(Shop shop);                             // 添加商店

    int updateByIdSelective(Shop shop);             // 通过Id选择不为空的字段更新商家

    int updateById(Shop shop);                       // 通过Id更新商家

    List<Shop> fuzzyFindByShopName(String shopName);   // 通过商店名字模糊查询查找对应的商店

    List<Shop> fuzzyFindByShopAndProduct(String searchContext); // 通过搜索内容模糊查询对应的商家

    Map<Integer,Integer> getShopEvaluation(List<Shop> shopList) ; //查找所有商店中的评分

    Map<Integer,Integer> getShopSales(List<Shop> shopList);       //查询所有商店销售量

    Map<Integer,Integer> getShopProductEvaluation(Shop shop);       //查询商店的商品评价



}
