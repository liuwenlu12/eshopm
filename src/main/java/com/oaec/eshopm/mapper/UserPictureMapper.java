package com.oaec.eshopm.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface UserPictureMapper {

    Map<String,Object> queryByUserId(@Param("userId") Integer userId);

    Boolean doInsert(Map<String,Object> param);

    Boolean doUpdate(Map<String,Object> param);
}
