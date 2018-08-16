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
import java.util.List;

@Controller
@RequestMapping("/type")
public class TypeController {
    @Resource(name="typeService")
    private TypeService typeService;
    private Type type;
    @Resource(name="blogService")
    private BlogService blogService;
    @RequestMapping("/typeinfo")
    public ModelAndView typeinfo(Type type,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Type> typeList=typeService.selectTypeList(type);
        PageInfo<Type> typePage=new PageInfo<>(typeList);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("typeList",typeList);
        modelAndView.addObject("page",typePage);
        modelAndView.setViewName("/Blog-Back/back-type-info");
        return modelAndView;
    }
    @RequestMapping("/findTypeByName")
    public ModelAndView findTypeByName(Type type,Integer pageNum){
        if(pageNum==null){
            PageHelper.startPage(1,5);
        }else {
            PageHelper.startPage(pageNum,5);
        }
        List<Type> typeList=typeService.selectTypeList(type);
        PageInfo<Type> typePage=new PageInfo<>(typeList);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("findList",typeList);
        modelAndView.addObject("page",typePage);
        modelAndView.addObject("findName",type.getName());
        modelAndView.setViewName("/Blog-Back/back-type-find");
        return modelAndView;
    }
    @RequestMapping("deleteType")
    public void deleteType(Integer id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Blog blog=blogService.selectBlogByTid(id);
        if(blog!=null){
            typeService.deleteType(id);
        }else{
            request.setAttribute("msg","分类下有博文！不可删除");
        }
       request.getRequestDispatcher("/type/typeinfo.action").forward(request,response);
    }
    @RequestMapping("deleteTypeByFind")
    public void deleteTypeByFind(Integer id,String name, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Blog blog=blogService.selectBlogByTid(id);
        if(blog!=null){
            typeService.deleteType(id);
        }else{
            request.setAttribute("msg","分类下有博文！不可删除");
        }
        request.setAttribute("name",name);
        request.getRequestDispatcher("/type/findTypeByName.action").forward(request,response);
    }
    @RequestMapping("insertType")
    public void insertType(Type form,HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        type=typeService.selectTypeByName(form.getName());
        if(type!=null){
            request.setAttribute("msg","该分类已经存在啦~");
            request.setAttribute("name",form.getName());
            request.setAttribute("sort",form.getSort());
            request.getRequestDispatcher("/jsp/Blog-Back/back-type-add.jsp").forward(request,response);
        }else{
            typeService.insertType(form);
            response.sendRedirect("/type/typeinfo.action");
        }
    }
    @RequestMapping("/editTypePro")
    public ModelAndView editTypePro(Integer id){
        type=typeService.selectTypeById(id);
        ModelAndView modelAndView =new ModelAndView();
        modelAndView.addObject("type",type);
        modelAndView.setViewName("/Blog-Back/back-type-edit");
        return modelAndView;
    }

    @RequestMapping("updateType")
    public ModelAndView updateType(Type form) throws ServletException, IOException {
        ModelAndView modelAndView=new ModelAndView();
        Type type1=typeService.selectTypeById(form.getId());
        type=typeService.selectTypeByName(form.getName());
        if(!type1.getName().equals(form.getName())){
            if(type!=null){
                modelAndView.addObject("msg","该分类已经存在啦~");
                modelAndView.setViewName("/Blog-Back/back-type-edit");
                return modelAndView;
            }else{
                typeService.updateType(form);
                return new ModelAndView("redirect:/type/typeinfo.action");
            }
        }else{
            typeService.updateType(form);
            return new ModelAndView("redirect:/type/typeinfo.action");
        }
    }
    @RequestMapping("/typeAllForBlog")
    public ModelAndView typeAllForBlog(Type type){
        List<Type> typeList=typeService.selectTypeList(type);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("typeList",typeList);
        modelAndView.setViewName("/Blog-Back/back-blog-add");
        return modelAndView;
    }
}
