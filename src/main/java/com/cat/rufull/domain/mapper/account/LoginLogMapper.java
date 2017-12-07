package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.LoginLog;

import java.util.List;

public interface LoginLogMapper {
    void addLoginLog(LoginLog log);

    List<LoginLog> fingLoginLogList(int account_id);
}
