package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PictureMapper {

    List<Map<String, Object>> queryByProductId(@Param("productId") Integer productId);
}
