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
 * @Description: ��½������
 * @Version: 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
    //ִ��֮ǰ��������
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("user")!=null){
            //�Ѿ���½����
            return true;
        }else {
            //û�е�½�������� ��ת����¼����
            response.sendRedirect(request.getContextPath()+"/login.jsp");
            return false;
        }
    }
    //�������������
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }
    //ִ�����֮���������
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
