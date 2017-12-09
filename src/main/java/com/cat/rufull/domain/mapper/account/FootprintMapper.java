package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Footprint;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FootprintMapper {
    /**
     * 添加足迹
     * @param footprint Footprint对象
     */
    void addFootprint(Footprint footprint);

    /**
     * 删除足迹
     * @param accountId 用户的id
     * @param shopId    商店的id
     */
    void deleteFootprint(@Param("accountId") int accountId, @Param("shopId") int shopId);

    /**
     * 根据用户的id查询足迹的集合
     * @param account_id    用户的id
     * @return               足迹的集合
     */
    List<Footprint> findFootprintList(int account_id);

    /**
     * 根据id删除足迹
     * @param id
     */
    void deleteFootprintById(Integer id);
}
