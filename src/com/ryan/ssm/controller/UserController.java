package com.ryan.ssm.controller;

import com.ryan.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 21:23
 * @Description: 用户登录控制器
 * @Version: 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    //login.action
    @RequestMapping("/login.action")
    public String login(String uname, String upass, String yzm, HttpSession session){
        //对比验证码
        String sessionYanZhengma = (String) session.getAttribute("random");
        if (!yzm.equals(sessionYanZhengma)){
            session.setAttribute("msg","您输入的验证码有误");
            return "redirect:/login.jsp";
        }
        Map<String,Object> map = userService.login(uname,upass);
        if ("ok".equals(map.get("s"))){
            //存储
            session.setAttribute("user",map.get("user"));
            return "redirect:/prod/show5.action";
        }else {
            session.setAttribute("msg","您输入的用户名或密码有误");
            return "redirect:/login.jsp";
        }
    }
}
