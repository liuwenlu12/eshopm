package com.oaec.eshopm.controller;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.mapper.CartMapper;
import com.oaec.eshopm.service.AddressService;
import com.oaec.eshopm.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    
    @Autowired
    private CartService cartService;
    @Autowired
    private AddressService addressService;
    
    @GetMapping("/cart")
    public String cart(HttpSession session, Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        List<Map<String, Object>> products = cartService.getCartProducts(userId);
        model.addAttribute("products",products);
        return "cart";
    }

    @GetMapping(value = "/add2cart",produces = "application/json;charset=utf-8")
    @ResponseBody
    public  String addCart(HttpSession session,Integer productId,Integer amount,String color){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        Boolean overAmount = cartService.isOverAmount(amount, color, productId, userId);

        if(overAmount){
            boolean b = cartService.addCart(amount,color,productId,userId);

            return "{\"success\":" + b + "}";

        }else{
            return  "{\"error\":" + overAmount + "}";
        }

    }

    @GetMapping(value = "/cartTotal",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String cartTotal(HttpSession session,Integer[] cartId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());


        Map<String, Object> total = cartService.getTotal(userId, cartId);
        return JSON.toJSONString(total);
    }

    @GetMapping(value = "/updateAmount",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateAmount(HttpSession session,Integer productId,String color,String action,Integer cartId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        boolean b = cartService.updateAmount(action, userId, color, productId, cartId);
        return "{\"success\":"+b+"}";

    }
    @GetMapping(value = "/cart/delete",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteCart(HttpSession session,Integer productId,String color){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        boolean b = cartService.deleteCart(userId, color, productId);
        return "{\"success\":"+b+"}";
    }

    @GetMapping("/checkout")
    public String checkout(HttpSession session,Integer[] cartId,Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        List<Map<String, Object>> addressList = addressService.getAddress(userId);

        List<Map<String, Object>> productList = cartService.getProducts4Checkout(userId, cartId);
        Map<String, Object> total = cartService.getTotal(userId, cartId);

        model.addAttribute("addressList",addressList);
        model.addAttribute("productList",productList);
        model.addAttribute("total",total);

        return "order";
    }

}
