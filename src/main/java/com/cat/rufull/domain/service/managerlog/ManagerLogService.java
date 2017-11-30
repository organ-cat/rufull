package com.cat.rufull.domain.service.managerlog;

import com.cat.rufull.domain.model.ManageLog;

import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
public interface ManagerLogService {
    public List<ManageLog> findAllLog();
}
