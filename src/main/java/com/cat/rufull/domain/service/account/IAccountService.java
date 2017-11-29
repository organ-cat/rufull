package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;

public interface IAccountService {
    public boolean findAccountById(int id);

    public void regitser(Account account);

    public void updateAccountInfo(Account account);

    public void deleteAccount(int id);
}
