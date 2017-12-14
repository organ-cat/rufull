package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.ComplaintMapper;
import com.cat.rufull.domain.model.Complaint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("complaintService")
@Transactional
public class ComplaintServiceImpl implements ComplaintService {
    @Autowired
    private ComplaintMapper complaintMapper;

    @Override
    public void addComplaint(Complaint complaint) {
        complaintMapper.addComplaint(complaint);
    }

    @Override
    public Complaint findComplaintById(int id) {
        return complaintMapper.findComplaintById(id);
    }

    @Override
    public List<Complaint> findAccountComplaintListById(int account_id) {
        return complaintMapper.findAccountComplaintListById(account_id);
    }

    @Override
    public List<Complaint> findShopComplaintListById(int shop_id) {
        return complaintMapper.findShopComplaintListById(shop_id);
    }

    @Override
    public List<Complaint> findAllComplaint() {
        return complaintMapper.findAllComplaint();
    }

    @Override
    public int completedComplaint(Complaint complaint) {
        return complaintMapper.completedComplaint(complaint);
    }

    @Override
    public int handlerComplaint(int id, int status) {
        return complaintMapper.handlerComplaint(id, status);
    }
}
