package com.cat.rufull.domain.mapper.account;

import com.cat.rufull.domain.model.Address;

import java.util.List;

public interface AddressMapper {
    List<Address> queryAddressList(Integer id);

    void addAddress(Address address);

    Address findAddressById(Integer id);

    int findAddressCount(int account_id);
}
