package com.oaec.eshopm.controller;

import com.oaec.eshopm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class AddressController {
    @Autowired
    private AddressService addressservice;

    @GetMapping(value = "/addAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String addAddress(HttpSession session, String name, String address, String telNumber){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        Boolean insert = addressservice.doInsert(name, telNumber, address, userId);
        return "{\"success\":"+insert+"}";
    }

    @GetMapping(value = "/updateAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateAddress(HttpSession session,Integer addressId ,String name, String address, String telNumber){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        Boolean update = addressservice.doUpdate(userId, address, telNumber, name, addressId);
        return "{\"success\":"+update+"}";
    }

    @GetMapping(value = "/deleteAddress",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String deleteAddress(HttpSession session,Integer addressId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        Boolean delete = addressservice.doDelete(addressId, userId);
        return "{\"success\":"+delete+"}";
    }

}
