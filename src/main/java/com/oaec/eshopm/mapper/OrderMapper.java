package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Map<String,Object>> queryProductByOrderId(@Param("orderId") Integer orderId);
    List<Map<String,Object>> queryByUserId(Map<String,Object> param);
    Double getTotalPrice(@Param("orderId") Integer orderId);
    int doInsert(Map<String,Object> param);

    int doInsertDetail(Map<String,Object> param);

    int doChangeStatus(@Param("userId") Integer userId,@Param("orderId") Integer orderId);
    /*int doInsertOrderDetail(Map<String,Object> param);*/

    List<Map<String,Object>> queryByUserIdANDOrderId(@Param("userId") Integer userId,@Param("orderId") Integer orderId);

    Map<String,Object> queryDetailByDetailId(@Param("detailId") Integer detailId);

    int doUpdateDetailStatus(@Param("detailId") Integer detailId);
    int updateOrderDetail(@Param("content") String content,@Param("detailId") Integer detailId);

    int countOrder(@Param("userId") Integer userId);
    int countOrderByOrderStatus(@Param("userId") Integer userId);
    int countOrderByOrderStatusAndDetailStatus(@Param("userId") Integer userId);
}
