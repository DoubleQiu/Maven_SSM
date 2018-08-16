package com.ball.blog.controller;

import com.ball.blog.po.Blog;
import com.ball.blog.po.Type;
import com.ball.blog.po.User;
import com.ball.blog.service.BlogService;
import com.ball.blog.service.TypeService;
import com.ball.blog.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("/user")
public class UserController{
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "typeService")
    private TypeService typeService;
    @Resource(name = "blogService")
    private BlogService blogService;
    private User user;

    @RequestMapping("/login")
    public ModelAndView login(String username, String password, HttpSession session){
        ModelAndView modelAndView =new ModelAndView();
        Map<String,String> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        user=userService.login(map);
        User blogger=userService.selectByUserPermission("博主");
        List<Type> typeList=typeService.selectTypeList(null);
        List<Blog> blogList=blogService.selectBlogList(null);
        if(user!=null){
            //用户信息
            session.setAttribute("user",user);
            session.setAttribute("blogger",blogger);
            session.setAttribute("typeList",typeList);
            session.setAttribute("blogList",blogList);

            modelAndView.setViewName("/Blog-Portal/index");
        }
        else {
            modelAndView.addObject("username",username);
            modelAndView.addObject("password",password);
            modelAndView.addObject("msg","账号或密码错误!");
            modelAndView.setViewName("Blog-Portal/login");
        }
        return modelAndView;
    }

    @RequestMapping("/backLogin")
    public ModelAndView backLogin(String username, String password,HttpSession session){
        ModelAndView modelAndView =new ModelAndView();
        Map<String,String> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        user=userService.login(map);
        if(user!=null){
            if(!user.getPermission().equals("博主")){
                modelAndView.addObject("username",username);
                modelAndView.addObject("password",password);
                modelAndView.addObject("msg","后台属于博主登录哦!咱去首页看看吧~");
                modelAndView.setViewName("Blog-Back/back-login");
            }else{
                session.setAttribute("blogger",user);
                modelAndView.setViewName("/Blog-Back/back-index");
            }
        }
        else {
            modelAndView.addObject("username",username);
            modelAndView.addObject("password",password);
            modelAndView.addObject("msg","账号或密码错误!不是博主？咱去首页！");
            modelAndView.setViewName("Blog-Back/back-login");
        }
        return modelAndView;
    }

    @RequestMapping("/register")
    public ModelAndView register(User from){
        ModelAndView modelAndView = new ModelAndView();
        Random random=new Random();
        int i=random.nextInt(3)+1;
        user=userService.selectByUsername(from.getUsername());
        if(user!=null){
            modelAndView.addObject("msg","该账号已经被注册");
            modelAndView.addObject("user",from);
            modelAndView.setViewName("Blog-Portal/register");
        }else{
            from.setHead("/head/"+i+".jpg");
            from.setPermission("普通用户");
            userService.register(from);
            modelAndView.setViewName("Blog-Portal/login");
        }
        return modelAndView;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession session){
        session.invalidate();
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.setViewName("/Blog-Portal/login");
        return modelAndView;
    }

    @RequestMapping("/backLogout")
    public ModelAndView backLogout(HttpSession session){
        session.invalidate();
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.setViewName("/Blog-Back/back-login");
        return modelAndView;
    }

    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User form, HttpSession session){
        System.out.println(form.getId());
        userService.updateUser(form);
        user=userService.selectById(form.getId());
        ModelAndView modelAndView =new ModelAndView();
        session.setAttribute("user",user);
        modelAndView.setViewName("/Blog-Portal/blogger");
        return modelAndView;
    }

    @RequestMapping("/userinfo")
    public ModelAndView userinfo(User user,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<User> userList = userService.selectUserList(user);
        PageInfo<User> userPage=new PageInfo<>(userList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("userList",userList);
        modelAndView.addObject("page",userPage);
        modelAndView.setViewName("/Blog-Back/back-user-info");
        return modelAndView;
    }

    @RequestMapping("/deleteUser")
    public void deleteUser(Integer id, String permission,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!permission.equals("博主")) {
            userService.deleteUser(id);
        }else{
            request.setAttribute("msg","不可删除博主");
        }
        request.getRequestDispatcher("/user/userinfo.action").forward(request,response);
    }
    @RequestMapping("/deleteUserByFind")
    public void deleteUserByFind(Integer id, String permission,String username,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("username",username);
        if(!permission.equals("博主")) {
            userService.deleteUser(id);
        }else{
            request.setAttribute("msg","不可删除博主");
        }
        request.getRequestDispatcher("/user/findUserByUsername.action").forward(request,response);
    }
    @RequestMapping("/findUserByUsername")
    public ModelAndView findUserByUsername(User user,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<User> userList=userService.selectUserList(user);
        ModelAndView modelAndView=new ModelAndView();
        PageInfo<User> userPage=new PageInfo<>(userList);
        modelAndView.addObject("findList",userList);
        modelAndView.addObject("page",userPage);
        modelAndView.addObject("findName",user.getUsername());
        modelAndView.setViewName("/Blog-Back/back-user-find");
        return modelAndView;
    }


}
