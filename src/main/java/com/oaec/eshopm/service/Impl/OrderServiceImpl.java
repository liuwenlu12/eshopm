package com.oaec.eshopm.service.Impl;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.mapper.*;
import com.oaec.eshopm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private CartMapper cartMapper;
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private PropertyMapper propertyMapper;
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public List<Map<String, Object>> getOrders(Integer userId,Integer isConfirm,Integer isAppraise) {
        HashMap<String, Object> param = new HashMap<>();
        param.put("userId",userId);
        param.put("isConfirm",isConfirm);
        param.put("isAppraise",isAppraise);
        List<Map<String, Object>> orderList = orderMapper.queryByUserId(param);
        System.out.println("嗷嗷"+JSON.toJSONString(orderList));
        for (Map<String, Object> map : orderList) {
            int addressId = Integer.parseInt(map.get("address_id").toString());
            Map<String, Object> address = addressMapper.queryByAddressId(addressId);
            map.put("address",address);
            int order_id = Integer.parseInt(map.get("order_id").toString());
            Double totalPrice = orderMapper.getTotalPrice(order_id);
            map.put("totalPrice",totalPrice);
            List<Map<String, Object>> products = orderMapper.queryProductByOrderId(order_id);

            map.put("products",products);
        }
        System.out.println("啊啊啊"+JSON.toJSONString(orderList));
        return orderList;

    }

    @Override
    public boolean submit(Integer userId, Integer addressId,String payment,String logistics, Integer[] productIds) {
        Map<String, Object> param = new HashMap<>();
        Map<String, Object> cartIds = new HashMap<>();
        param.put("userId",userId);
        param.put("addressId",addressId);
        param.put("payment",payment);
        param.put("logistics",logistics);
        int i = orderMapper.doInsert(param);
        int orderId = Integer.parseInt(param.get("orderId").toString());
        int result = 1;
        for (Integer productId : productIds) {
            List<Map<String,Object>> products = cartMapper.queryByUserIdANDProductId(userId, productId);
            for (Map<String, Object> product : products) {
                product.put("order_id",orderId);
                product.put("user_id",userId);
                result *=  orderMapper.doInsertDetail(product);
                Object cart_id = product.get("cart_id");
                int cartId = Integer.parseInt(cart_id.toString());
                cartIds.put("cartId",cartId);
                result +=  cartMapper.doDelete(cartIds);
                Object a = product.get("amount");
                int amount = Integer.parseInt(a.toString());
                String color = product.get("color").toString();
                result *=   productMapper.updateSalesVolume(amount,productId);
                result *=    propertyMapper.updateInventory(amount,productId,color);
            }
        }
        return result > 0;
    }

    @Override
    public boolean changeOrderStatus(Integer userId, Integer orderId) {

        return orderMapper.doChangeStatus(userId,orderId)==1;
    }

    @Override
    public List<Map<String, Object>> getOrderDetail(Integer userId, Integer orderId) {
       return orderMapper.queryByUserIdANDOrderId(userId,orderId);
    }

    @Override
    public Map<String, Object> getDetailByDetailId(Integer detailId) {

      return   orderMapper.queryDetailByDetailId(detailId);
    }

    @Override
    public Boolean submit4buy(Integer userId,Integer addressId,String payment, String logistics,String name ,String img_url,Double price,Integer amount,String color,Integer productId) {
         Map<String, Object> param = new HashMap<>();
        Map<String, Object> product = new HashMap<>();
        param.put("userId",userId);
        param.put("addressId",addressId);
        param.put("payment",payment);
        param.put("logistics",logistics);
        int i = orderMapper.doInsert(param);
        int orderId = Integer.parseInt(param.get("orderId").toString());
        int result = 1;
        System.out.println(JSON.toJSONString(productId));
            product.put("order_id",orderId);
            product.put("product_name",name);
            product.put("img_url",img_url);
            product.put("price",price);
            product.put("amount",amount);
            product.put("color",color);
            product.put("user_id",userId);
            product.put("product_id",productId);
            result *=  orderMapper.doInsertDetail(product);
            result *=   productMapper.updateSalesVolume(amount,productId);
            result *=    propertyMapper.updateInventory(amount,productId,color);

     return result>0;
    }

    @Override
    public Integer getCountOrder(Integer userId) {
        return orderMapper.countOrder( userId);
    }

    @Override
    public Integer getCountOrderNoConfirm(Integer userId) {
        return orderMapper.countOrderByOrderStatus(userId);
    }

    @Override
    public Integer getCountOrderNoAppraise(Integer userId) {
        return orderMapper.countOrderByOrderStatusAndDetailStatus(userId);
    }
}
