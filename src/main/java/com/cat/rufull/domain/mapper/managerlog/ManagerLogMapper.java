package com.cat.rufull.domain.mapper.managerlog;

import com.cat.rufull.domain.model.ManageLog;

import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
public interface ManagerLogMapper {
    public  List<ManageLog> findAllLog();
}
