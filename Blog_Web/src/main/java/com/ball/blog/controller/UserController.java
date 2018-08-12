package com.ball.blog.controller;

import com.ball.blog.po.User;
import com.ball.blog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class UserController{
    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping("/select")
    public ModelAndView selectAll(){
        List<User> userList = userService.selectAll();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("userList",userList);
        modelAndView.setViewName("user/userList");
        return modelAndView;
    }
}
