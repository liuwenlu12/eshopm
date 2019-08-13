package com.oaec.eshopm.interceptors;

import com.oaec.eshopm.service.NavService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

@Component
public class NavInterceptor implements HandlerInterceptor {

    @Autowired
    private NavService navService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        List<Map<String, Object>> nav = navService.getNav();
        request.setAttribute("nav",nav);
        return true;
    }
}
