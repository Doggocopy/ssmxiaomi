package com.ryan.ssm.service;

import com.ryan.ssm.pojo.Carshop;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 11:27
 * @Description: 购物车的业务逻辑接口
 * @Version: 1.0
 */
public interface CarshopService {
    //添加商品到购物车
    public int save(Carshop carshop);
    //查询购物车中的商品
    public List<Carshop> getCarshopInfo(Integer uid);

    public void delete(Integer cid);
}
