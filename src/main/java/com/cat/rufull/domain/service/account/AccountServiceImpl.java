package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AccountMapper;
import com.cat.rufull.domain.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public Account findAccountByPhone(String phone) {
        return accountMapper.findAccountByPhone(phone);
    }

    @Override
    @Transactional(readOnly = true)
    public Account findAccountByEmail(String email) {
        return accountMapper.findAccountByEmail(email);
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
    public void register(Account account) {
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
