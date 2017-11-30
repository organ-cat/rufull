package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Account;

public interface AccountMapper {
    /**
     *
     * @param id
     * @return
     */
    Account findAccountById(Integer id);

    Account findAccountByPhone(String phone);

    Account findAccountByEmail(String email);

    void register(Account account);

    void updateAccountPhoto(Account account);

    void deleteAccount(Integer id);

    Account login(Account account);

    void updateNickname(Account account);
}
