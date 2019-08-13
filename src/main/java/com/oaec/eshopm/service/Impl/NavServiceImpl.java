package com.oaec.eshopm.service.Impl;

import com.alibaba.fastjson.JSON;
import com.oaec.eshopm.mapper.BrandMapper;
import com.oaec.eshopm.mapper.ProductMapper;
import com.oaec.eshopm.mapper.TypeMapper;
import com.oaec.eshopm.service.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("navService")
public class NavServiceImpl implements NavService {
    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private BrandMapper brandMapper;
    @Autowired
    private TypeMapper typeMapper;
    @Override
    public List<Map<String, Object>> getNav() {
        List<Map<String, Object>> typeMaps = typeMapper.queryNav();
        System.out.println(JSON.toJSONString(typeMaps));
        for (Map<String, Object> typeMap : typeMaps) {
            int type_id = Integer.parseInt(typeMap.get("type_id").toString());
            Map<String, Object> map = new HashMap<>();
            map.put("typeId",type_id);
            List<Map<String, Object>> products = productMapper.query(map);
            typeMap.put("products",products);
            List<Map<String, Object>> brands = brandMapper.query(type_id);
            typeMap.put("brands",brands);
        }
        return typeMaps;
    }
}
