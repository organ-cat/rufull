package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Address;

import java.util.List;

public interface AccountService {
    /**
     *
     * @param id
     * @return
     */
    public Account findAccountById(Integer id);

    public void register(Account account);

    public void updateAccountPhoto(Account account);

    public void deleteAccount(Integer id);

    Account findAccountByPhone(String phone);

    Account findAccountByEmail(String email);

    Account login(Account account);

    void updateNickname(Account account);


}
