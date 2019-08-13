package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface ProductMapper {



    List<Map<String,Object>> query(Map<String,Object> param);

    List<Map<String,Object>>  queryRankListByParam(Map<String,Object> param);

    List<Map<String,Object>>   queryBySales();


    Map<String,Object> queryByProductId(@Param("productId") Integer productId);

    List<Map<String,Object>> queryTypeByProductId(@Param("productId") Integer productId);


    List<Map<String,Object>> queryByAddTime();

    List<Map<String,Object>> queryByPriceAndOldPrice();

    /*int updateInventoryAndSalesVolume(@Param("productId") Integer productId,@Param("amount") Integer amount,@Param("color") String color);*/

    Map<String,Object> queryAppraiseByUserIdANDProductId(@Param("userId") Integer userId,@Param("productId") Integer productId);



    int doInsertAppraise(@Param("productId") Integer productId,@Param("userId") Integer userId,@Param("detailId") Integer detailId);


    List<Map<String,Object>> queryAppraiseByProductIdAndUserId(@Param("productId") Integer productId,@Param("userId") Integer userId);

    List<Map<String,Object>> queryByPrice();

    List<Map<String,Object>> queryProduct4buy(Map<String,Object> param);

    int updateSalesVolume(@Param("amount") Integer amount,@Param("productId") Integer productId);
}
