package com.ryan.ssm.service;

import com.github.pagehelper.PageInfo;
import com.ryan.ssm.pojo.ProductInfo;
import com.ryan.ssm.pojo.vo.ProductVo;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 22:50
 * @Description: TODO
 * @Version: 1.0
 */
public interface ProductInfoService {
    public PageInfo split(Integer page, int pageSize);

    public void deleteById(Integer id);

    /**
     * 多条件组合查询+分页
     * @param vo
     * @param pageSize
     * @return
     */
    PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize);

    //首页显示的五条数据
    PageInfo splitPage(int page, int pageSize);

    ProductInfo getProductInfoById(Integer pid);
}
