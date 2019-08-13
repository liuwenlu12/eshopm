package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface TypeMapper {
    List<Map<String,Object>> queryNav();

    Map<String,Object> queryByTypeId(@Param("typeId") Integer typeId);
}
