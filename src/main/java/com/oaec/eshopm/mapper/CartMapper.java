package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CartMapper {
    List<Map<String,Object>> queryByUserId(@Param("userId") Integer userId);


    int doInsert(Map<String,Object> param);


    Map<String,Object> queryByUserIdANDProductIdANDColor(Map<String,Object> param);

    int  updateAmount(Map<String,Object> param);


    int doDelete(Map<String,Object> param);

    int addAmount(Map<String,Object> param);

    int subAmount(Map<String,Object> param);

    Map<String,Object> queryTotal(@Param("userId") Integer userId, @Param("cartIds") Integer[] cartIds);

    List<Map<String,Object>> queryProduct4Checkout(@Param("userId") Integer userId,@Param("cartIds") Integer[] cartIds);
    List<Map<String,Object>> queryByUserIdANDProductId(@Param("userId") Integer userId,@Param("productId") Integer productId);
  /*  int doDelete(@Param("cartId") Integer cartId);*/

    Map<String, Object> queryIsCartOverAmount(@Param("cartId") Integer cartId,@Param("color") String color,@Param("productId") Integer productId);
}
