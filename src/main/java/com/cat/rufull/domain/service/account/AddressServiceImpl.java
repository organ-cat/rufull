package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AddressMapper;
import com.cat.rufull.domain.model.Account;
import com.cat.rufull.domain.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("addressService")
@Transactional
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;

    @Override
    @Transactional(readOnly = true)
    public List<Address> queryAddress(Account account) {
        return addressMapper.queryAddress(account);
    }

    @Override
    @Transactional(readOnly = true)
    public int queryAddressCount(Account account) {
        return addressMapper.queryAddressCount(account);
    }

    @Override
    @Transactional(readOnly = true)
    public void updateAddress(Address address) {
        Address oldAdress = queryAddressById(address);
        oldAdress.setAccountId(null);
        // address.setStatus();
        addressMapper.updateAddress(oldAdress);

        address.setId(null);
        addressMapper.addAddress(address);
    }

    @Override
    public void addAddress(Address address) {
        addressMapper.addAddress(address);
    }

    @Override
    @Transactional(readOnly = true)
    public Address queryAddressById(Address address) {
        return addressMapper.queryAddressById(address);
    }

    @Override
    public void deleteAddress(Address address) {
        Address  deletedAddress = queryAddressById(address);
        deletedAddress.setAccountId(null);
        // address.setStatus();
        addressMapper.updateAddress(deletedAddress);
    }
}
