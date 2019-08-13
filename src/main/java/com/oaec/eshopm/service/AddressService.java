package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface AddressService {
    List<Map<String,Object>> getAddress(Integer userId);


    Boolean doDelete(Integer addressId,Integer userId);

    Boolean doUpdate(Integer userId,String address ,String telNumber,String name,Integer addressId);

    Boolean doInsert(String name,String telNumber,String address,Integer userId);
}
