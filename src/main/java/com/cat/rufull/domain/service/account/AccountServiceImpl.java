package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AccountMapper;
import com.cat.rufull.domain.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service("accountService")
@Transactional
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountMapper accountMapper;

    @Override
    @Transactional(readOnly = true)
    public Account findAccountById(Integer id) {
        return this.accountMapper.findAccountById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public Account findAccountByPhone(String phone,Integer role) {
        return accountMapper.findAccountByPhone(phone, role);
    }

    @Override
    @Transactional(readOnly = true)
    public Account findAccountByEmail(String email, Integer role) {
        return accountMapper.findAccountByEmail(email, role);
    }

    @Override
    public Account login(Account account) {
        return accountMapper.login(account);
    }

    @Override
    public void updateNickname(Account account) {
        accountMapper.updateNickname(account);
    }

    @Override
    public void setUsername(Account account) {
        accountMapper.setUsername(account);
    }

    @Override
    @Transactional(readOnly = true)
    public Account findAccountByUsername(String username, Integer role) {
        return accountMapper.findAccountByUsername(username, role);
    }

    @Override
    public void bindPhone(Account account) {
        accountMapper.bindPhone(account);
    }

    @Override
    public void bindEmail(Account account) {
        accountMapper.bindEmail(account);
    }

    @Override
    public void register(Account account) {
        //设置账号注册时间
        account.setRegisterTime(new Date());
        accountMapper.register(account);
    }

    @Override
    public void updateAccountPhoto(Account account) {
        accountMapper.updateAccountPhoto(account);
    }

    @Override
    public void deleteAccount(Integer id) {
        accountMapper.deleteAccount(id);
    }
}
