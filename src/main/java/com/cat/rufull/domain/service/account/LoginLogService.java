package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.LoginLog;

import java.util.List;

public interface LoginLogService {
    void addLoginLog(LoginLog log);

    List<LoginLog> fingLoginLogList(int account_id);
}
