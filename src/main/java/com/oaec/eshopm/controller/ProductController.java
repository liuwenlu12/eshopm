package com.oaec.eshopm.controller;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.oaec.eshopm.mapper.PropertyMapper;
import com.oaec.eshopm.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private DetailService detailService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private PropertyService propertyService;
    @Autowired
    private AddressService addressService;
    @GetMapping("/list")
    public String list(String name, Integer brandId, Integer  typeId, Integer saleDesc,Integer saleUp,Integer priceDesc,Integer priceUp,@RequestParam(required = false,defaultValue = "1") Integer page, Model model){

        List<Map<String,Object>>  products  = productService.query(name, brandId, typeId,saleDesc,saleUp,priceDesc,priceUp,page);

        List<Map<String, Object>> brands = brandService.query(typeId);
        model.addAttribute("brands",brands);
        model.addAttribute("products",products);
        if(products instanceof Page){
            Page productPage = (Page)products;
            int pageNum = productPage.getPageNum();
            System.out.println("pageNum = " + pageNum);
            int pages = productPage.getPages();
            System.out.println("pages = " + pages);
            model.addAttribute("pageNum",pageNum);
            model.addAttribute("pages",pages);
        }
        return "zbproList";
    }
    @GetMapping("/index")
    public String index(Model model){
        List<Map<String, Object>> hot = productService.queryHot();
        List<Map<String, Object>> lowPrice = productService.queryLowPrice();
        List<Map<String, Object>> newProduct = productService.queryNew();
        model.addAttribute("hot",hot);
        model.addAttribute("lowPrice",lowPrice);
        model.addAttribute("newProduct",newProduct);
        return "index";
    }
    @GetMapping("/detail")
    public String detail(Integer productId,Model model){
        Map<String, Object> detail = productService.getDetail(productId);
        List<Map<String, Object>> productLick = detailService.getTypeLickProduct(productId);
        List<Map<String, Object>> appraiseList = productService.getAppraise(productId);
        model.addAttribute("appraiseList",appraiseList);
        model.addAttribute("detail",detail);
        model.addAttribute("productLick",productLick);

        return "proDetail";
    }

    @GetMapping(value = "/inventory" ,produces = "application/json;charset=utf-8")
    @ResponseBody
    public String inventory(String color,Integer productId){
        Map<String, Object> inventory = propertyService.getInventory(color, productId);
        Map<Object, Object> map = new HashMap<>();
        map.put("inventory",inventory);
        return JSON.toJSONString(map);
    }

    @GetMapping("/buy")
    public String checkout(HttpSession session,Integer productId,Integer amount,String color, Model model){
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int userId  = Integer.parseInt(user.get("user_id").toString());

        List<Map<String, Object>> addressList = addressService.getAddress(userId);

        List<Map<String,Object>> productList = productService.getProduct4Buy(productId, color);
        Double price = null;
        Double old_price = null;
        for (Map<String, Object> map : productList) {
             price = Double.parseDouble(map.get("price").toString());
            old_price = Double.parseDouble(map.get("old_price").toString());
            map.put("amount",amount);
        }
        System.out.println(JSON.toJSONString(productList));
        Map<String, Object> total = productService.getTotal4Buy(price,old_price, amount);
        model.addAttribute("addressList",addressList);
        model.addAttribute("productList",productList);
        model.addAttribute("total",total);
        return "order";
    }


}
