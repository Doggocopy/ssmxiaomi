package com.ryan.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ryan.ssm.mapper.ProductInfoMapper;
import com.ryan.ssm.pojo.ProductInfo;
import com.ryan.ssm.pojo.ProductInfoExample;
import com.ryan.ssm.pojo.vo.ProductVo;
import com.ryan.ssm.service.ProductInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 23:15
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class ProductInfoServiceImpl implements ProductInfoService {
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Override
    public PageInfo split(Integer page, int pageSize) {
        //对商品进行分页
        ProductInfoExample example = new ProductInfoExample();
        //注意设置起始页 每页显示几条数据
        PageHelper.startPage(page,pageSize);
        //查询数据
        List<ProductInfo> list = productInfoMapper.selectByExample(example);
        PageInfo<ProductInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public void deleteById(Integer id) {
        productInfoMapper.deleteByPrimaryKey(id);
    }

    /**
     * 多条件组合查询+分页
     * @param vo
     * @param pageSize
     * @return
     */
    @Override
    public PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize) {
        //获取集合数据前 需要先进行设置
        PageHelper.startPage(vo.getPage(),pageSize);
        //多条件组合查询方法
        List<ProductInfo> list = productInfoMapper.selectConditionSplitPage(vo);
        //将集合给分页类
        PageInfo<ProductInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    //目前这个方法没有调用
    @Override
    public PageInfo splitPage(int page, int pageSize) {
        //对商品进行分页
        ProductInfoExample example = new ProductInfoExample();
        //注意设置起始页 每页显示几条数据
        PageHelper.startPage(page,pageSize);
        //查询数据
        List<ProductInfo> list = productInfoMapper.selectByExample(example);
        PageInfo<ProductInfo> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public ProductInfo getProductInfoById(Integer pid) {
        ProductInfo productInfo = productInfoMapper.selectByPrimaryKey(pid);
        return productInfo;
    }
}
