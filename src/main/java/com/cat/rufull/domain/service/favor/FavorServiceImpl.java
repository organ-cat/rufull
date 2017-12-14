package com.cat.rufull.domain.service.favor;

import com.cat.rufull.domain.mapper.favor.FavorMapper;
import com.cat.rufull.domain.model.Favor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service("favorService")
public class FavorServiceImpl implements FavorService{
    @Autowired
    private FavorMapper favorMapper;
    @Override
    public List<Favor> findShopByAccountId(Integer id) {
        return favorMapper.findShopByAccountId(id);
    }

    @Override
    public int deleteShopByAccountIdAndShopId(Integer account_id, Integer shop_id) {
        return favorMapper.deleteShopByAccountIdAndShopId(account_id,shop_id);
    }

    @Override
    public int deleteByFavorId(Integer id) {
        return favorMapper.deleteByFavorId(id);
    }

    @Override
    public int addFavor(Favor favor) {
        return favorMapper.addFavor(favor);
    }

}
