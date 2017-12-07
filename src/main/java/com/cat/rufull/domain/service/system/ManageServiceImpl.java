package com.cat.rufull.domain.service.system;

import com.cat.rufull.domain.model.Manager;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Service
public class ManageServiceImpl implements ManageService{
    /*管理员登录*/
    @Override
    public Manager login(Manager manager) {
        return null;
    }
    /*添加管理员*/
    @Override
    public int saveManager(Manager manager) {
        return 0;
    }
    /*找到所有管理员*/
    @Override
    public List<Manager> findAll() {
        return null;
    }
    /*根据id获得管理员信息*/
    @Override
    public  Manager  getManagerById(Integer id) {
        return null;
    }
    /*修改管理员*/
    @Override
    public int updateManager(Manager manager) {
        return 0;
    }
    /*根据id删除管理员*/
    @Override
    public int delManager(Integer id) {
        return 0;
    }
    /*根据字段模糊查询管理员  分别查询 username phone email*/
    @Override
    public List<Manager> findName(String findname) {
        return null;
    }


}
