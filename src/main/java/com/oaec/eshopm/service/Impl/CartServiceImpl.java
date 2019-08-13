package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.CartMapper;
import com.oaec.eshopm.mapper.PropertyMapper;
import com.oaec.eshopm.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("cartService")
public class CartServiceImpl implements CartService {
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private PropertyMapper propertyMapper;
    @Override
    public List<Map<String, Object>> getCartProducts(Integer userId) {
        return cartMapper.queryByUserId(userId);
    }

    @Override
    public boolean addCart(Integer amount, String color, Integer productId, Integer userId) {
        Map<String,Object> param = new HashMap<>();
        param.put("amount",amount);
        param.put("color",color);
        param.put("productId",productId);
        param.put("userId",userId);

        int result = 0;


        Map<String, Object> cart = cartMapper.queryByUserIdANDProductIdANDColor(param);

        if (cart == null) {
            result = cartMapper.doInsert(param);
        } else {
            result = cartMapper.updateAmount(param);
        }


        return result == 1;

    }

    @Override
    public boolean deleteCart(Integer userId, String color, Integer productId) {
        Map<String,Object> param = new HashMap<>();
        param.put("color",color);
        param.put("productId",productId);
        param.put("userId",userId);
        return cartMapper.doDelete(param)==1;
    }

    @Override
    public boolean updateAmount(String action, Integer userId, String color, Integer productId, Integer cartId) {
        int result = 0;
        Map<String,Object> param = new HashMap<>();
        param.put("color",color);
        param.put("productId",productId);
        param.put("userId",userId);


        if ("add".equals(action)) {
            if(cartMapper.queryIsCartOverAmount(cartId,color,productId)!=null){
                result = cartMapper.addAmount(param);
            }

        } else {
            result = cartMapper.subAmount(param);
        }

        return  result == 1;
    }

    @Override
    public Map<String, Object> getTotal(Integer userId, Integer[] cartIds) {

        return  cartMapper.queryTotal(userId,cartIds);
    }

    @Override
    public List<Map<String, Object>> getProducts4Checkout(Integer userId, Integer[] cartIds) {

        return  cartMapper.queryProduct4Checkout(userId,cartIds);
    }

    @Override
    public Boolean isOverAmount(Integer amount, String color, Integer productId, Integer userId) {
        Map map = new HashMap<>();

        map.put("userId",userId);
        map.put("productId",productId);
        map.put("color",color);
        int amount1 = 0;
        Map map1 = cartMapper.queryByUserIdANDProductIdANDColor(map);
        if(map1==null){
            amount1 = 0;
        }else{
            amount1 = Integer.parseInt(map1.get("amount").toString());

        }
        Map<String, Object> property = propertyMapper.queryByColorAndProductId(color, productId);
        int inventory = Integer.parseInt(property.get("inventory").toString());
        if((amount1+amount)<=inventory){
            return true;
        }else{
            return false;
        }
    }
}
