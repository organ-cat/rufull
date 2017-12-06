package com.cat.rufull.domain.service.product;

import com.cat.rufull.domain.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();                            // 查询全部商品

    List<Product> findProductByShopId(Integer id);      // 通过商店Id查询商品

    Product findProductById(Integer id);                 //通过id查询商品

    int deleteById(Integer id);                         // 通过Id删除商品

    int add(Product product);                           // 添加商品

    int updateByIdSelective(Product product);           // 通过Id选择不为空的字段更新商品

    int updateById(Product product);                    // 通过Id更新商品
}