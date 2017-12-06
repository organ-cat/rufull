package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.FootprintMapper;
import com.cat.rufull.domain.model.Footprint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("footprintService")
@Transactional
public class FootprintServiceImpl implements FootprintService {
    @Autowired
    private FootprintMapper footprintMapper;

    @Override
    public void addFootprint(Footprint footprint) {
        footprintMapper.addFootprint(footprint);
    }

    @Override
    public void deleteFootprint(int id) {
        footprintMapper.deleteFootprint(id);
    }

    @Override
    public List<Footprint> findFootprintList(int account_id) {
        return footprintMapper.findFootprintList(account_id);
    }
}
