package com.ryan.ssm.controller;

import com.ryan.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 21:24
 * @Description: TODO
 * @Version: 1.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    // /admin/login.action
    @Autowired
    private AdminService adminService;
    @RequestMapping("/login.action")
    public String login(String name, String pwd, Model model){
        String login = adminService.login(name,pwd);
        if ("ok".equals(login)){
            //向前端传递键值对
            model.addAttribute("adminName",name);
            //成功
            return "main";
        }else {
            model.addAttribute("errmsg","用户名或密码错误");
            //失败返回登录页面
            return "login";
        }
    }
}
