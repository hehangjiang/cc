package com.controller;

import com.model.Visitor;
import com.service.UserService;
import com.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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


    @RequestMapping("/application")
    public String application(Visitor visitor){
        int i = visitorService.application(visitor.getVisitorName(),visitor.getVisitorPhone(),visitor.getVisitorEmail(),
                visitor.getHost(), visitor.getVisitTime(), visitor.getMessage());
        if(i !=0){
            return "redirect:/index.jsp";
        }else {
            return "redirect:/application.jsp";
//            return "<script>alert('请先登录');</script>";
        }
    }



}
