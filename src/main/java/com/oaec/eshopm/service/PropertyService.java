package com.oaec.eshopm.service;

import java.util.Map;

public interface PropertyService {
    Map<String,Object> getInventory(String color, Integer productId);
}
