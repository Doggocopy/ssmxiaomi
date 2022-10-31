package com.ryan.ssm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.interceptor
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-23 23:33
 * @Description: 登陆拦截器
 * @Version: 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
    //执行之前进行拦截
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("user")!=null){
            //已经登陆过了
            return true;
        }else {
            //没有登陆进行拦截 跳转到登录界面
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }
    }
    //处理过程中拦截
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
    //执行完毕之后进行拦截
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
