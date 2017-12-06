package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;

import java.util.List;

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

    public Account findAccountByUsername(String username, Integer role);

    public void bindPhone(Account account);

    public void bindEmail(Account account);

    List<Account> findAllAccount();

    /**
     * 管理员更新用户
     * @param account
     * @return
     */
    int mUpdateAccount(Account account);

    /**
     * 管理员删除用户
     * @param id
     * @return
     */
    int mdelAccount(Integer id);

    /**
     * 根据字段 查询电话号码，昵称，用户名，邮箱
     * @param findname
     * @return
     */
    List<Account> findName(String findname);
}
