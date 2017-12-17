package com.cat.rufull.domain.service.account;

import com.cat.rufull.domain.mapper.account.AddressMapper;
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
    @Autowired
    private AccountService accountService;

    @Override
    public List<Address> queryAddressList(Integer accountId) {
        return addressMapper.queryAddressList(accountId);
    }

    @Override
    public boolean addAddress(Address address) {
        int count = addressMapper.findAddressCount(address.getAccountId());
        if (count <= 12) {
            if (address.getStatus() == Address.ADDRESS_DEFAULT) {
                addressMapper.updateStatus(address);
            }
            addressMapper.addAddress(address);
            return true;
        }
        return false;
    }

    @Override
    public Address findAddressById(Integer id) {
        return addressMapper.findAddressById(id);
    }

    @Override
    public int findAddressCount(int account_id) {
        return addressMapper.findAddressCount(account_id);
    }

    @Override
    public void deleteAddressById(int id) {
        Address address = addressMapper.findAddressById(id);
        address.setAccountId(null);
        addressMapper.updateAddress(address);
    }

    @Override
    public void updateAddress(Address address) {
        Address oldAddress = addressMapper.findAddressById(address.getId());
        oldAddress.setAccountId(null);
        addressMapper.updateAddress(oldAddress);
        address.setId(null);
        if (address.getStatus() == Address.ADDRESS_DEFAULT) {
            addressMapper.updateStatus(address);
        }
        addressMapper.addAddress(address);
    }
}