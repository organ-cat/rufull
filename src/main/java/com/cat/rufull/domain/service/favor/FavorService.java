package com.cat.rufull.domain.service.favor;

import com.cat.rufull.domain.model.Favor;

import java.util.List;

public interface FavorService {
    // 通过Id查询用户喜爱的商店
    List<Favor> findShopByAccountId(Integer id);

//    // 通过用户Id删除喜爱的商店
    int deleteShopByAccountIdAndShopId(Integer account_id,Integer shop_id);

    // 添加用户喜爱的商店
    int addFavor(Favor favor);

    //通过收藏id收藏对应的用户
    int deleteByFavorId(Integer id);
}
