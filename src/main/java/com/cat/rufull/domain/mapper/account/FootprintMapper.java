package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Footprint;

import java.util.List;

public interface FootprintMapper {
    void addFootprint(Footprint footprint);

    void deleteFootprint(int id);

    List<Footprint> findFootprintList(int account_id);
}
