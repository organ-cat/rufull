package com.cat.rufull.domain.repository.user;

import com.cat.rufull.domain.model.User;

public interface UserRepository {
    User findById(Integer id);
}