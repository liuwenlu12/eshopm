package com.oaec.eshopm.interceptors;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if(session.getAttribute("user")==null){
            if(isAjax(request)){
                response.setContentType("application/json;charset=utf-8");
                PrintWriter writer = response.getWriter();
                writer.println("{\"isLogin\":false}");
                writer.close();
                return false;
            }
            response.sendRedirect(request.getContextPath()+"/login");
            return false;
        }
        return true;
    }


    private boolean isAjax(HttpServletRequest request){
        String header = request.getHeader("X-Requested-With");
        if(header!=null && header.equals("XMLHttpRequest")){
            return true;
        }else{
            return false;
        }
    }
}
