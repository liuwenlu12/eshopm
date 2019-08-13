package com.oaec.eshopm.controller;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.service.OrderService;
import com.oaec.eshopm.service.PersonalService;
import com.oaec.eshopm.service.UserService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class PersonalCenterController {
    @Autowired
    private PersonalService personalService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/personalCenter")
    public String personalCenter(HttpSession session,Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        Integer countOrder = orderService.getCountOrder(userId);
        Integer countOrderNoConfirm = orderService.getCountOrderNoConfirm(userId);
        Integer countOrderNoAppraise = orderService.getCountOrderNoAppraise(userId);
        Map<String, Object> userAccountPicture = userService.getUserAccountPicture(userId);
        model.addAttribute("userAccountPicture",userAccountPicture);
        model.addAttribute("countOrder",countOrder);
        model.addAttribute("countOrderNoConfirm",countOrderNoConfirm);
        model.addAttribute("countOrderNoAppraise",countOrderNoAppraise);
        return "mygxin";
    }

    @GetMapping("/address")
    public String address(HttpSession session, Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        List<Map<String, Object>> addressList = personalService.getAddress(userId);
        model.addAttribute("addressList",addressList);
        return "address";
    }

    @GetMapping("/updatePassWord")
    public String updatePassWord(){
        return "remima";
    }
    @PostMapping(value = "/updatePassWord",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String updatePassWord(HttpSession session,String password,String telNumber,String newPassWord){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        Map<String, Object> updatePassWord = userService.updatePassWord(userId, password, telNumber, newPassWord);
        Map<String, Object> json = new HashMap<>();
        if(updatePassWord.containsKey("success")){
            json.put("result",true);
        }else{
            Object error = updatePassWord.get("error");
            json.put("result",false);
            json.put("error",error);
        }
        return JSON.toJSONString(json);
    }

    @GetMapping("personalOrder")
    public String personalOrder(HttpSession session,Integer isConfirm,Integer isAppraise,Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> ordersList = orderService.getOrders(userId,isConfirm,isAppraise);
        model.addAttribute("ordersList",ordersList);
        return "myorderq";
    }

    @GetMapping("personalDetails")
    public String personalDetails(HttpSession session,Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> userAccountPicture = userService.getUserAccountPicture(userId);
        model.addAttribute("userAccountPicture",userAccountPicture);
        return "mygrxx";
    }

    @PostMapping("/upload")

    public  String upload(HttpServletRequest request,HttpSession session, MultipartFile file,Model model) throws IOException {
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        String filename = file.getOriginalFilename();
        InputStream is = file.getInputStream();

        UUID uuid =  UUID.randomUUID();

        String realPath = request.getServletContext().getRealPath("/static/images/userPicture");
        String name = uuid+filename.substring(filename.lastIndexOf("."));
        System.out.println("name = " + name);


        String img_url = "static/images/userPicture/"+name;
        userService.UpdateUserAccountPicture(userId,img_url);


        Map<String, Object> userAccountPicture = userService.getUserAccountPicture(userId);
        System.out.println(JSON.toJSONString(userAccountPicture));
        model.addAttribute("userAccountPicture",userAccountPicture);

        File saveFile = new File(realPath + File.separator + uuid+filename.substring(filename.lastIndexOf(".")));
        File parentFile = saveFile.getParentFile();
        if(!parentFile.exists()){
            parentFile.mkdirs();
        }
        FileOutputStream os = new FileOutputStream(saveFile);
        IOUtils.copy(is,os);
        os.close();
        is.close();

        return "mygrxx";

    }
}
