package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface BrandMapper {
    List<Map<String,Object>> query(@Param("typeId") Integer typeId);

    Map<String,Object> queryByBrandId(@Param("brandId") Integer brandId);
}
