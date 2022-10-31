package com.ryan.ssm.service;

import com.ryan.ssm.pojo.Address;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 22:50
 * @Description: 地址的业务逻辑接口
 * @Version: 1.0
 */
public interface AddressService {
    public List<Address> selectAll(Integer uid);

    //添加地址
    Integer save(Address address);
}
