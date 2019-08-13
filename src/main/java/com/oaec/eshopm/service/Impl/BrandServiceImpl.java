package com.oaec.eshopm.service.Impl;

import com.oaec.eshopm.mapper.BrandMapper;
import com.oaec.eshopm.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("brandService")
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandMapper brandMapper;
    @Override
    public List<Map<String, Object>> query(Integer typeId) {

        return brandMapper.query(typeId);
    }
}
