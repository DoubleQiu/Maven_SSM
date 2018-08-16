package com.ball.blog.controller;

import com.ball.blog.po.Blog;
import com.ball.blog.po.Type;
import com.ball.blog.service.BlogService;
import com.ball.blog.service.TypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/blog")
public class BlogController {
    @Resource(name="typeService")
    private TypeService typeService;
    @Resource(name="blogService")
    private BlogService blogService;
    private Blog blog;

    @RequestMapping("/bloginfo")
    public ModelAndView bloginfo(Blog blog,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Blog> blogList=blogService.selectBlogList(blog);
        PageInfo<Blog> blogPage=new PageInfo<>(blogList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("blogList",blogList);
        modelAndView.addObject("page",blogPage);
        modelAndView.setViewName("/Blog-Back/back-blog-info");
        return modelAndView;
    }

    @RequestMapping("/findBlogByName")
    public  ModelAndView findBlogByName(Blog blog,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Blog> blogList=blogService.selectBlogList(blog);
        PageInfo<Blog> blogPage=new PageInfo<>(blogList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("findList",blogList);
        modelAndView.addObject("page",blogPage);
        modelAndView.addObject("title",blog.getTitle());
        modelAndView.setViewName("/Blog-Back/back-blog-find");
        return modelAndView;
    }

    @RequestMapping("/deleteBlog")
    public ModelAndView deleteBlog(Integer id){
        blogService.deleteBlog(id);
        return new ModelAndView("redirect:/blog/bloginfo.action");
    }
    @RequestMapping("/deleteBlogByTitle")
    public void deleteBlogByTitle(Integer id, String title, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        blogService.deleteBlog(id);
        request.setAttribute("title",title);
        request.getRequestDispatcher("/blog/findBlogByName.action").forward(request,response);
    }
    @RequestMapping("/insertBlog")
    public ModelAndView insertBlog(Blog blog){
        blog.setPraise(0);
        blog.setRead(0);
        blog.setTime(new Date());
        blogService.insertBlog(blog);
        return new ModelAndView("redirect:/blog/bloginfo.action");
    }

    @RequestMapping("/editBlogPro")
    public ModelAndView editBlogPro(Integer id,Type type){
        List<Type> typeList=typeService.selectTypeList(type);
        blog=blogService.selectBlogById(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("blog",blog);
        modelAndView.addObject("typeList",typeList);
        modelAndView.setViewName("/Blog-Back/back-blog-edit");
        return  modelAndView;
    }

    @RequestMapping("/updateBlog")
    public ModelAndView updateBlog(Blog blog){
        blogService.updateBlog(blog);
        return  new ModelAndView("redirect:/blog/bloginfo.action");
    }
}
