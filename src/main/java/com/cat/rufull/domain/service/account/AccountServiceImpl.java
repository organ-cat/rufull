package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AccountMapper;
import com.cat.rufull.domain.model.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

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
    public Account findAccountByPhone(String phone,Integer role) {
        return accountMapper.findAccountByPhone(phone, role);
    }

    @Override
    @Transactional(readOnly = true)
    public Account findAccountByEmail(String email, Integer role) {
        return accountMapper.findAccountByEmail(email, role);
    }

    @Override
    public Account login(Account account) {
        return accountMapper.login(account);
    }

    @Override
    public void updateNickname(Integer id,String nickname) {
        accountMapper.updateNickname(id, nickname);
    }

    @Override
    public void setUsername(Integer id,String username) {
        accountMapper.setUsername(id, username);
    }



    @Override
    @Transactional(readOnly = true)
    public Account findAccountByUsername(String username, Integer role) {
        return accountMapper.findAccountByUsername(username, role);
    }

    @Override
    public void bindPhone(Account account) {
        accountMapper.bindPhone(account);
    }

    @Override
    public void bindEmail(Account account) {
        accountMapper.bindEmail(account);
    }

    @Override
    public void register(Account account) {
        //设置账号注册时间
        account.setRegisterTime(new Date());
        accountMapper.register(account);
    }

    @Override
    public void updateAccountPhoto(Integer id, String photo) {
        accountMapper.updateAccountPhoto(id, photo);
    }

    @Override
    public void deleteAccount(Integer id) {
        accountMapper.deleteAccount(id);
    }

    //管理员获得所有用户
    @Override
    public List<Account> findAllAccount() {
        return accountMapper.findAllAccount();
    }


    //管理员更新用户 手机，用户名，邮箱，密码
    @Override
    public int mUpdateAccount(Account account) {
        return accountMapper.mUpdateAccount(account);
    }

    //管理员删除用户 删除等于修改状态，设置为0
    @Override
    public int mdelAccount(Integer id) {
        return accountMapper.mdelAccount(id);
    }
    //根据用户名，手机，邮箱查找用户
    @Override
    public List<Account> findName(String findName) {
        return accountMapper.findName(findName);
    }
    @Override
    public int updateAccountStatus(int id, int status) {
        return  accountMapper.updateAccountStatus(id, status);
    }

    @Override
    public boolean updatePassword(int id, String newPassword, String oldPassword) {
        Account account = accountMapper.findAccountPassword(id, oldPassword);
        if (account == null) {
            return false;
        } else {
            accountMapper.updatePassword(id, newPassword);
            return true;
        }
    }

    @Override
    public int mredelAccount(Integer id) {
        return accountMapper.mredelAccount(id);
    }

    @Override
    public void changePasswordByPhone(String phone,String password, int role) {
        accountMapper.changePasswordByPhone(phone,password, role);
    }

    @Override
    public void changePasswordByEmail(String email,String password, int role) {
        accountMapper.changePasswordByEmail(email,password, role);
    }

    @Override
    public int updateBalance(int id, double balance) {
        return accountMapper.updateBalance(id, balance);
    }
}
