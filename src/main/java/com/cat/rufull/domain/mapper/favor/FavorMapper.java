package com.cat.rufull.domain.mapper.favor;

import com.cat.rufull.domain.model.Favor;
import com.cat.rufull.domain.model.Shop;

import java.util.List;

public interface FavorMapper {

    // 通过Id查询用户喜爱的商店
    List<Favor> findShopByAccountId(Integer id);

    // 通过用户Id删除喜爱的商店
    int deleteShopByAccountIdAndShopId(Integer account_id,Integer shop_id);

    // 添加用户喜爱的商店 fdsad
    int addFavor(Favor favor);


}
