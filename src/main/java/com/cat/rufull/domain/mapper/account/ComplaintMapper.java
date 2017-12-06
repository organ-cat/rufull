package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Complaint;

import java.util.List;

public interface ComplaintMapper {

    void addComplaint(Complaint complaint);

    Complaint findComplaintById(int id);

    List<Complaint> findAccountComplaintListById(int account_id);

    List<Complaint> findShopComplaintListById(int shop_id);
}
