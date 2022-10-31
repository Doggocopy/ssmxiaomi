package com.ryan.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-19 21:28
 * @Description: 验证码控制器
 * @Version: 1.0
 */
@Controller
@ResponseBody
public class ImageYzm {
    @RequestMapping("/yzmcontroller.action")
    public void yzm(HttpSession session, HttpServletResponse response){
        response.setContentType("image/jpeg");
        //设置不能缓存
        response.setHeader( "Cache-Control" , "no-store" );
        //Directs caches not to store the page under any circumstance
        response.setDateHeader( "Expires" , 0);
        //Causes the proxy cache to see the page as "stale"
        response.setHeader( "Pragma" , "no-cache" );



        //图片的宽度和高度
        int width=60,height=20;
        //访问图像数据库缓冲区
        BufferedImage pic = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        //Graphic程序画布
        Graphics gc = pic.getGraphics();
        //设置背景色
        gc.setColor(getRandomColor(200,251));
        //填充矩形
        gc.fillRect(0,0,width,height);
        //设置字体
        gc.setFont(new Font("宋体",Font.PLAIN,20));
        //设置干扰线
        Random r = new Random();
        for (int i = 0;i<360;i++){
            int x1 = r.nextInt(width);
            int y1 = r.nextInt(height);
            int x2 = r.nextInt(15);
            int y2 = r.nextInt(15);
            //干扰线条颜色 要和背景色区分开
            gc.setColor(getRandomColor(160,200));
            //划线
            gc.drawLine(x1,y1,x2,y2);
        }
        for (int i =0;i<360;i++){
            int x1 = r.nextInt(width);
            int y1 = r.nextInt(height);
            //点的颜色
            gc.setColor(getRandomColor(120,160));
            //划线
            gc.drawOval(x1,y1,0,0);
        }

        //生成验证码
        String  RS = r.nextInt(9000)+1000+"";
        gc.setColor(new Color(45,89,163));
        //将验证码添加到图片中
        gc.drawString(RS,10,16);

        gc.dispose();

        session.setAttribute("random",RS);

        //生成图片
        try {
            ImageIO.write(pic,"JPEG",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    //随机生成颜色
    public static Color getRandomColor(int min,int max){
        Random r = new Random();
        if (min>255){
            min = 255;
        }
        if (max>255){
            max = 255;
        }
        //RGB 三原色
        int red = r.nextInt(max-min)+min;
        int green = r.nextInt(max-min)+min;
        int blue = r.nextInt(max-min)+min;
        return new Color(red,green,blue);
    }
}
