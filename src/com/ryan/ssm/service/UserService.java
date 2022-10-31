package com.ryan.ssm.service;

import java.util.Map;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 21:24
 * @Description: TODO
 * @Version: 1.0
 */
public interface UserService {
    Map<String, Object> login(String uname, String upass);
}
