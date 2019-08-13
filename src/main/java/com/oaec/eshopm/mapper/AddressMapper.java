package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AddressMapper {
    Map<String,Object> queryByAddressId(@Param("addressId") Integer addressId);

    List<Map<String,Object>> queryByUserId(@Param("userId") Integer userId);

    int deleteByAddressIdAndUserId(@Param("addressId") Integer addressId,@Param("userId") Integer userId);

    int updateAddressByUserIdAndAddressId(@Param("userId") Integer userId,@Param("address") String address,@Param("telNumber") String telNumber,@Param("name") String name,@Param("addressId") Integer addressId);

    int doInsert(@Param("name") String name,@Param("telNumber") String telNumber,@Param("address") String address,@Param("userId") Integer userId);
}
