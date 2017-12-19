package com.cat.rufull.domain.mapper.address;

import com.cat.rufull.domain.model.Address;

import java.util.List;

public interface AddressMapper {
    /**
     * 根据用户id查询地址集合
     * @param id
     * @return
     */
    List<Address> queryAddressList(Integer accountId);

    /**
     * 添加地址
     * @param address
     */
    void addAddress(Address address);

    /**
     * 根据id查询地址
     * @param id
     * @return
     */
    Address findAddressById(Integer id);

    /**
     * 根据用户id查询地址总数
     * @param account_id
     * @return
     */
    int findAddressCount(int account_id);

    /**
     * 更新地址信息
     * @param address
     */
    void updateAddress(Address address);

    void updateStatus(Address address);
}
