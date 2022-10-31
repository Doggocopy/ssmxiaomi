package com.ryan.ssm.service;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 22:23
 * @Description: TODO
 * @Version: 1.0
 */
public interface AdminService {
    /**
     * 登录方法
     * @param name
     * @param pwd
     * @return
     */
    public String login(String name, String pwd);
}
