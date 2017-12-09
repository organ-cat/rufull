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

    int delManager(Manager manager);

    int reDelManager(Manager manager);

    List<Manager> findName(String findname);

    int updateManagerPhoto(Manager manager);
}
