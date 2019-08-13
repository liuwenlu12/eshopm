package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.AddressMapper;
import com.oaec.eshopm.mapper.OrderMapper;
import com.oaec.eshopm.mapper.UserMapper;
import com.oaec.eshopm.service.PersonalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AddressMapper addressMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Map<String, Object>> getAddress(Integer userId) {
        return addressMapper.queryByUserId(userId);
    }

    @Override
    public Map<String, Object> getUser(Integer userId) {
        return userMapper.queryByUserId(userId);
    }

    @Override
    public Double getOrderDetailPrice(Integer orderId) {
       return   orderMapper.getTotalPrice(orderId);
    }
}
