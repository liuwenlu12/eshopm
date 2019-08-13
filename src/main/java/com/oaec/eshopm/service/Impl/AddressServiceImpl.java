package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.AddressMapper;
import com.oaec.eshopm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("addressService")
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public List<Map<String, Object>> getAddress(Integer userId) {
        return addressMapper.queryByUserId(userId);
    }

    @Override
    public Boolean doDelete(Integer addressId, Integer userId) {
        return addressMapper.deleteByAddressIdAndUserId(addressId,userId)==1;
    }

    @Override
    public Boolean doUpdate(Integer userId, String address, String telNumber, String name, Integer addressId) {
        return addressMapper.updateAddressByUserIdAndAddressId(userId,address,telNumber,name,addressId)==1;
    }

    @Override
    public Boolean doInsert(String name, String telNumber, String address, Integer userId) {

        return addressMapper.doInsert(name,telNumber,address,userId)==1;
    }
}
