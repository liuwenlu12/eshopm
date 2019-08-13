package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.ProductMapper;
import com.oaec.eshopm.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("detailService")
public class DetailServiceImpl implements DetailService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> getTypeLickProduct(Integer productId) {
        return productMapper.queryTypeByProductId(productId);
    }
}
