package com.cat.rufull.domain.service.managerlog;

import com.cat.rufull.domain.mapper.managerlog.ManagerLogMapper;
import com.cat.rufull.domain.model.ManageLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
@Service
public class ManagerLogServiceImpl implements ManagerLogService {
    @Resource
    private ManagerLogMapper managerLogMapper;

    @Override
    public List<ManageLog> findManageLog() {
        return managerLogMapper.findAllmLog();
    }

    @Override
    public List<ManageLog> findAccountLog() {
        return managerLogMapper.findAllLog();
    }

    @Override
    public int addLog(ManageLog log) {
        return managerLogMapper.addLogs(log);
    }

    @Override
    public List<ManageLog> findLogsByCondition(Date beginTime, Date endTime, String keyword) {
        return managerLogMapper.findLogsByCondition(beginTime,endTime,keyword);
    }
}
