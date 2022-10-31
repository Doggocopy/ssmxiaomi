package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.UsersMapper;
import com.ryan.ssm.pojo.Users;
import com.ryan.ssm.pojo.UsersExample;
import com.ryan.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 22:08
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UsersMapper usersMapper;
    @Override
    public Map<String, Object> login(String uname, String upass) {
        Map<String,Object> map = new HashMap<>();
        String s = "";
        UsersExample example = new UsersExample();
        example.createCriteria().andUnameEqualTo(uname);
        List<Users> list = usersMapper.selectByExample(example);
        if (list.size()>0 && list!=null){
            Users users = list.get(0);
            if (users.getUpass().equals(upass)){
                //判断数据库中状态 为1正常
                if (users.getUstatus()==1){
                    s="ok";
                    //session.setAttribute("user",map.get("user"));
                    map.put("user",users);
                }else {
                    s="请联络管理员";
                }
            }else {
                s = "用户名或者密码错误";
            }
        }
        map.put("s",s);
        return map;
    }
}
