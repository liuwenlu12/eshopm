package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface CartService {
    List<Map<String,Object>> getCartProducts(Integer userId);

    boolean addCart(Integer amount,String color,Integer productId,Integer userId);

    boolean deleteCart(Integer userId,String color,Integer productId);

    boolean updateAmount(String action,Integer userId,String color,Integer productId,Integer cartId);

    Map<String,Object> getTotal(Integer userId, Integer[] cartIds);

    List<Map<String,Object>> getProducts4Checkout(Integer userId, Integer[] cartIds);

    Boolean isOverAmount(Integer amount,String color,Integer productId,Integer userId);
}
