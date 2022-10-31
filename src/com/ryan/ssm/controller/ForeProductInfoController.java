package com.ryan.ssm.controller;

import com.ryan.ssm.pojo.*;
import com.ryan.ssm.service.AddressService;
import com.ryan.ssm.service.CarshopService;
import com.ryan.ssm.service.ProductInfoService;
import com.ryan.ssm.service.XmorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 21:10
 * @Description: 用户前台的控制器
 * @Version: 1.0
 */
@Controller
@RequestMapping("/fore")
public class ForeProductInfoController {
    //注入
    @Autowired
    private ProductInfoService productInfoService;
    @Autowired
    private CarshopService carshopService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private XmorderService xmorderService;
    //fore/detailOne.action
    @RequestMapping("/detailOne.action")
    public String detailOne(Integer pid, Model model){
        //prod.pName
        //根据pid查询商品
        ProductInfo productInfo = productInfoService.getProductInfoById(pid);
        model.addAttribute("prod",productInfo);

        return "forward:/productdetail.jsp";
    }
    //添加购物车商品数据 carShop.action?pid
    @RequestMapping("/carShop.action")
    public String carShop(Integer pid, HttpSession session){
        //获取用户
        Integer uid = ((Users) session.getAttribute("user")).getUid();
        //构建购物车对象
        Carshop carshop = new Carshop();
        carshop.setPid(pid);
        carshop.setUid(uid);
        //添加购物车
        int num = carshopService.save(carshop);
        if (num>0){
            //添加购物车成功
            return "redirect:/fore/showCarShop.action";//展示购物车的数据
        }else {
            session.setAttribute("carshoperr","购物车添加失败了");
            return "redirect:/productdetail.jsp";
        }
    }

    /**
     * 查看购物车中的商品
     * @param session
     * @return
     */
    @RequestMapping("/showCarShop.action")
    public String showCarShop(HttpSession session){
        //获取用户的id
        Integer uid = ((Users) session.getAttribute("user")).getUid();
        //查看当前用户的购物车中的商品
        List<Carshop> list = carshopService.getCarshopInfo(uid);
        session.setAttribute("carlist",list);
        return "redirect:/carshop.jsp";
    }
    //fore/showAddress.action
    @RequestMapping("/showAddress.action")
    public void showAddress(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        //获取所有地址
        List<Address> list = addressService.selectAll(users.getUid());
        request.setAttribute("addressList",list);
        try {
            request.getRequestDispatcher("/jiesuan.jsp").forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    //fore/delete.action
    @RequestMapping("/delete.action")
    public String delete(Integer cid){
        carshopService.delete(cid);
        return "redirect:/fore/showCarShop.action";
    }
    /**
     * 如何处理支付
     * 1、从购物车生成订单，生成订单后进行支付
     * 2、订单编号 uuid 商用的是雪花算法
     * fore/zhifu.action
     */
    @RequestMapping("/zhifu.action")
    public void zhifu(HttpServletRequest request,HttpServletResponse response,HttpSession session){
        //获取用户信息
        Users users = (Users) session.getAttribute("user");
        //获取用户id
        Integer uid = users.getUid();
        //获取购物车
        List<Carshop> carlist = (List<Carshop>) session.getAttribute("carlist");
        //需要地址
        Address address = new Address();
        Integer aid = -1;
        //获取在结算中选中的商品 getParameterValues获取复选框多个值
        String[] pids = request.getParameterValues("pid");
        //处理地址
        String showadd = request.getParameter("showadd");
        //如果地址不为空
        if (showadd!=null){
            String cnee = request.getParameter("cnee");//收货人
            String phone = request.getParameter("phone");//收货人电话
            String newaddress = request.getParameter("newaddress");//收货人新的地址
            //进行赋值
            address.setCnee(cnee);
            address.setPhone(phone);
            address.setAddress(newaddress);
            address.setUid(uid);
            //新增地址
            aid = addressService.save(address);
        }else {
            //使用的原有地址
            aid = Integer.parseInt(request.getParameter("rdo"));
        }
        //创建订单对象
        Xmorder order = new Xmorder();
        order.setStatus("未支付");
        order.setAddressid(aid);
        order.setRemarks(request.getParameter("beizhu"));
        String oid = UUID.randomUUID().toString().replace("-","".substring(1,17));
        order.setOid(oid);
        //总金额
        double total = Double.parseDouble(request.getParameter("total"));
        order.setTotalprice(total);
        order.setUid(uid);
        int num = 0;
        try {
            num = xmorderService.save(order,pids,carlist);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        if (num>0){
            //支付

        }
    }
}
