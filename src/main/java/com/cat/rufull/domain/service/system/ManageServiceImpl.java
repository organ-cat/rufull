package com.cat.rufull.domain.service.system;

import com.cat.rufull.domain.mapper.manager.ManagerMapper;
import com.cat.rufull.domain.model.Manager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Luckily on 2017/12/6.
 */
@Service
public class ManageServiceImpl implements ManageService{
    @Resource
    private ManagerMapper managerMapper;

    /*管理员登录*/
    @Override
    public Manager login(Manager manager) {
        return managerMapper.login(manager);
    }
    /*添加管理员*/
    @Override
    public int saveManager(Manager manager) {
        return managerMapper.saveManager(manager);
    }
    /*找到所有管理员*/
    @Override
    public List<Manager> findAll() {
        return managerMapper.findAll();
    }
    /*根据id获得管理员信息*/
    @Override
    public  Manager  getManagerById(Integer id) {
        return managerMapper.getManagerById(id);
    }
    /*修改管理员*/
    @Override
    public int updateManager(Manager manager) {
        return managerMapper.updateManager(manager);
    }
    /*根据id删除管理员*/
    @Override
    public int delManager(Integer id) {

        return managerMapper.delManager(id);
    }

    @Override
    public int reDelManager(Integer id) {

        return managerMapper.reDelManager(id);
    }

    /*根据字段模糊查询管理员  分别查询 username phone email*/
    @Override
    public List<Manager> findName(String findname) {
        return managerMapper.findName(findname);
    }

    @Override
    public int updateManagerPhoto(Manager Manager) {
        return 0;
    }


}
