package com.ryan.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.ryan.ssm.pojo.ProductInfo;
import com.ryan.ssm.pojo.ProductType;
import com.ryan.ssm.pojo.vo.ProductVo;
import com.ryan.ssm.service.ProductInfoService;
import com.ryan.ssm.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-18 22:49
 * @Description: TODO
 * @Version: 1.0
 */
@Controller
@RequestMapping("/prod")
public class ProductInfoController {

    //后台通过常量 控制每一页显示几条数据
    public static final int PAGE_SIZE =5;
    @Autowired
    private ProductInfoService productInfoService;
    @Autowired
    private ProductTypeService productTypeService;

    /**
     * 显示商品信息 分页
     * @param page
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/split.action")
    public String split(Integer page, HttpSession session, Model model){
        //获取所有的产品类别
        List<ProductType> productTypeList = productTypeService.getAll();
        model.addAttribute("ptlist",productTypeList);
        session.setAttribute("ptlist",productTypeList);
        //处理分页
        Integer p = 1;
        if (page!=null){
            p=page;
        }
        if (page==null){
            page = p;
        }
                                                   //第几页  每页显示几条数据
        PageInfo pageInfo =productInfoService.split(page,PAGE_SIZE);//分页
        model.addAttribute("pb",pageInfo);
        return "product";
    }

    /**
     * 多条件组合查询 + 分页
     * @param vo
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/mySplict.action")
    public String mySplict(ProductVo vo,HttpSession session,Model model){
        //获取一下类别
        List<ProductType> ptlist = productTypeService.getAll();
        model.addAttribute("ptlist",ptlist);
        //分页
        PageInfo<ProductInfo> pageInfo = productInfoService.splitPageVo(vo,PAGE_SIZE);
        //存页面
        model.addAttribute("pb",pageInfo);
        session.setAttribute("ptlist",ptlist);
        session.setAttribute("pb",pageInfo);
        //数据回显 查询后表单数据依然存在
        session.setAttribute("vo",vo);
        return "product";
    }
    @RequestMapping("/show5.action")
    public String show5(HttpSession session){
        //${pb.list}
        PageInfo pageInfo = productInfoService.split(1,PAGE_SIZE);
        session.setAttribute("pb",pageInfo);
        return "redirect:/main.jsp";
    }

    @RequestMapping("/delete.action")
    public String delete(Integer pid,Integer isPage,Model model){
        productInfoService.deleteById(pid);

        return "product";
    }
}
