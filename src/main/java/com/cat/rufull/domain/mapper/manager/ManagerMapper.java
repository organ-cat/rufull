package com.cat.rufull.domain.mapper.manager;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ManagerMapper {

    Manager login(Manager manager);

    int saveManager(Manager manager);

    List<Manager> findAll();

    Manager getManagerById(Integer id);

    int updateManager(Manager manager);

    int delManager(Integer id);

    int reDelManager(Integer id);

    List<Manager> findName(@Param(value = "findname") String findname);

    int updateManagerPhoto(Manager manager);
}
