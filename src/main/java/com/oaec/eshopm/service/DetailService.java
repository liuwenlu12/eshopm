package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface DetailService {
    List<Map<String,Object>> getTypeLickProduct(Integer productId);
}
