package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.CarshopMapper;
import com.ryan.ssm.pojo.Carshop;
import com.ryan.ssm.service.CarshopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 11:28
 * @Description: TODO
 * @Version: 1.0
 */
@Service
public class CarshopServiceImpl implements CarshopService {
    @Autowired
    private CarshopMapper carshopMapper;
    @Override
    public int save(Carshop carshop) {
        int num = 0;//返回值
        //查询购物车中是否有这个商品
        Carshop car = carshopMapper.selectUidPid(carshop);
        if (car==null){
            //购物车中没有这个商品
            carshop.setNumbers(1);
            num = carshopMapper.insert(carshop);
        }else {
            //该商品至少存在一件
            car.setNumbers(car.getNumbers()+1);
            //已经存在应该修改数量
            num = carshopMapper.updateByPrimaryKey(car);
        }
        return num;
    }

    @Override
    public List<Carshop> getCarshopInfo(Integer uid) {
        List<Carshop> list = carshopMapper.selectProductInfoCarShop(uid);
        return list;
    }

    @Override
    public void delete(Integer cid) {
        carshopMapper.deleteByPrimaryKey(cid);
    }
}
