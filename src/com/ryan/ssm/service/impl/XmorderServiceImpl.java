package com.ryan.ssm.service.impl;

import com.ryan.ssm.mapper.OrderdetailMapper;
import com.ryan.ssm.mapper.ProductInfoMapper;
import com.ryan.ssm.mapper.XmorderMapper;
import com.ryan.ssm.pojo.Carshop;
import com.ryan.ssm.pojo.Orderdetail;
import com.ryan.ssm.pojo.ProductInfo;
import com.ryan.ssm.pojo.Xmorder;
import com.ryan.ssm.service.XmorderService;
import com.sun.tools.corba.se.idl.constExpr.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.service.impl
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-20 23:39
 * @Description: TODO
 * @Version: 1.0
 */
@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.REPEATABLE_READ )
public class XmorderServiceImpl implements XmorderService {
    @Autowired
    private XmorderMapper xmorderMapper;
    @Autowired
    private OrderdetailMapper orderdetailMapper;
    @Autowired
    private ProductInfoMapper productInfoMapper;
    @Override
    public int save(Xmorder order, String[] pids, List<Carshop> carlist) throws Exception{
        int num =0;
        xmorderMapper.insert(order);
        //需要获取商品
        for (String pidd:pids){
            for (Carshop c:carlist){
                int pid = Integer.parseInt(pidd);
                //进行比对
                if (c.getProd().getpId()==pid){
                    //购物车中有下单的商品
                    if (c.getProd().getpNumber()<c.getNumbers()){
                        //购物车中的要买的商品数量大于商品库存数量
                        throw new Exception();
                    }
                    //数量没问题
                    Orderdetail od = new Orderdetail();//订单明细
                    od.setPid(c.getProd().getpId());//商品id
                    od.setOid(order.getOid());//订单明细隶属于那个订单
                    od.setPtotal(c.getProd().getpPrice()*c.getNumbers()*1.0);
                    od.setPnumber(c.getNumbers());
                    //添加订单明细
                    orderdetailMapper.insert(od);
                    //添加成功减库存
                    ProductInfo prod = c.getProd();
                    prod.setpNumber(prod.getpNumber()-c.getNumbers());
                    //更新数据
                    productInfoMapper.updateByPrimaryKey(prod);
                }
            }
        }
        num =1;
        return num;
    }
}
