package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AccountMapper;
import com.cat.rufull.domain.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("accountService")
@Transactional
public class AccountServiceImpl implements IAccountService {
    @Autowired
    private AccountMapper accountMapper;

    @Override
    @Transactional(readOnly = true)//只读
    public Account findAccountById(int id) {
        return this.accountMapper.findAccountById(id);
    }

    @Override
    public void regitser(Account account) {
        accountMapper.register(account);
    }

    @Override
    public void updateAccountInfo(Account account) {
        accountMapper.updateAccountInfo(account);
    }

    @Override
    public void deleteAccount(int id) {
        accountMapper.deleteAccount(id);
    }
}
