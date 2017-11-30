package com.cat.rufull.domain.mapper.lineItem;

import com.cat.rufull.domain.model.LineItem;

import java.util.List;

public interface LineItemMapper {
    public void insertLineItems(List<LineItem> itemList);
}