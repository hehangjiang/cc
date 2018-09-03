package com.controller;

import com.model.Visitor;
import com.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: hhj
 * @Description:
 * @Date: Created in 2018-02-17
 */

@Controller
@RequestMapping("Visitor")
public class VisitorController {

    @Resource
    private VisitorService visitorService;

    private String imageUrl;


    @RequestMapping("/application")
    public String application(Visitor visitor){
        System.out.println(imageUrl);
        visitor.setVisitorPic(imageUrl);
        int i = visitorService.application(visitor.getVisitorName(),visitor.getVisitorPhone(),visitor.getVisitorEmail(),
                visitor.getHost(), visitor.getVisitTime(), visitor.getMessage(),visitor.getVisitorPic());
        if(i !=0){
            return "redirect:/index.jsp";
        }else {
            return "redirect:/application.jsp";
        }
    }



    @RequestMapping("/imageUpload")
    public String  springUpload(HttpServletRequest request, HttpServletResponse response) throws IllegalStateException, IOException
    {
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
                request.getSession().getServletContext());
        //检查form中是否有enctype="multipart/form-data"
        if(multipartResolver.isMultipart(request))
        {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
            //获取multiRequest 中所有的文件名
            Iterator iter=multiRequest.getFileNames();

            //按日期新建文件夹，保证每天来访的人员的信息单独分开
            SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd");
            String date = dateFormat.format(new Date());
            String basepath = "C:\\Users\\Administrator\\Desktop\\save\\" + date;
            System.out.println(basepath);
            File savefile = new File(basepath);
            if(!savefile.exists()){
                savefile.mkdirs();
            }


            //一次遍历所有文件
            MultipartFile file=multiRequest.getFile(iter.next().toString());
            if(file!=null)
            {
                //防止用户上传的图片名字重复
                String imageName = (new SimpleDateFormat("yyyyMMddHHmmssSSS")).format(new Date()) + "-" +  file.getOriginalFilename();
                String path= basepath + "\\" + imageName;
                imageUrl = path;
                //上传
                file.transferTo(new File(path));
            }

        }
        long  endTime=System.currentTimeMillis();
        System.out.println("运行时间："+String.valueOf(endTime-startTime)+"ms");

        return imageUrl;
    }




}
