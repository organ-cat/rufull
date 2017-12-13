package com.cat.rufull.domain.mapper.managerlog;

import com.cat.rufull.domain.model.ManageLog;
import com.cat.rufull.domain.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Luckily on 2017/11/30.
 */
public interface ManagerLogMapper {
    List<ManageLog> findAllLog();

    List<ManageLog> findAllmLog();

    int addLogs(ManageLog log);

    List<ManageLog> findLogsByCondition(@Param(value = "beginTime") Date beginTime,
                                        @Param(value = "endTime")Date endTime,
                                        @Param(value = "keyword") String keyword);
}
