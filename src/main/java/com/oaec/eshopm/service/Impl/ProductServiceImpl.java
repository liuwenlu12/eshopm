package com.oaec.eshopm.service.Impl;

import com.github.pagehelper.PageHelper;
import com.oaec.eshopm.mapper.*;
import com.oaec.eshopm.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private PropertyMapper propertyMapper;
    @Autowired
    private BrandMapper brandMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Autowired
    private PictureMapper pictureMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public List<Map<String, Object>> query(String name, Integer brandId, Integer  typeId, Integer saleDesc,Integer saleUp,Integer priceDesc,Integer priceUp,Integer page) {
        Map<String, Object> param = new HashMap<>();
        param.put("name",name);
        param.put("typeId",typeId);
        param.put("brandId",brandId);
        param.put("saleDesc",saleDesc);
        param.put("saleUp",saleUp);
        param.put("priceDesc",priceDesc);
        param.put("priceUp",priceUp);
        PageHelper.startPage(page,4);
        List<Map<String, Object>> products = productMapper.query(param);
        return products;
    }

    @Override
    public List<Map<String, Object>> queryNew() {
        return productMapper.queryByAddTime();
    }

    @Override
    public List<Map<String, Object>> getLowPrice() {
        return productMapper.queryByPrice();
    }

    @Override
    public List<Map<String, Object>> queryHot() {
        return productMapper.queryBySales();
    }

    @Override
    public  List<Map<String,Object>> getProduct4Buy(Integer productId,String color) {
        Map<String, Object> param = new HashMap<>();
        param.put("productId",productId);
        param.put("color",color);
        return productMapper.queryProduct4buy(param);
    }

    /*@Override
    public List<Map<String, Object>> Rank(Map<String,Object> param) {
        Integer page = Integer.parseInt(param.get("page").toString());
        PageHelper.startPage(page,4);
        return productMapper.queryRankListByParam(param);
    }*/

    @Override
    public Map<String, Object> getDetail(Integer productId) {
        Map<String, Object> detail = productMapper.queryByProductId(productId);
        Integer brand_id = Integer.parseInt(detail.get("brand_id").toString());
        Integer type_id = Integer.parseInt(detail.get("type_id").toString());
        Integer product_id = Integer.parseInt(detail.get("product_id").toString());
        List<Map<String, Object>> property = propertyMapper.queryByProductId(product_id);
        List<Map<String, Object>> picture = pictureMapper.queryByProductId(product_id);

        Map<String, Object> brand = brandMapper.queryByBrandId(brand_id);
        Map<String, Object> type = typeMapper.queryByTypeId(type_id);

        detail.put("brand",brand);
        detail.put("type",type);
        detail.put("property",property);
        detail.put("picture",picture);
        return  detail;
    }

    @Override
    public List<Map<String, Object>> queryLowPrice() {
        return productMapper.queryByPriceAndOldPrice();
    }

    @Override
    public Boolean Appraise(Integer userId, String content, Integer productId, Integer detailId) {
        Map<String, Object> map = productMapper.queryAppraiseByUserIdANDProductId(userId, productId);
        if(map==null){
             productMapper.doInsertAppraise(productId, userId, detailId);
        }
        int i = orderMapper.updateOrderDetail(content, detailId);
        if(i==1){
            if(orderMapper.doUpdateDetailStatus(detailId)==1){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> getAppraise(Integer productId) {
        List<Map<String, Object>> userIdList = userMapper.queryAllUserId();
        List<Map<String,Object>> appraiseList = new ArrayList<>();
        for (Map<String, Object> userIdMap : userIdList) {
            int userId1 = Integer.parseInt(userIdMap.get("user_id").toString());
            List<Map<String, Object>> maps = productMapper.queryAppraiseByProductIdAndUserId(productId, userId1);
            for (Map<String, Object> map : maps) {
                appraiseList.add(map);
            }

        }
        return appraiseList;
    }

    @Override
    public Map<String,Object>  getTotal4Buy(Double price, Double old_price,Integer amount) {
        Map<String, Object> map = new HashMap<>();
        map.put("total_discounts",old_price*amount-price*amount);
        map.put("total_price", price*amount);
        return map;
    }
}
