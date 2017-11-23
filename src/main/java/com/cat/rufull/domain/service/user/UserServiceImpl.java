package com.cat.rufull.domain.service.user;

import com.cat.rufull.domain.model.User;
import com.cat.rufull.domain.repository.user.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional(readOnly = true)
    public User findById(int id) {
        return this.userRepository.findById(id);
    }
}
