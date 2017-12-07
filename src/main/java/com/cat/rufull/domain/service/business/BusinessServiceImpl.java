package com.cat.rufull.domain.service.business;

import com.cat.rufull.domain.mapper.business.BusinessMapper;
import com.cat.rufull.domain.model.Business;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService{

    @Autowired
    private BusinessMapper businessMapper;


    @Override
    public List<Business> findAll() {
        /**
         *@Author:Caoxin
         *@Description:查询全部商家，返回一个List<Business>
         *@Date:23:58 2017/12/3
         *@param[]
         *@userAdministrator
         */
        return businessMapper.findAll();
    }
    

    @Override
    public Business findById(Integer id) {
        /**
         *@Author:Caoxin
         *@Description：通过Id查询商家
         *@Date:0:09 2017/12/4
         *@param:id:商家id
         *@return：Business
         */
        return businessMapper.findById(id);
    }


    @Override
    public int deleteById(Integer id) {
        /**
         *@Author:Caoxin
         *@Description:通过Id删除商家,该方法可能比较少用，如果需要将商家删除的话，改变用户的状态
         *@Date:0:10 2017/12/4
         *@param[id]:商家id
         *@return：int
         */
        return businessMapper.deleteById(id);
    }


    @Override
    public int add(Business business) {
        /**
         *@Author:Caoxin
         *@Description:添加商家:所有值都要填，除了id
         *@Date:0:12 2017/12/4
         *@param[business]
         *@return:int
         */
        businessMapper.add(business);
        return 0;
    }

    @Override
    public int updateByIdSelective(Business business) {
        /**
        *@Author:Caoxin
        *@Description:可以输入任何值和id去更新部分的字段，不需要全部写
        *@Date:0:15 2017/12/4
        *@param[business]
        *@return:int
        */
        return 0;
    }

    @Override
    public int updateById(Business business) {
        /**
        *@Author:Caoxin
        *@Description：商家所有的值都需要输入
        *@Date:0:16 2017/12/4
        *@param[business]
        *@return：int
        */
        businessMapper.updateById(business);
        return 0;
    }

    @Override
    public Business findBusinessByAccountId(Integer id) {
        /**
        *@Author:Caoxin
        *@Description：用过用户id查询商家
        *@Date:9:11 2017/12/7
        *@param[id]输入用户的id
        *@returncom.cat.rufull.domain.model.Business
        */
        return businessMapper.findBusinessByAccountId(id);
    }
}
