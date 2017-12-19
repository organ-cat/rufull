package com.cat.rufull.domain.mapper.loginLog;

import com.cat.rufull.domain.model.LoginLog;

import java.util.List;

public interface LoginLogMapper {
    /**
     * 添加登陆日志
     * @param log   LoginLog对象
     */
    void addLoginLog(LoginLog log);

    /**
     * 根据用户id查询登陆日志集合
     * @param account_id
     * @return
     */
    List<LoginLog> fingLoginLogList(int account_id);
}
