package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;

import java.util.List;

public interface AccountService {

    public Account findAccountById(Integer id);

    public void register(Account account);

    public void updateAccountPhoto(Integer id ,String photo);

    public void deleteAccount(Integer id);

    Account findAccountByPhone(String phone, Integer role);

    Account findAccountByEmail(String email,Integer role);

    Account login(Account account);

    void updateNickname(Integer id, String nickname);

    void setUsername(Integer id, String username);

    public Account findAccountByUsername(String username, Integer role);

    public void bindPhone(Account account);

    public void bindEmail(Account account);

    List<Account> findAllAccount();

    /**
     * 管理员更新用户（更新用户的角色，状态，）
     * @param account
     * @return
     */
    int mUpdateAccount(Account account);

    /**
     * 管理员删除用户（修改用户状态代表删除）
     * @param id
     * @return
     */
    int mdelAccount(Integer id);

    /**
     * 根据字段 用户名邮箱手机其中一个都可以查询到用户？（模糊查询）
     * @param findName
     * @return
     */
    List<Account> findName(String findName);

    int updateAccountStatus(int id, int status);

    boolean updatePassword(int id, String newPassword, String oldPassword);

    int mredelAccount(Integer id);

    void changePasswordByPhone(String phone, String password, int role);

    void changePasswordByEmail(String email, String password, int role);

    int updateBalance(int id, double balance);
}
