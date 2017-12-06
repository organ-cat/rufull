package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.model.Address;

import java.util.List;

public interface AddressService {

    List<Address> queryAddressList(Integer id);

    void addAddress(Address address);

    Address findAddressById(Integer id);

    int findAddressCount(int account_id);

    void deleteAddressById(int id);

    void updateAddress(Address address);


//    void updateAddress(Address address);
//    void addAddress(Address address);
//    Address queryAddressById(Address address);
//    void deleteAddress(Address address);
}
