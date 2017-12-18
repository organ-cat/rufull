package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.FootprintMapper;
import com.cat.rufull.domain.model.Footprint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service("footprintService")
@Transactional
public class FootprintServiceImpl implements FootprintService {
    @Autowired
    private FootprintMapper footprintMapper;

    @Override
    public void addFootprint(Footprint footprint) {
        //查询出所有的足迹集合
        List<Footprint> footprintList = footprintMapper.findFootprintList(footprint.getAccountId());
        //足迹集合是null，添加
        if (footprintList == null) {
            footprintMapper.addFootprint(new Footprint( new Date(), footprint.getAccountId(), footprint.getShopId()));
        } else {
            //足迹集合数小于等于8则可以直接添加
            if (footprintList.size() <= 8) {
                //标识是否浏览过改商店
                boolean isBrowse = true;
                for (Footprint foot : footprintList) {
                    //相同，浏览过
                    if (foot.getShopId() == footprint.getShopId()) {
                        //更改标识
                        isBrowse = false;
                        break;
                    }
                }
                if (isBrowse) {
                    //添加足迹
                    footprintMapper.addFootprint(new Footprint( new Date(), footprint.getAccountId(), footprint.getShopId()));
                }
            } else {
                //标识是否浏览过改商店
                boolean isBrowse = true;
                for (Footprint foot : footprintList) {
                    //相同，浏览过
                    if (foot.getShopId() == footprint.getShopId()) {
                        //更改标识
                        isBrowse = false;
                        break;
                    }
                }
                if (isBrowse) {
                    //删除时间最久的浏览记录，保证只有8条浏览记录
                    footprintMapper.deleteFootprintById(footprintList.get(0).getId());
                    //添加新的足迹，保证只有8条浏览记录
                    footprintMapper.addFootprint(new Footprint( new Date(), footprint.getAccountId(), footprint.getShopId()));
                }
            }
        }
    }

    @Override
    public List<Footprint> deleteFootprint(int accountId,int shopId) {
        //删除足迹
        footprintMapper.deleteFootprint(accountId, shopId);
        //查询足迹集合并且返回集合
        return footprintMapper.findFootprintList(accountId);
    }

    @Override
    public List<Footprint> findFootprintList(int account_id) {
        return footprintMapper.findFootprintList(account_id);
    }
}
