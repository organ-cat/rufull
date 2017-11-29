package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Account;

public interface AccountMapper {
    boolean findAccountById(int id);

    void register(Account account);

    void updateAccountInfo(Account account);

    void deleteAccount(int id);

}
