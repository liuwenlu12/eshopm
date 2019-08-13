package com.oaec.eshopm.controller;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.service.OrderService;
import com.oaec.eshopm.service.PersonalService;
import com.oaec.eshopm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private PersonalService personalService;

    @GetMapping("/ok")
    public String ok(){
        return "ok";
    }

    @GetMapping(value = "/submit",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String submit(HttpSession session,Integer addressId,String payment,String logistics, Integer[] productId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        boolean submit = orderService.submit(userId, addressId,payment,logistics, productId);
        return "{\"success\":"+submit+"}";

    }

    @GetMapping(value = "/order/changeStatus",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String changeOrderStatus(HttpSession session,Integer orderId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        boolean b = orderService.changeOrderStatus(userId, orderId);
        return "{\"success\":"+b+"}";
    }

    @GetMapping("/appraise")
    public String appraise(Integer detailId, Model model){
        Map<String, Object> detailMap = orderService.getDetailByDetailId(detailId);
        model.addAttribute("detailMap",detailMap);
        return "myprod";

    }
    @PostMapping(value = "/appraise",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String appraise(HttpSession session,Integer detailId,String content){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        Map<String, Object> detailMap = orderService.getDetailByDetailId(detailId);
        int productId = Integer.parseInt(detailMap.get("product_id").toString());
        Boolean appraise = productService.Appraise(userId, content, productId, detailId);
         return  "{\"success\":"+appraise+"}";
    }

    @GetMapping("/orderDetail")
    public String orderDetail(HttpSession session,Integer orderId,Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        List<Map<String, Object>> orderDetailList = orderService.getOrderDetail(userId, orderId);
        Double orderDetailPrice = personalService.getOrderDetailPrice(orderId);
        model.addAttribute("orderDetailList",orderDetailList);
        model.addAttribute("orderDetailPrice",orderDetailPrice);
        return "orderxq";
    }


    @GetMapping(value = "/submit/buy",produces = "application/json;charset=utf-8")
    @ResponseBody
    public String submit2buy(HttpSession session,Integer addressId,String payment,String logistics,String name ,String img_url,Double price,Integer amount,String color,Integer productId){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());
        System.out.println("aaaa啊啊啊啊啊啊"+JSON.toJSONString(productId));

        Boolean submit4buy = orderService.submit4buy(userId, addressId, payment, logistics, name , img_url, price, amount, color, productId);
        return "{\"success\":"+submit4buy+"}";

    }

}
