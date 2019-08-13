package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.PropertyMapper;
import com.oaec.eshopm.service.PropertyService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service("propertyService")
public class PropertyServiceImpl implements PropertyService {
    @Autowired
    private PropertyMapper propertyMapper;

    @Override
    public Map<String, Object> getInventory(@Param("color") String color,@Param("productId") Integer productId) {
        return propertyMapper.queryByColorAndProductId(color,productId);
    }
}
