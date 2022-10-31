package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.AddressMapper;
import com.ryan.ssm.pojo.Address;
import com.ryan.ssm.pojo.AddressExample;
import com.ryan.ssm.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 22:51
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Override //查看所有地址
    public List<Address> selectAll(Integer uid) {
        List<Address> list = addressMapper.selectByExample(new AddressExample());
        return list;
    }

    @Override
    public Integer save(Address address) {
        return addressMapper.insert(address);
    }
}
