package com.oaec.eshopm.controller;


import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @PostMapping(value = "/login",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String login(HttpSession session, String username, String password){
        Map<String, Object> loginMap = userService.login(username, password);
        Map<String, Object> json = new HashMap<>();
        if (loginMap.containsKey("username")) {
            session.setAttribute("user", loginMap.get("user"));
            json.put("result", true);
        } else {
            Object error = loginMap.get("error");
            json.put("result", false);
            json.put("error", error);
        }
        return JSON.toJSONString(json);
    }
    @GetMapping("/logout")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }
    @PostMapping(value = "/register",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String register(String username,String password,String telNumber){
        Map<String, Object> register = userService.register(username, password, telNumber);
        Map<String, Object> json = new HashMap<>();
        if (register.containsKey("success")) {
            json.put("result", true);
            System.out.println();
        } else {
            Object error = register.get("error");
            json.put("result", false);
            json.put("error", error);
        }
        return JSON.toJSONString(json);
    }

    @GetMapping("/forget")
    public String forget(){
        return "forget";
    }
    @PostMapping(value = "/findName",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findName(String username){
        Boolean userName = userService.getUserName(username);
        return "{\"success\":"+userName+"}";
    }

    @PostMapping(value = "/findTelNumber",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findTelNumber(String username,String telNumber){
        Boolean tel = userService.getTelNumber(username, telNumber);
        return "{\"success\":"+tel+"}";
    }


    @PostMapping(value = "/updateForgetPassWord",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updateForgetPassWord(String username,String password){
        Boolean forgetPassWord = userService.forgetPassWord(username, password);
        return "{\"success\":"+forgetPassWord+"}";
    }

}
