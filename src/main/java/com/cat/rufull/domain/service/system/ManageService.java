package com.cat.rufull.domain.service.system;

import com.cat.rufull.domain.model.Manager;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Luckily on 2017/12/5.
 */
public interface ManageService {
    Manager login(Manager manager);

    int saveManager(Manager manager);

    List<Manager> findAll();

    Manager getManagerById(Integer id);

    int updateManager(Manager manager);

    int delManager(Integer id);

    List<Manager> findName(String findname);
}
