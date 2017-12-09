package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Complaint;

import java.util.List;

public interface ComplaintMapper {
    /**
     * 用户添加投诉
     * @param complaint
     */
    void addComplaint(Complaint complaint);

    /**
     * 根据id查询投诉信息
     * @param id
     * @return
     */
    Complaint findComplaintById(int id);

    /**
     * 根据用户id查询投诉的集合
     * @param account_id
     * @return
     */
    List<Complaint> findAccountComplaintListById(int account_id);

    /**
     * 根据商店id查询投诉的集合
     * @param shop_id
     * @return
     */
    List<Complaint> findShopComplaintListById(int shop_id);
}
