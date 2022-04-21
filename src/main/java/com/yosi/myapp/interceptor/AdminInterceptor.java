package com.yosi.myapp.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

@Component
public class AdminInterceptor implements HandlerInterceptor {
    public String onlyAdmin = "/admin/**";
    public List<String> exPatterns
            = Arrays.asList("/admin/availableRiding", "/admin/todayRiding", "/admin/availableCourse");
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler) throws Exception {
        String isAdmin = (String)request.getSession().getAttribute("isAdmin") == null ? "0" : (String)request.getSession().getAttribute("isAdmin");
        if(isAdmin.equals("1")){
            return true;
        } else {
            response.sendRedirect("/");
            return false;
        }
    }
}
