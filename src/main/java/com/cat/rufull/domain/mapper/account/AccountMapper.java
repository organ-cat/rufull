package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Account;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountMapper {
    /**
     * 根据id查找账号
     * @param id
     * @return
     */
    Account findAccountById(Integer id);

    /**
     * 根据手机查找用户
     * @param phone
     * @return
     */
    Account findAccountByPhone(@Param("phone") String phone, @Param("role")Integer role);

    /**
     * 根据邮箱查找账号
     * @param email
     * @return
     */
    Account findAccountByEmail(@Param("email")String email,@Param("role")Integer role);

    /**
     * 注册账号
     * @param account
     */
    void register(Account account);

    /**
     * 更新用户的头像
     * @param id
     * @param photo
     */
    void updateAccountPhoto(@Param("id") Integer id, @Param("photo") String photo);

    /**
     * 删除用户，待确定
     * @param id
     */
    void deleteAccount(Integer id);

    /**
     * 登陆
     * @param account
     * @return
     */
    Account login(Account account);

    /**
     * 修改用户的昵称
     * @param id
     * @param nickname
     */
    void updateNickname(@Param("id") Integer id,@Param("nickname") String nickname);

    /**
     * 更改用户的信息
     * @param account
     */
    void updateAccountInfo(Account account);

    /**
     * 设置账号的用户名
     * @param id
     * @param username
     */
    void setUsername(@Param("id")Integer id,@Param("username")String username);

    /**
     * 根据用户名查询用户
     * @param username
     * @param role
     * @return
     */
    Account findAccountByUsername(@Param("username")String username,@Param("role") Integer role);

    /**
     * 绑定手机号码
     * @param account
     */
    void bindPhone(Account account);

    /**
     * 绑定邮箱
     * @param account
     */
    void bindEmail(Account account);

    int updateAccountStatus(@Param("id") int id, @Param("status") int status);

    List<Account> findAllAccount();

    int mUpdateAccount(Account account);

    int mdelAccount(Integer id);

    List<Account> findName(@Param("findName") String findName);

    Account findAccountPassword(@Param("id")int id, @Param("oldPassword")String oldPassword);

    void updatePassword(@Param("id")int id, @Param("newPassword")String newPassword);

    int mredelAccount(Integer id);

    void changePasswordByPhone(@Param("phone")String phone,@Param("password")String password, @Param("role")int role);

    void changePasswordByEmail(@Param("email")String email,@Param("password")String password,@Param("role") int role);

    int updateBalance(@Param("id")int id, @Param("balance")double balance);
}
