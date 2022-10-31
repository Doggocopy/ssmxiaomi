package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.AdminMapper;
import com.ryan.ssm.pojo.Admin;
import com.ryan.ssm.pojo.AdminExample;
import com.ryan.ssm.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 22:32
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public String login(String name, String pwd) {
        //返回值
        String flag = "no";
        AdminExample adminExample = new AdminExample();
        //将用户名封装到查询对象中
        adminExample.createCriteria().andANameEqualTo(name);
        List<Admin> adminList = adminMapper.selectByExample(adminExample);
        //判断
        if (adminList.size()>0 && adminList!=null){
            //获取集合中的数据
            Admin admin = adminList.get(0);//因为管理员只设置了一个且不可以注册所以直接取值就行
            //校验密码
            if (pwd.equals(admin.getaPass())){
                flag = "ok";
            }
        }
        return flag;
    }
}
