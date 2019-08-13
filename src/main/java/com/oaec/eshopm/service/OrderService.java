package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

    List<Map<String,Object>>  getOrders(Integer userId,Integer isConfirm,Integer isAppraise);

    boolean submit(Integer userId, Integer addressId,String payment,String logistics, Integer[] productIds);

    boolean changeOrderStatus(Integer userId, Integer orderId);

    List<Map<String,Object>> getOrderDetail(Integer userId, Integer orderId);

    Map<String,Object> getDetailByDetailId(Integer detailId);

    Boolean submit4buy(Integer userId,Integer addressId,String payment, String logistics,String name ,String img_url,Double price,Integer amount,String color,Integer productId);

    Integer getCountOrder(Integer userId);
    Integer getCountOrderNoConfirm(Integer userId);
    Integer getCountOrderNoAppraise(Integer userId);
}
