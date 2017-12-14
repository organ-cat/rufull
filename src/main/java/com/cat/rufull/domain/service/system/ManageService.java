package com.cat.rufull.domain.service.system;

import com.cat.rufull.domain.model.Manager;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Luckily on 2017/12/5.
 */
public interface ManageService {
    /*管理员登录*/
    Manager login(Manager manager);
    /*添加管理员，返回改变的行数*/
    int saveManager(Manager manager);
    /*查询所有管理员*/
    List<Manager> findAll();
    /*根据id查询管理员*/
    Manager getManagerById(Integer id);
    /*更新管理员信息*/
    int updateManager(Manager manager);
    /*根据id删除管理员*/
    int delManager(Integer id);
    /*根据id恢复已经被删除的管理员*/
    int reDelManager(Integer id);
    /*根据字段分别模糊查询 姓名，邮箱，电话号码获得管理员信息*/
    List<Manager> findName(String findname);
    /*管理员更换头像*/
    int updateManagerPhoto(Manager Manager);
}
