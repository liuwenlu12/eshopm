package com.oaec.eshopm.service;

import java.util.List;
import java.util.Map;

public interface PersonalService {

    List<Map<String,Object>> getAddress(Integer userId);
    Map<String,Object> getUser(Integer userId);

    Double getOrderDetailPrice(Integer orderId);
}
