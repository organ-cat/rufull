package com.cat.rufull.domain.service.managerlog;

import com.cat.rufull.domain.mapper.managerlog.ManagerLogMapper;
import com.cat.rufull.domain.model.ManageLog;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
@Service
public class ManagerLogServiceImpl implements ManagerLogService {
    @Resource
    private ManagerLogMapper managerLogMapper;
    @Override
    public List<ManageLog> findAllLog() {
        List<ManageLog> list = managerLogMapper.findAllLog();
        return list;
    }

    @Override
    public int addLog(ManageLog log) {
        return 0;
    }
}
