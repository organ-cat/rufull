package com.cat.rufull.domain.service.shop;

import com.cat.rufull.domain.mapper.shop.ShopMapper;
import com.cat.rufull.domain.model.Shop;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopMapper shopMapper;

    @Override
    public List<Shop> findAll() {
        /**
        *@Author:Caoxin
        *@Description:// 查询全部商店
        *@Date:9:03 2017/12/4
        *@param[]
        *@returnjava.util.List<com.cat.rufull.domain.model.Shop>
        */
        return shopMapper.findAll();
    }

    @Override
    public Shop findById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description：通过id查询一个商店
        *@Date:9:05 2017/12/4
        *@param[id]
        *@returncom.cat.rufull.domain.model.Shop
        */
        return shopMapper.findById(id);
    }

    @Override
    public int deleteById(Integer id) {
        /**
        *@Author:Caoxin
        *@Description:通过id删除商家，这个一般不用，一般通过改变商店状态
        *@Date:9:03 2017/12/4
        *@param[id]
        *@returnint
        */
        shopMapper.deleteById(id);
        return 0;
    }

    @Override
    public int add(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:增加一个商店
        *@Date:9:04 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.add(shop);
        return 0;
    }

    @Override
    public int updateByIdSelective(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:通过id和其他属性的组合去更新的一个商店，任何的属性都可以
        *@Date:9:05 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.updateByIdSelective(shop);
        return 0;
    }

    @Override
    public int updateById(Shop shop) {
        /**
        *@Author:Caoxin
        *@Description:通过id更新一个shop，所有的字段都需要输入，一般不用
        *@Date:9:06 2017/12/4
        *@param[shop]
        *@returnint
        */
        shopMapper.updateById(shop);
        return 0;
    }
}
