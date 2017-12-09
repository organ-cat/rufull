package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.LoginLogMapper;
import com.cat.rufull.domain.model.LoginLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("loginLogService")
@Transactional
public class LoginLogServiceImpl implements LoginLogService {
    @Autowired
    private LoginLogMapper loginLogMapper;

    @Override
    public void addLoginLog(LoginLog log) {
        loginLogMapper.addLoginLog(log);
    }

    @Override
    public List<LoginLog> fingLoginLogList(int account_id) {
        return loginLogMapper.fingLoginLogList(account_id);
    }
}
