package com.ryan.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * @BelongsProject: 20220927mybatis
 * @BelongsPackage: com.ryan.ssm.controller
 * @Author: Ryan Hou
 * @CreateTime: 2022-10-23 22:51
 * @Description: TODO
 * @Version: 1.0
 */
@Controller
public class DownLoadController {
    /**
     *
     * @param response 响应的内容
     * @param path 下载路径
     * @param realName 文件原始名字
     */
    @RequestMapping("/down.action")
    public void down(HttpServletResponse response,String path,String realName){
        InputStream is = null;
        OutputStream os = null;
        try {
            response.addHeader("Content-Disposition","attachment; filename="+
                    new String(realName.getBytes("UTF-8"),"ISO-8859-1"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        File file = new File(path);
        //使用流
        try {
            is = new FileInputStream(file);
            os = response.getOutputStream();
            //一次处理2k
            byte[] bytes = new byte[2048];
            int length = 0;
            while ((length=is.read(bytes)) != -1){
                os.write(bytes,0,length);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (os!=null){
                try {
                    os.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
            if (is!=null){
                try {
                    is.close();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }

    }
}
