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
        List<LoginLog> logList = loginLogMapper.fingLoginLogList(log.getAccountId());
        boolean isExist = true;
        for (LoginLog loginlog : logList) {
            //如果用户的新的登陆日志中的ip和location和之前的登陆日志中的ip和location都相同，则不添加登陆日志
            if (loginlog.getIp().equals(log.getIp()) && loginlog.getLocation().equals(log.getLocation())) {
                isExist = false;
                break;
            }
        }
        if (isExist) {
            loginLogMapper.addLoginLog(log);
        }
    }

    @Override
    public List<LoginLog> fingLoginLogList(int account_id) {
        return loginLogMapper.fingLoginLogList(account_id);
    }
}
