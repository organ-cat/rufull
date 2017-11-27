package com.cat.rufull.domain.service.user;

import com.cat.rufull.domain.mapper.user.UserMapper;
import com.cat.rufull.domain.model.User;
import com.cat.rufull.domain.mapper.user.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(readOnly = true)
    public User findById(int id) {
        return this.userMapper.findById(id);
    }
}
