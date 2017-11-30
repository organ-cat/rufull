package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Address;

import java.util.List;

public interface AddressService {
    List<Address> queryAddress(Account account);

    int queryAddressCount(Account account);

    void updateAddress(Address address);

    void addAddress(Address address);

    Address queryAddressById(Address address);

    void deleteAddress(Address address);
}
