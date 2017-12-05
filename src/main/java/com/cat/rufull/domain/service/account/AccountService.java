package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;

public interface AccountService {

    public Account findAccountById(Integer id);

    public void register(Account account);

    public void updateAccountPhoto(Account account);

    public void deleteAccount(Integer id);

    Account findAccountByPhone(String phone, Integer role);

    Account findAccountByEmail(String email,Integer role);

    Account login(Account account);

    void updateNickname(Account account);


    void setUsername(Account account);
}
