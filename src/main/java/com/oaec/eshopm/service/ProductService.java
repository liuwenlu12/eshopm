package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
    List<Map<String,Object>> query(String name, Integer brandId, Integer  typeId, Integer saleDesc,Integer saleUp,Integer priceDesc,Integer priceUp,Integer page);

    List<Map<String,Object>>  queryNew();

    List<Map<String,Object>>  getLowPrice();

    List<Map<String,Object>>  queryHot();

    List<Map<String,Object>> getProduct4Buy(Integer productId,String color);
/*
    List<Map<String,Object>> Rank(String name, Integer brandId, Integer  typeId, Integer saleDesc,Integer saleUp,Integer priceDesc,Integer priceUp);
*/
    Map<String,Object> getDetail(Integer productId);
    List<Map<String,Object>>  queryLowPrice();
    Boolean Appraise(Integer userId,String content,Integer productId,Integer detailId);
    List<Map<String,Object>> getAppraise(Integer productId);

    Map<String,Object>  getTotal4Buy(Double price,Double old_price,Integer amount);


}
