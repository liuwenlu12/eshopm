package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PropertyMapper {
    List<Map<String,Object>> queryByProductId(@Param("productId") Integer productId);
    int updateInventory(@Param("amount") Integer amount,@Param("productId") Integer productId,@Param("color") String color);
    Map<String,Object> queryByColorAndProductId(@Param("color") String color,@Param("productId") Integer productId);
}
