package com.cat.rufull.domain.mapper.user;

import com.cat.rufull.domain.model.User;

public interface UserMapper {
    User findById(Integer id);
}