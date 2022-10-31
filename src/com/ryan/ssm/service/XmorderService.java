package com.ryan.ssm.service;

import com.ryan.ssm.pojo.Carshop;
import com.ryan.ssm.pojo.Xmorder;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 23:39
 * @Description: 订单业务逻辑
 * @Version: 1.0
 */
public interface XmorderService {
    //添加订单到 订单表 和 订单明细表
    int save(Xmorder order, String[] pids, List<Carshop> carlist) throws Exception;
}
