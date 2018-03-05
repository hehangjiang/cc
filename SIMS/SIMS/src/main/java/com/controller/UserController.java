package com.controller;


import com.model.User;
import com.model.Visitor;
import com.service.UserService;
import com.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.WriteListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lv on 17/7/3.
 */
@Controller
@RequestMapping("/User")
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public String login(User loginUser,HttpSession session){
        User res = userService.login(loginUser.getUserAccount(),loginUser.getUserPassword());
        if (res != null){
            session.setAttribute("user",res);
            return "redirect:/user.jsp";
        }
        return "redirect:/Login.jsp";
    }

    //注册
    @RequestMapping("/registered")
    public String registered(User newUser){
         userService.registered(newUser.getUserAccount(),newUser.getUserPassword(),newUser.getUserName(),
                newUser.getUserPhone(),newUser.getUserEmail(),newUser.getUserLocat(),newUser.getUserNum());
         return "redirect:/Login.jsp";
    }

    //同意
    @RequestMapping("/agree")
    @ResponseBody
    public Integer agree(String visitorName, String host, String visitTime){
       return userService.agree(visitorName,host,visitTime);
    }

    //不同意
    @RequestMapping("/disagree")
    @ResponseBody
    public void disagree(String visitorName, String host, String visitTime){
        userService.disagree(visitorName,host,visitTime);
    }

    //以下多个统计方式
    @RequestMapping("/countAll")
    @ResponseBody
    public Integer countAll(String userName){
        return userService.countAll(userName);
    }


    @RequestMapping("/pending")
    @ResponseBody
    public Integer pending(String userName){
        return userService.pending(userName);
    }

    @RequestMapping("/pass")
    @ResponseBody
    public Integer pass(String userName){
        return userService.pass(userName);
    }

    @RequestMapping("/visitedNum")
    @ResponseBody
    public Integer visitedNum(String userName){
        return userService.visitedNum(userName);

    }

    //获取已同意的列表
    @RequestMapping("/agreed")
    @ResponseBody
    public List<Visitor> agreed(String userName){
        return userService.queryAgree(userName);
    }

    //获取带处理的列表
    @RequestMapping("/getPending")
    @ResponseBody
    public List<Visitor> getPending(String userName){
        return userService.getPending(userName);
    }

    @RequestMapping("queryByCC")
    @ResponseBody
    public List<String> queryByCC(String[] colorCode){
        return userService.queryByCC(colorCode);
    }

}
