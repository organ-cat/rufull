package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Complaint;

import java.util.List;

public interface ComplaintService {
    void addComplaint(Complaint complaint);

    Complaint findComplaintById(int id);

    List<Complaint> findAccountComplaintListById(int account_id);

    List<Complaint> findShopComplaintListById(int shop_id);

    List<Complaint> findAllComplaint();

    int completedComplaint(Complaint complaint);

    int handlerComplaint(int id, int status);
}
