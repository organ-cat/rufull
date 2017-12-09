package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Footprint;

import java.util.List;

public interface FootprintService {
    void addFootprint(Footprint footprint);

    List<Footprint> deleteFootprint(int accountId, int shopId);

    List<Footprint> findFootprintList(int account_id);
}
