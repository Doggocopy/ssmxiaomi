package com.ryan.ssm.service;

import com.ryan.ssm.pojo.ProductType;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 22:50
 * @Description: TODO
 * @Version: 1.0
 */
public interface ProductTypeService {
    /**
     * 查询全部的分类
     * @return
     */
    public List<ProductType> getAll();


}
