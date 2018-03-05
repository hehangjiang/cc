package com.Interceptor;

import com.service.UserService;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lv on 17/9/4.
 */
//public class PermissionInterceptor implements HandlerInterceptor{
//    @Resource
//    private UserService userService;
//
//    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView view){
//
//    }
////    public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handle){
////        String Path=request.getServletPath();
////        String id=String.valueOf( request.getSession().getAttribute("UserID"));
////
////        System.out.println("id="+id+"  Path:"+Path);
////        int result=userService.selectRoleMenu(id,Path);
////        System.out.println("result:"+result);
////        if(result==1){
////            return true;
////        }else{
////            return true;
////        }
//
//    }
////    public void afterCompletion(HttpServletRequest arg0,HttpServletResponse arg1,Object arg2,Exception arg3){
////
////    }
//
////}

