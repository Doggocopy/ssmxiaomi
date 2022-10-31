package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.ProductTypeMapper;
import com.ryan.ssm.pojo.ProductType;
import com.ryan.ssm.pojo.ProductTypeExample;
import com.ryan.ssm.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 23:10
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService {
    @Autowired
    private ProductTypeMapper productTypeMapper;
    @Override
    public List<ProductType> getAll() {
        //因为需要参数 所以new一个空对象 表示查询所有
        return productTypeMapper.selectByExample(new ProductTypeExample());
    }


}
