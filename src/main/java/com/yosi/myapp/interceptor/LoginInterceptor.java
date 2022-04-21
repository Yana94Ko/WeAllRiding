package com.yosi.myapp.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;
import java.util.List;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    public List<String> needLogin
            = Arrays.asList("/courseCreate", "/riding/myRidingList", "/riding/ridingStateOk", "/riding/ridingWrite", "/shopWrite", "/member/memberEdit","/riding/ridingMemberCan", "/riding/ridingMemberOk");
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String userId = (String)request.getSession().getAttribute("userId");
        if (userId != null) {
            return true;
        } else {
            String destUri = request.getRequestURI();
            String destQuery = request.getQueryString();
            String dest = (destQuery == null) ? destUri : destUri+"?"+destQuery;
            request.getSession().setAttribute("dest", dest);

            response.sendRedirect("/member/loginForm");
            return false;
        }
    }
}
