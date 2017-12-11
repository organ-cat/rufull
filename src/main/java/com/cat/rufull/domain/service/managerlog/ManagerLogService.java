package com.cat.rufull.domain.service.managerlog;

import com.cat.rufull.domain.model.ManageLog;

import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
public interface ManagerLogService {
    List<ManageLog> findManageLog();

    List<ManageLog> findAccountLog();

    int addLog(ManageLog log);

    List<ManageLog> findLogsByCondition(Date beginTime, Date endTime, String keyword);

}
