package com.cat.rufull.domain.mapper.complaint;

import com.cat.rufull.domain.model.Complaint;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
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
    List<Complaint> findAccountComplaintListById(@Param("account_id")int account_id);

    /**
     * 根据商店id查询投诉的集合
     * @param shop_id
     * @return
     */
    List<Complaint> findShopComplaintListById(int shop_id);

    /**
     * 查询所有的投诉集合
     * @return
     */
    List<Complaint> findAllComplaint();

    /**
     *
     * @param complaint
     * @return
     */
    int completedComplaint(Complaint complaint);

    int handlerComplaint(@Param("id") int id, @Param("status") int status);

    List<Complaint> completedComplaintList();

    List<Complaint> findComplaintByTime(@Param("creatTime")Date creatTime,
                                        @Param("completedTime") Date completedTime,
                                        @Param("content") String content);
}
